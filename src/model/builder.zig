const std = @import("std");
const builtin = @import("builtin");
const layer_api = @import("layers.zig");
const Evaluation = @import("common_functions.zig").Evaluation;
const ActivationFuncTag = @import("common_functions.zig").ActivationFuncTag;
const ActivationFunction = @import("common_functions.zig").ActivationFunction;

const Layer = layer_api.Layer;
const LayerOptions = layer_api.LayerOptions;
const LayerTest = layer_api.LayerTest;
const LayerInfo = layer_api.LayerInfo;
const LayerType = layer_api.LayerType;
const LayerDim = layer_api.LayerDim;
const LayerSize = layer_api.LayerSize;
const LayerDimension = layer_api.LayerDimension;
const LayerDataShapes = layer_api.LayerDataShapes;
const LayerShapes = layer_api.LayerShapes;
const Matrix = layer_api.Matrix;
const InputShapeConvention = layer_api.InputShapeConvention;

const LayerV2 = layer_api.LayerV2;
const LayerSettingsV2 = layer_api.LayerSettingsV2;
const LayerTypeV2 = layer_api.LayerTypeV2;
const print_fn = layer_api.print_fn;
const MatmulFn = layer_api.MatmulFn;


const PRINTMODE: layer_api.PrintMode = 
    if(builtin.cpu.arch != .riscv32 or builtin.is_test) 
        layer_api.PrintMode.debug_print 
    else 
        layer_api.PrintMode.log_output;


pub const ModelSource = enum {
    const_buffer,
    binary_blob,
    onnx,
    json,
};

/// The `param_map` is the mapping of the header portion of the byte message.
/// That represent the trained parameter kind. Below is how the mapping 
/// looks in the python script: 
/// -------------------------
/// ```python
/// param_map = {
///     "weight": {
///         "wx": 0,
///         "wh": 1,
///         "weight": 2,
///     },
///     "bias": {
///         "wx": 3,
///         "wh": 4,
///         "bias": 5,
///     },
/// }
/// ```
/// -------------------------
pub const ParamId = enum(u8){
    /// When the byte value is associated with the wx param.
    wx = 0,
    /// When the byte value is associated with the wh param.
    /// Only when the layer is of kind RNN. 
    wh = 1,
    /// When the byte value is associated with a fully connected weight param.
    weight = 2,
    wx_bias = 3,
    wh_bias = 4,
    bias = 5,

    pub fn from(id: u8) ParamId{
        return @enumFromInt(id);
    }
};

/// Mapping of the `dtype` portion of the header part of the message. 
/// -------------------------
/// ```python
/// dtype_code = {
///     "<f4": 1,
///     "<f2": 2,
///     "<bfloat16": 3,
///     "<i1": 4,
/// }
///
/// ```
/// -------------------------
pub const Dtype = enum(u8){
    f32 = 1,
    f16 = 2,
    bfloat16 = 3,
    i8 = 4,
    
    pub fn from(dtype_code: u8) Dtype{
        return @enumFromInt(dtype_code);
    }

    pub fn into(comptime self: Dtype) type{
        return switch (self) {
            .f32 => f32,
            .f16 => f16,
            .bfloat16 => f16,
            .i8 => i8,
        };
    }
};

//TODO: - replace some of the fields with to use LayerSettingsV2 directly

pub fn ParameterSet(comptime T: type) type{
    return struct {
        const Self = @This();

        layer_id: usize = 0,
        kind: LayerTypeV2 = .Input,
        activation: ?ActivationFuncTag = null,
        convention: InputShapeConvention = .RowSampleOrdering,
        out_feature: usize = 0,
        in_features: usize = 0,

        wx: ?[]const T = null,
        wh: ?[]const T = null,
        wx_bias: ?[]const T = null,
        wh_bias: ?[]const T = null,
        /// Used for the Dense/Output or pre-merged for RNN (wx_bias + wh_bias)
        bias: ?[]const T = null, 

        pub fn load_param(self: *Self, comptime header: Header, comptime payload: anytype) void{
            self.layer_id = header.layer_id;

            switch (header.param_id) {
                .wx, .weight => {
                    self.out_feature = header.shape.out_feature;
                    self.in_features = header.shape.in_features;
                    self.kind = header.layer_type;
                    self.activation = header.layer_activation;
                    self.convention = header.convention;
                    self.wx = &payload; // [H * D]T in payload.
                },
                .wh => {
                    // self.out_feature = header.shape.out_feature;
                    self.kind = header.layer_type;
                    self.activation = header.layer_activation;
                    self.convention = header.convention;
                    self.wh = &payload; // [H * H]T in payload.
                },
                .wx_bias, .wh_bias => {
                    // Expects both wx_bias and wh_bias
                    if(header.param_id == .wx_bias){
                        self.wx_bias = &payload;
                        self.kind = header.layer_type;
                        self.activation = header.layer_activation;
                        self.convention = header.convention;
                    }else{
                        self.wh_bias = &payload;
                        self.kind = header.layer_type;
                        self.activation = header.layer_activation;
                        self.convention = header.convention;
                    }
                },
                .bias => {
                    // For Layers that is not RNN such as Dense or Fully Connected ones
                    self.bias = &payload; // [H]T in payload.
                    self.kind = header.layer_type;
                    self.activation = header.layer_activation;
                    self.convention = header.convention;
                }
            }
        }

        pub fn getPayloadSize(comptime self: Self) usize{
            return self.out_feature * self.in_features;
        }

        // pub fn paramIntoFixedArray(self: *const Self, comptime param_id: ParamId, comptime bytes: []const u8) [N]T{
        //     const ByteArrayFixed = [@sizeOf([N]T)]u8;
        //     std.debug.assert(offset + @sizeOf([N]T) <= bytes.len);
        //
        //     // Take a pointer to the byte region and reinterpret into value.
        //     const arr_ptr: *const ByteArrayFixed = @ptrCast(&bytes[offset]);
        //     return std.mem.bytesToValue([N]T, arr_ptr);
        // }

        pub fn fully_loaded(self: *const Self) bool{
            return switch (self.kind) {
                // .Dense, .Output => (self.wx != null) and (self.wx_bias != null),
                .Dense, .Output => (self.wx != null) and (self.bias != null),
                .Rnn => (self.wx != null) and (self.wh != null) and 
                        ((self.bias != null) or (self.wx_bias != null) and (self.wh_bias != null)),
                else => true,
            };
        }

        /// During inference and when we have a RNN layer we have two bias parameters (`wx_bias` and `wh_bias`).
        /// At comptime we can merge these two biases to reduce one extra arithmetic operation step from the 
        /// RNN layer. So we sum them as: `bias = wx_bias + wh_bias`. Vector operations in zig usally utilize 
        /// SIMD instructions if available, if not it will use loop-based operations to calculate it. Which 
        /// can be expensive during inference. 
        /// *NOTE*
        /// ```
        /// Each created Layer type, will keep the state of only one bias vector. 
        /// ```
        pub fn merge_bias(comptime self: *const Self, comptime N: usize) [N]T{
            // pub fn merge_bias(comptime self: *const Self, comptime N: usize) @Vector(N, T){
            std.debug.assert(self.fully_loaded());
            std.debug.assert(self.kind == .Rnn);
            
            const wx_bias: @Vector(N, T) = self.wx_bias.?[0..N].*; // from slice to vec / array type by dereferencing.
            const wh_bias: @Vector(N, T) = self.wh_bias.?[0..N].*;

            return wx_bias + wh_bias;
        }
    };
}



/// Represent one `Header` portion slice from the embeded file bytes, 
/// corresponding to the loaded (trained) model. This describe one 
/// parameter of a specific `layer_id`.
pub const Header = struct {
    /// Which layer it belongs to. 
    layer_id: u8,
    layer_type: LayerTypeV2,
    layer_activation: ?ActivationFuncTag,
    /// Type or kind of parameter. E.g., Weight matrices (Wₓ , Wₕ), 
    /// or bias.
    param_id: ParamId,
    dtype_code: Dtype,
    convention: InputShapeConvention,
    /// Dimension or the shape of the associated `param_id`.
    /// For example the parameter Wₓ ∈ ℝᴴ ˣ ᴰ, so the shapes
    /// becomes `.{H, D}`
    shape: struct{out_feature: u8, in_features: u8},

    pub const HEADER_LEN: usize = 8;

    /// Creates Header from the byte format: 
    /// <layer_id, layer_type, param_id, dtype_code, convention, out_dim, in_dim>
    pub fn fromOffset(comptime offset: usize, comptime data: []const u8) Header{
        // const header_size: usize = @sizeOf(Header); 
        const header_size: usize = HEADER_LEN; 

        std.debug.assert(offset + header_size <= data.len);

        const header_slice = data[offset..offset + header_size];

        return Header{
            .layer_id = header_slice[0],
            .layer_type = LayerTypeV2.from(header_slice[1]),
            .layer_activation = ActivationFuncTag.fromInt(header_slice[2]),
            .param_id = ParamId.from(header_slice[3]),
            .dtype_code = Dtype.from(header_slice[4]),
            .convention = InputShapeConvention.from(header_slice[5]),
            .shape = .{.out_feature = header_slice[6], .in_features = header_slice[7]},
        };
    }

    pub fn print_header(self: Header) void{
        if(builtin.mode == .Debug){
            std.debug.print("<layer_id, layer_type, layer_activation, param_id, dtype_code, convention, out_dim, in_dim> = <{d}, {s}, {s}, {s}, {s}, {s}, {d}, {d}>\n", .{
                self.layer_id, @tagName(self.layer_type), self.layer_activation orelse "null", 
                @tagName(self.param_id), @tagName(self.dtype_code), @tagName(self.convention),
                self.shape.out_feature, self.shape.in_features,
            });
        }
    }

    pub fn numberOfElements(comptime self: Header) usize{
        // return @intCast((@as(usize, self.shape.@"0") * @as(usize, self.shape.@"1")));
        return @intCast((@as(usize, self.shape.out_feature) * @as(usize, self.shape.in_features)));
    }

    pub fn getNumberOfBytes(comptime self: Header, comptime dataType: type) comptime_int{
        return self.numberOfElements() * @sizeOf(dataType);
    }
    
    pub fn getShapes(comptime self: Header) struct{usize, usize} {
        return .{@intCast(self.shape.out_feature), @intCast(self.shape.in_features)};
    }

    pub fn getParamShape(comptime self: Header) ?struct{usize, usize}{
        const D = self.shape.in_features;
        const H = self.shape.out_feature;

        return switch (self.layer_type) {
            .Dense, .Output => switch (self.param_id) {
                .wx, .weight => .{ H, D },              // PyTorch convention-order: [out, in].
                .wx_bias, .bias => .{ H, 1 },           // store as H × 1 in embedded file.
                else => null,
            },
            .Rnn => switch (self.param_id) {
                .wx => .{ H, D },                       // Wx in the embedded file (loaded model)
                .wh => .{ H, H },                       // Wh (file of saved model)
                .wx_bias, .wh_bias, .bias => .{ H, 1 },
                else => null,
            },
            else => null,
        };
    }

};

pub const ModelConfig = struct {
    batch: usize,
    timewindow: usize,
    layer_count: usize,
    path: []const u8,
    convention: InputShapeConvention,
};

pub fn LoadedModel(comptime T: type, comptime ModelConf: ModelConfig) type{
    const ModelBuilder = Builder(T, ModelConf.path, ModelConf.convention);
    return struct {
        const Self = @This();
        pub const conf = ModelConf;
        // pub const loader = ModelBuilder;

        model: ParsedModelGraph(T, ModelConf.layer_count, ModelBuilder.intoLayerSettings(ModelConf.batch, ModelConf.timewindow, ModelConf.layer_count)),

        pub fn init() Self{
            return Self{
                .model = ModelBuilder.build_model(ModelConf.batch, ModelConf.timewindow, ModelConf.layer_count),
            };
        }
    };
}

fn zeroed_mat(comptime T: type, comptime Row: usize, comptime Col: usize) [Row][Col]T{
    return .{
        .{ @as(T, 0)} ** Col
    } ** Row;
}


/// Generic helper function that creates a tuple from a list of comptime known `LayerSettingsV2` objects.
pub fn ParsedModelGraph(comptime T: type, comptime N: usize, comptime SettingsList: [N]LayerSettingsV2) type{
    // comptime var layers: [SettingsList.len]type = undefined;
    comptime var layers: [N]type = undefined;
    inline for (SettingsList, 0..) |layer_cfg, i| {
        layers[i] = LayerV2(T, layer_cfg);
    }
    
    const NetworkTuple = std.meta.Tuple(&layers);

    // ---- compute maxima across RNN layers (compile-time) ----
    const MaxDimension = struct {
        fn max_in() usize {
            var m: usize = 1;
            inline for (SettingsList) |s| {
                if (s.kind == .Rnn and s.input_dim > m) m = s.input_dim;
            }
            return m;
        }
        fn max_h() usize {
            var m: usize = 1;
            inline for (SettingsList) |s| {
                if (s.kind == .Rnn and s.output_dim > m) m = s.output_dim;
            }
            return m;
        }
    };

    const MAX_IN = MaxDimension.max_in();
    const MAX_H  = MaxDimension.max_h();

    return struct{
        const Self = @This();
        pub const layer_settings = SettingsList;

        pub const NumberOfLayers = N; 
        pub const FirstInputDimension = SettingsList[0].getDimensionOf(.input_matrix);
        pub const OutputDimension = SettingsList[N - 1].getDimensionOf(.output_matrix);

        pub const InputMatrix = Matrix(T, FirstInputDimension.@"0",  FirstInputDimension.@"1", .owned);
        pub const InputMatrixView = Matrix(T, FirstInputDimension.@"0",  FirstInputDimension.@"1", .view);
        pub const OutputMatrix = Matrix(T, OutputDimension.@"0",  OutputDimension.@"1", .owned);
        pub const OutputMatrixView = Matrix(T, OutputDimension.@"0",  OutputDimension.@"1", .view);
        const OutputLayerIndex: usize = SettingsList.len - 1;

        pub const evaluator = Evaluation(T, SettingsList[0].timewindow);

        pub const RnnWorkspace = struct {
            col_buf: [MAX_IN]T,
            ht_buf: [MAX_H]T,

            pub fn initZeroes() RnnWorkspace {
                return .{
                    .col_buf = undefined,
                    .ht_buf = undefined,
                };
            }
        };

        pub const Optimization = enum {On, Off};


        network: NetworkTuple,
        rnn_workspace: RnnWorkspace,
        info: struct {
            num_layers: usize = NumberOfLayers,
            input_dimension: struct{usize, usize} = SettingsList[0].getDimensionOf(.input_matrix),
            output_dimension: struct{usize, usize} = SettingsList[N - 1].getDimensionOf(.output_matrix),
            cfg_list: [N]LayerSettingsV2 = SettingsList,
        },

        pub fn init(comptime settings_list: []const LayerSettingsV2, comptime param_list: []const ParameterSet(T)) Self{
            var self = Self{ 
                .network = undefined, // contains a tuple of different LayerV2 types.
                .rnn_workspace = .initZeroes(),
                .info = .{
                    .num_layers = NumberOfLayers,
                    .input_dimension = FirstInputDimension,
                    .output_dimension = OutputDimension,
                    .cfg_list = SettingsList,
                }
            }; 
            
            inline for(settings_list, param_list, 0..) |cfg, params, i|{
                self.network[i] = LayerV2(T, cfg).init(.{ .ParameterSet = params });
            }

            return self;
        }

        pub fn getLayerCfg(comptime i: usize) LayerSettingsV2{
            return SettingsList[i];
            // return self.info.cfg_list[i];
        }

        //WARN: - The `NetworkTuple` and tuple is zero-indexed, so the first layer with
        // `layer_id` = 1 will start at index 0 of the tuple. 

        pub fn get(self: *Self, comptime id: usize) *LayerV2(T, SettingsList[id - 1]){
            return &self.network[id - 1];
        }

        pub fn layer(self: Self, comptime id: usize) *const LayerV2(T, SettingsList[id - 1]){
            return &self.network[id - 1];
        }
        
        pub fn layer_ptr(self: *Self, comptime id: usize) *LayerV2(T, SettingsList[id - 1]){
            return &self.network[id - 1];
        }

        fn OutMatrixType(comptime i: usize) type {
            const S = SettingsList[i];
            return if (S.convention == .ColumnFeatureOrdering)
                // [H × T]
                Matrix(T, S.output_dim, S.timewindow, .owned)
            else
                // [T × H]
                Matrix(T, S.timewindow, S.output_dim, .owned);
        }


        fn EmptyOutMatrix(comptime i: usize) OutMatrixType(i){
            const Rows = OutMatrixType(i).Rows;
            const Cols = OutMatrixType(i).Cols;
            const zeroes: [Rows][Cols]T = zeroed_mat(T, Rows, Cols);

            return OutMatrixType(i).create(zeroes);
        }

        fn LayerOutputType(comptime i: usize) type {
            const dim = SettingsList[i].getDimensionOf(.output_matrix);
            return Matrix(T, dim.@"0", dim.@"1", .owned);
        }

        fn NextInputType(comptime i: usize) type {
            comptime {
                if (i + 1 >= NumberOfLayers)
                    @compileError("NextInputType called on last layer");
            }
            const dim = SettingsList[i + 1].getDimensionOf(.input_matrix);
            // return Matrix(T, dim.@"0", dim.@"1", .owned);
            return Matrix(T, dim.@"0", dim.@"1", .view);
        }

        fn propagate_optimized(self: *Self, comptime i: usize, X: anytype, comptime matmul_mode: MatmulFn) OutputMatrix{
            const S = SettingsList[i];

            if (S.kind == .Input) {
                if (i + 1 == NumberOfLayers) @panic("Model ends with Input layer");
                return self.propagate_optimized(i + 1, X, matmul_mode);
            }

            
            // var y: OutMatrixType(i) = OutMatrixType(i).zeroes();
            var y: OutMatrixType(i) = EmptyOutMatrix(i);
            // var y: OutMatrixType(i) = OutMatrixType(i).empty();

            // forwardpass_rnn_optimized(self, X, ws, out);
            if (self.network[i].kind == .Rnn) {
                self.network[i].feedforward_optimized(matmul_mode, X, &self.rnn_workspace, &y);
            } else {
                self.network[i].feedforward_optimized(matmul_mode, X, &self.rnn_workspace, &y);
            }
                
            if (i + 1 == NumberOfLayers) return y;

            // return self.propagate_optimized(i + 1, &y, matmul_mode); // WORKING
            
            // const NextInputMatrixView = NextInputType(i).fromBuffer(&y.mat);
            const NextInputMatrixView = NextInputType(i);
            return self.propagate_optimized(i + 1, &NextInputMatrixView.fromBuffer(&y.mat), matmul_mode);
            // return self.propagate_optimized(i + 1, &NextInputMatrixView, matmul_mode);

        }

        fn propagate(self: *Self, comptime i: usize, X: anytype) OutputMatrix {
            if (SettingsList[i].kind == .Input) {
                if (i + 1 == NumberOfLayers) @panic("Model ends with Input layer");
                return self.propagate(i + 1, X);
            }

            const y = self.network[i].feedforward(X) orelse unreachable;

            if (i + 1 == NumberOfLayers) return y;

            // return self.propagate(i + 1, &y); // WORKING

            const NextInputMatrixView = NextInputType(i).fromBuffer(&y.mat);
            return self.propagate(i + 1, &NextInputMatrixView);

        }

        /// Prediction logic - propagating through all the layers. 
        /// Since we mainly target embedded devices, recursive calls should be very sparsly used. 
        /// Instead we pass two indices. One for the current layer, and a second for the next 
        /// layer that needs the output data from the previous layer. 
        pub fn predict_old(self: *Self, x0: *const InputMatrix, comptime optim: Optimization, comptime matmul_mode: MatmulFn) OutputMatrix{
            return switch(optim){
                .On => self.propagate_optimized(0, x0, matmul_mode),
                .Off => self.propagate(0, x0)
            };
        }
        
        /// Prediction logic - propagating through all the layers. 
        /// Since we mainly target embedded devices, recursive calls should be very sparsly used. 
        /// Instead we pass two indices. One for the current layer, and a second for the next 
        /// layer that needs the output data from the previous layer. 
        pub fn predict(self: *Self, x0: *const InputMatrixView, comptime optim: Optimization, comptime matmul_mode: MatmulFn) OutputMatrix{
            return switch(optim){
                .On => self.propagate_optimized(0, x0, matmul_mode),
                .Off => self.propagate(0, x0)
            };
        }
        
        /// Prediction logic - propagating through all the layers. 
        /// But takes owned Matrix data. 
        pub fn predictOwned(self: *Self, x0: *const InputMatrix, comptime optim: Optimization, comptime matmul_mode: MatmulFn) OutputMatrix{
            const matrix_view = InputMatrixView.fromBuffer(&x0.mat);
            return self.predict(&matrix_view, optim, matmul_mode);
        }
        
        /// Prediction logic - propagating through all the layers. 
        /// But takes a *const view of the Matrix data. 
        pub fn predictView(self: *Self, x0: *const InputMatrixView, comptime optim: Optimization, comptime matmul_mode: MatmulFn) OutputMatrix{
            return switch(optim){
                .On => self.propagate_optimized(0, x0, matmul_mode),
                .Off => self.propagate(0, x0)
            };
        }


        /// The threshold value is based on the 98th quantile, of the validation dataset.
        /// It takes the mean over time and features using MSE loss from: 
        /// ```python
        /// scores = nn.functional.mse_loss(Y, X, reduction="none").mean(dim=(1, 2)).detach().cpu().numpy()
        /// def new_threshold(self, scores, quantile_val=0.98):
        ///     threshold = float(np.quantile(scores, quantile_val))
        /// ```
        /// "threshold": 2.7395969937060727e-06,
        pub fn eval_summary(_: Self, x: *const InputMatrixView, y: *const OutputMatrixView) void{
            const scores = evaluator.evaluation(x, y);

            print_fn(PRINTMODE, "Evaluation Metrics:\n\r\t\tMSE: {d}\r\n\t\tCosine Similarity Score: {d}\r\n\t\tCosine Distance: {d}\r\n\t\tWeighted Anomaly Score: {d}\n", .{
                scores.mse,
                scores.cos_similarity,
                scores.cos_distance,
                scores.anomaly_score,
            });

        }

        /// This sould be logic for running for N number of cycles (or windows) for 
        /// calculating a threshold or baseline value. That should be used when 
        /// quantifying anomaly scores. 
        pub fn calibrate_model(self: Self, comptime run_for: usize, score_buf: []T, data: *const InputMatrix) void{
            _ = self;
            _ = run_for; 
            _ = data;
            _ = score_buf;
            // for (0..run_for) |window|{
            //
            // }
        }
    };
}


/// This is a common type for loading and parsing pre-trained model
/// from external sources. Such as flatbuffers, const buffers, or 
/// via config parsing. 
pub fn Builder(comptime T: type, comptime path: []const u8, comptime Convention: InputShapeConvention) type {
    return struct {
        const Self = @This();
        
        // pub const model_bin linksection(".flash.rodata") = @embedFile(path);
        pub const model_bin linksection(".flash.rodata") = @embedFile(path);
        pub const convention = Convention;

        pub fn get_bytes() []const u8{
            return model_bin[0..model_bin.len];
        }

        pub fn bytes_info() void{
            if(builtin.mode == .Debug or builtin.is_test){
                std.debug.print("model bytes (len = {d}): {any}\n", .{
                    model_bin[0..model_bin.len].len, 
                    model_bin[0..model_bin.len]
                });
            }
        }

        pub fn bytesAsSlice(bytes: []const u8) []const T {
            return std.mem.bytesAsSlice(T, bytes[0 .. (bytes.len - bytes.len % @sizeOf(T))]);
        }

        pub fn readFixedArray(comptime N: usize, comptime offset: usize, comptime bytes: []const u8) [N]T{
            const ByteArrayFixed = [@sizeOf([N]T)]u8;
            std.debug.assert(offset + @sizeOf([N]T) <= bytes.len);

            // Take a pointer to the byte region and reinterpret into value.
            const arr_ptr: *const ByteArrayFixed = @ptrCast(&bytes[offset]);
            return std.mem.bytesToValue([N]T, arr_ptr);
        }

        /// This would return the `ParsedModelGraph` → tuple of LayerV2 types.
        /// While the function block would initialize each LayerV2 types in the tuple (or anonymous struct).
        pub fn build_model(comptime Batches: usize, comptime TimeWindow: usize, comptime NumLayers: usize) ParsedModelGraph(T, NumLayers, intoLayerSettings(Batches, TimeWindow, NumLayers)) {
            const cfg_list = comptime intoLayerSettings(Batches, TimeWindow, NumLayers);
            return comptime createModel(NumLayers, cfg_list);
        }

        pub fn LoadedModel(comptime Batches: usize, comptime Timewindow: usize, comptime NumLayers: usize) type{
            return ParsedModelGraph(T, NumLayers, intoLayerSettings(Batches, Timewindow, NumLayers));
        }

        fn createModel(comptime NumLayers: usize, comptime layer_settings: [NumLayers]LayerSettingsV2) ParsedModelGraph(T, NumLayers, layer_settings){
            // const layer_settings = intoLayerSettings(Batches, TimeWindow, NumLayers);
            const parameters_list = intoParameterSets(NumLayers);

            const Model = ParsedModelGraph(T, NumLayers, layer_settings);

            const model = Model.init(&layer_settings, parameters_list);

            // const model_size = @sizeOf(@TypeOf(model));
            // const model_kb: f32 = @as(f32, @floatFromInt(model_size)) / @as(f32, 1024);
            // std.log.warn("New model was loaded with size: {d:.6} KiB\n", .{model_kb});

            // std.debug.print("Created new Model: {any}", .{model.network});
            // @compileLog("Created new Model: ", model.network);
            return model;
        }

        pub fn intoParameterSets(comptime NumLayers: usize) []const ParameterSet(T){
            @setEvalBranchQuota(2000);

            comptime var offset: usize = 0; 
            const bytes: []const u8 = comptime get_bytes();
            // const header_size: usize = comptime @sizeOf(Header); 
            const header_size: usize = comptime Header.HEADER_LEN; 

            // src/model/builder.zig:391:68: error: expected type 'builder.ParameterSet(f32)', found 'type'
            // comptime var layer_sets: [NumLayers]ParameterSet(T) = .{ParameterSet(T)} ** NumLayers;

            comptime var layer_sets: [NumLayers]ParameterSet(T) = .{ParameterSet(T){}} ** NumLayers;
            comptime var processed_layers: [NumLayers]bool = .{false} ** NumLayers;
            // std.debug.print("Param data type: {s} → {d} bytes\n", .{@typeName(T), @sizeOf(T)});

            // const type_info_fmt = std.fmt.comptimePrint("Param data type: {s} → {d} bytes\n", .{@typeName(T), @sizeOf(T)});
            // @compileLog(type_info_fmt);

            // bytes_info();
            
            //  To extract a comptime-known length from a runtime-known offset,
            //  first extract a new slice from the starting offset, then an array of comptime-known length. 
            inline while(offset + header_size <= bytes.len) {
                const header = comptime Header.fromOffset(offset, bytes);
                const shape = comptime header.getShapes();
                const N = shape.@"0" * shape.@"1";

                const payload_start = offset + header_size; 
                const payload_end = payload_start + header.getNumberOfBytes(T);

                // header.print_header();
                // @compileLog("Header: ", header);

                // std.debug.print("Param Shape (shape0, shape_1): ({d}, {d}) → num_elements({d}) * sizeOf({s}) = {d} * {d} = {d} num_bytes\n", .{
                //     shape.@"0", shape.@"1", 
                //     header.numberOfElements(), @typeName(T), 
                //     header.numberOfElements(), @sizeOf(T), header.getNumberOfBytes(T), 
                // });

                // Reinterpret the payload as []const T (f32/f16/etc)
                const param_bytes: [N]T = readFixedArray(N, payload_start, bytes);
                std.debug.assert(N == header.numberOfElements());
                // std.debug.print("real byte array: {any}\n", .{param_bytes});

                // Map each parameter and load/assign in the layer's `ParameterSet`.
                const id = @as(usize, header.layer_id) - 1;
                var parameters = &layer_sets[id];

                if(!processed_layers[id]) {
                    processed_layers[id] = true;
                }

                // std.debug.print("wx_bias: {any}\n", .{parameters.wx_bias.?});
                // std.debug.print("wh_bias: {any}\n", .{parameters.wh_bias.?});
                // std.debug.print("merged bias: {any}\n", .{parameters.merge_bias(N)});

                parameters.load_param(header, param_bytes);
                offset = payload_end;
            }

            return &layer_sets;
        }

        /// Would convert into the specific type, e.g., a specific 
        /// layer type (RNN, Dense, etc).
        /// Header format: <layer_id, layer_type, param_id, dtype_code, convention, out_dim, in_dim>
        /// ----------------------------------------------------------
        ///     Example: [1, 3, 1, 1, 1, 1, 16, bytes[offset..offset + num_bytes]]
        ///     Same as: [layer_id, layer_type, param_id, dtype_code, convention, out_dim, in_dim, bytes] 
        ///       →     [layer_id=1, Rnn, wh, f32, ColumnFeatureOrdering, out_dim=1, in_dim=16, bytes]
        /// ----------------------------------------------------------
        pub fn intoLayerSettings(comptime Batches: usize, comptime TimeWindow: usize, comptime NumLayers: usize) [NumLayers]LayerSettingsV2{
            @setEvalBranchQuota(2000);

            comptime var offset: usize = 0; 
            const bytes: []const u8 = comptime get_bytes();
            const header_size: usize = comptime Header.HEADER_LEN; 

            comptime var layer_sets: [NumLayers]ParameterSet(T) = .{ParameterSet(T){}} ** NumLayers;
            comptime var processed_layers: [NumLayers]bool = .{false} ** NumLayers;
            
            //  To extract a comptime-known length from a runtime-known offset,
            //  first extract a new slice from the starting offset, then an array of comptime-known length. 
            inline while(offset + header_size <= bytes.len) {

                const header = comptime Header.fromOffset(offset, bytes);
                const shape = comptime header.getShapes();
                const N = shape.@"0" * shape.@"1";

                const payload_start = offset + header_size; 
                const payload_end = payload_start + header.getNumberOfBytes(T);

                // Reinterpret the payload as []const T (f32/f16/etc)
                const param_bytes: [N]T = readFixedArray(N, payload_start, bytes);
                std.debug.assert(N == header.numberOfElements());

                // Map each parameter and load/assign in the layer's `ParameterSet`.
                const id = @as(usize, header.layer_id) - 1;
                var parameters = &layer_sets[id];

                if(!processed_layers[id]) {
                    processed_layers[id] = true;
                }

                parameters.load_param(header, param_bytes);
                offset = payload_end;
            }

            comptime var settings_list: [NumLayers]LayerSettingsV2 = undefined;
            inline for(layer_sets, 0..) |params, i|{
                const input_features: usize = if(params.in_features != 0) params.in_features else 1;
                const out_features: usize = if(params.out_feature != 0) params.out_feature else 1;
                
                settings_list[i] = LayerSettingsV2{
                    .kind = params.kind,
                    .convention = params.convention,
                    .batch_size = Batches, 
                    .input_dim = input_features, // D: Input features.
                    .output_dim = out_features, // H: Layer Size.
                    .timewindow = TimeWindow, // T: Timesteps/TimeWindow
                    .activation = switch(params.kind){
                        .Dense => if(params.activation) |activation| .from(
                            activation, 
                            if(params.activation == .LeakyRelu) 0.01 else null
                        ) else null, 
                        .Output => null, 
                        .Rnn => .{.LeakyRelu = 0.01},
                        else => null,
                    }
                };
            }

            return settings_list;
        }
    };
}


pub fn createInputMatrix(comptime DataType: type, comptime Timesteps: usize, comptime InputFeatures: usize, comptime Convention: InputShapeConvention) switch (Convention) {
    .RowSampleOrdering => Matrix(DataType, Timesteps, InputFeatures, .owned),
    .ColumnFeatureOrdering => Matrix(DataType, InputFeatures, Timesteps, .owned),
}{
    const DataArray = comptime switch (Convention) {
        .RowSampleOrdering => [Timesteps][InputFeatures]DataType,
        .ColumnFeatureOrdering => [InputFeatures][Timesteps]DataType,
    };

    var data: DataArray = undefined;

    if (Convention == .RowSampleOrdering){
        for (0..Timesteps) |t| {
            for (0..InputFeatures) |d| {
                // e.g. T=4, D=3 → first row: 0,1,2; second row: 10,11,12; ...
                data[t][d] = @as(DataType, @floatFromInt(10 * t + d));
            }
        }
        return Matrix(DataType, Timesteps, InputFeatures, .owned).create(data);
    }else{
        for (0..InputFeatures) |d| {
            for (0..Timesteps) |t| {
                // e.g. D=3, T=4 → first row: 0,1,2,3; second row: 100,101,102,103; ...
                data[d][t] = @as(DataType, @floatFromInt(100 * d + t));
            }
        }
        return Matrix(DataType, InputFeatures, Timesteps, .owned).create(data);
    }
}


test "loading-model" {
    const batch_size: usize = 1;
    const timesteps: usize = 25; 
    const input_features: usize = 1;
    // const Henc: usize = 16;
    // const Hlat: usize = 8;
    // const Hdec: usize = 16;
    // const Convention: InputShapeConvention = .ColumnFeatureOrdering;
    const Convention: InputShapeConvention = .RowSampleOrdering;
    const NUM_LAYERS: usize = 4;
    
    std.debug.print("---Test--- Loading Model\n", .{});
    const ModelBuilderOld = Builder(
        f32, 
        // .binary_blob, 
        "assets/model.bin",
        Convention,
    );

    const ModelBuilder = LoadedModel(f32, .{
        .batch = batch_size,
        .timewindow = timesteps,
        .layer_count = NUM_LAYERS,
        .convention = .RowSampleOrdering,
        .path = "assets/model.bin",
    });

    // ModelBuilder.into(.ColumnFeatureOrdering);
    const modelz = ModelBuilderOld.build_model(batch_size, timesteps, NUM_LAYERS);
    var nn = ModelBuilder.init();
    // const M = @TypeOf(nn); // the parsed model type
    const M = @TypeOf(modelz); // the parsed model type
    const model_size = @sizeOf(@TypeOf(nn.model));
    std.debug.print("Loaded Model Size: {d}\n", .{model_size});


    //WARN: - The blob is written with NumPy C-order (row-major), so when constructing the 
    // weight matrix (wx) using .from_array it should always be loaded using the RowSampleOrdering
    // convention. After that we check the `Convention` constant, and transpose if it is equal to 
    // Convention == RowSampleOrdering, else we DO NOT transpose the matrix. 

    const convention = M.layer_settings[0].convention;
    // const convention = M.loader.convention;

    const fmt_header = switch (Convention) {
        .RowSampleOrdering => "Input Matrix(X) [Timesteps × InputFeatures]",
        .ColumnFeatureOrdering => "Input Matrix(X) [InputFeatures × Timesteps]",
    };

    //  Example dummy data generated by python script and pytorch.
    const data_rowmajor = [timesteps][input_features]f32{
        [_]f32 {-0.4876859188},
        [_]f32 {-0.3020118475},
        [_]f32 {0.7061636448},
        [_]f32 {0.4359272718},
        [_]f32 {-0.0697299242},
        [_]f32 {-0.5836150646},
        [_]f32 {-0.2674875259},
        [_]f32 {0.2294212580},
        [_]f32 {-0.8611040115},
        [_]f32 {-0.3987681866},
        [_]f32 {0.6154536009},
        [_]f32 {0.9459179640},
        [_]f32 {0.3141608238},
        [_]f32 {-0.7647800446},
        [_]f32 {0.9386945963},
        [_]f32 {0.4245246649},
        [_]f32 {-0.2712689638},
        [_]f32 {0.8509542942},
        [_]f32 {0.2871456146},
        [_]f32 {0.3422226906},
        [_]f32 {0.5088747740},
        [_]f32 {0.8308023214},
        [_]f32 {0.2569303513},
        [_]f32 {0.7799508572},
        [_]f32 {-0.1205641031},
    };

    // F32 Predicition:
    // [_]f32 [-0.4877843559],
    // [_]f32 [-0.2982844114],
    // [_]f32 [0.6903174520],
    // [_]f32 [0.4405644834],
    // [_]f32 [-0.0781098604],
    // [_]f32 [-0.6448472142],
    // [_]f32 [-0.2906247675],
    // [_]f32 [0.2253750116],
    // [_]f32 [-1.0249863863],
    // [_]f32 [-0.4563150704],
    // [_]f32 [0.6043699384],
    // [_]f32 [0.9814165235],
    // [_]f32 [0.3316794336],
    // [_]f32 [-0.9508733749],
    // [_]f32 [0.8311504126],
    // [_]f32 [0.4271713495],
    // [_]f32 [-0.3094446957],
    // [_]f32 [0.8263555169],
    // [_]f32 [0.2785192430],
    // [_]f32 [0.3506785631],
    // [_]f32 [0.5094102621],
    // [_]f32 [0.8353099227],
    // [_]f32 [0.2682046592],
    // [_]f32 [0.7919700742],
    // [_]f32 [-0.1484507471]


    // We feed the first RNN with [D × T] (Column) or [T × D] (Row):
    const X = Matrix(f32, timesteps, input_features, .owned).create(data_rowmajor);
    // const X = createInputMatrix(f32, timesteps, input_features, convention);
    _ = convention;

    // src/model/builder.zig:861:23: error: struct 'builder.LoadedModel(f32,.{ .batch = 1, .timewindow = 25, .layer_count = 4, .path = &.{ ... }[0..(...)], .convention = .RowSampleOrdering })' has no member named 'FirstInputDimension'


    // const InputDim = M.FirstInputDimension; // {rows, cols}
    // std.debug.assert(X.get_dimension().@"0" == InputDim.@"0");
    // std.debug.assert(X.get_dimension().@"1" == InputDim.@"1");
    X.print_matrix(fmt_header, .debug_print);

    // const layer_settings = ModelBuilder.loader.intoLayerSettings(batch_size, timesteps, NUM_LAYERS);


    inline for (1..NUM_LAYERS + 1) |id|{
        nn.model.layer(id).print_info();
        nn.model.layer(id).print_state();
    }

    // Per-layer runtime assertions (extra safety; most errors would already fail to compile)
    inline for (0..NUM_LAYERS) |i| {
        const id: usize = i + 1;
        const cfg = M.layer_settings[i];
        const Wdim = cfg.getDimensionOf(.weight_matrix);

        if (cfg.kind == .Dense or cfg.kind == .Output) {
            std.debug.assert(nn.model.layer(id).state.wx.rows == Wdim.@"0");
            std.debug.assert(nn.model.layer(id).state.wx.cols == Wdim.@"1");
        } else if (cfg.kind == .Rnn) {
            const Rdim = cfg.getDimensionOf(.rnn_weight_matrix);
            std.debug.assert(nn.model.layer(id).state.wx.rows == Wdim.@"0");
            std.debug.assert(nn.model.layer(id).state.wx.cols == Wdim.@"1");
            std.debug.assert(nn.model.layer(id).state.wh.?.rows == Rdim.@"0");
            std.debug.assert(nn.model.layer(id).state.wh.?.cols == Rdim.@"1");
            const H = cfg.getDimensionOf(.layer_size);
            _ = H; // bias is @Vector(H,T), shape guaranteed by type
        }
    }

    // Forward pass; output dims must match last layer
    const Y = nn.model.predict(&X, .Off, .hwlp);
    Y.print_matrix("Prediction", .debug_print);

    nn.model.eval_summary(&X, &Y);

    return error.SkipZigTest; 
}

test "loading-model-optimized" {
    const batch_size: usize = 1;
    const timesteps: usize = 25; 
    const input_features: usize = 1;
    // const Henc: usize = 16;
    // const Hlat: usize = 8;
    // const Hdec: usize = 16;
    // const Convention: InputShapeConvention = .ColumnFeatureOrdering;
    const Convention: InputShapeConvention = .RowSampleOrdering;
    _ = Convention;
    const NUM_LAYERS: usize = 4;
    
    std.debug.print("---Test--- Loading Model Optimized\n", .{});

    const ModelBuilder = LoadedModel(f32, .{
        .batch = batch_size,
        .timewindow = timesteps,
        .layer_count = NUM_LAYERS,
        .convention = .RowSampleOrdering,
        .path = "assets/model.bin",
    });

    // ModelBuilder.into(.ColumnFeatureOrdering);
    var nn = ModelBuilder.init();
    // const M = @TypeOf(nn); // the parsed model type
    const model_size = @sizeOf(@TypeOf(nn.model));
    std.debug.print("Loaded Model Size: {d}\n", .{model_size});

    inline for (1..NUM_LAYERS + 1) |id|{
        nn.model.layer(id).print_info();
        nn.model.layer(id).print_state();
    }

    //WARN: - The blob is written with NumPy C-order (row-major), so when constructing the 
    // weight matrix (wx) using .from_array it should always be loaded using the RowSampleOrdering
    // convention. After that we check the `Convention` constant, and transpose if it is equal to 
    // Convention == RowSampleOrdering, else we DO NOT transpose the matrix. 

    //  Example dummy data generated by python script and pytorch.
    const data_rowmajor = [timesteps][input_features]f32{
        [_]f32 {-0.4876859188},
        [_]f32 {-0.3020118475},
        [_]f32 {0.7061636448},
        [_]f32 {0.4359272718},
        [_]f32 {-0.0697299242},
        [_]f32 {-0.5836150646},
        [_]f32 {-0.2674875259},
        [_]f32 {0.2294212580},
        [_]f32 {-0.8611040115},
        [_]f32 {-0.3987681866},
        [_]f32 {0.6154536009},
        [_]f32 {0.9459179640},
        [_]f32 {0.3141608238},
        [_]f32 {-0.7647800446},
        [_]f32 {0.9386945963},
        [_]f32 {0.4245246649},
        [_]f32 {-0.2712689638},
        [_]f32 {0.8509542942},
        [_]f32 {0.2871456146},
        [_]f32 {0.3422226906},
        [_]f32 {0.5088747740},
        [_]f32 {0.8308023214},
        [_]f32 {0.2569303513},
        [_]f32 {0.7799508572},
        [_]f32 {-0.1205641031},
    };
    
    const X = Matrix(f32, timesteps, input_features, .owned).create(data_rowmajor);

    // Forward pass; output dims must match last layer
    const Y = nn.model.predict(&X, .On, .hwlp);
    Y.print_matrix("Prediction", .debug_print);

    nn.model.eval_summary(&X, &Y);

}
