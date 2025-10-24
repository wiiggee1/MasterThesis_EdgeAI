const std = @import("std");
const builtin = @import("builtin");
const math = std.math;
const testing = std.testing;
const assert = std.debug.assert;

const model = @import("model_builder.zig");
const builder = @import("builder.zig");
const HyperParameters = model.HyperParameters; 
const Builder = builder.Builder;

const common = @import("common_functions.zig");
const ActivationFunction = common.ActivationFunction;
const LossType = common.LossType;
const LossFunction = common.LossFunction;

const PRINTMODE: PrintMode = 
    if(builtin.target.os.tag != .freestanding or builtin.is_test) 
        PrintMode.debug_print 
    else 
        PrintMode.log_output;

/// Represent local layer data in the Neural Network. Such as the weight matrix and bias vector.
/// This generic type, utilize the `LayerType` base interface.
/// -------------------------
/// Row-Major → Output dim (m, k), when input [m][n], weights [n][k]:
///     input: batch × features, weight: features × output, output: batch × output. 
/// Where: X ∈ ℝ^{batch × features}.
/// -------------------------
/// Column-Major→ Output dim (k, m), when input [n][m], weights [k][n]:
///     input: features × batch, weight: output × features, output: output × batch. 
/// Where: X ∈ ℝ^{features × batch}.
pub fn LayerV2(comptime T: type, comptime LayerSettings: LayerSettingsV2) type{
    return struct {
        const Self = @This();

        pub const Settings = LayerSettings;
        /// Size of the layer in terms of number of neurons.
        // pub const SizeOfLayer: usize = LayerSettings.getDimensionOf(.layer_size);  // WORKING
        pub const SizeOfLayer: usize = LayerSettings.output_dim;  
        pub const BatchSize = LayerSettings.batch_size; 

        /// Prior layers output which is the input data to the current layer.
        pub const InputDim = LayerSettings.getDimensionOf(.input_matrix);
        pub const WeightDim = LayerSettings.getDimensionOf(.weight_matrix);
        /// The shape/dimension of the output matrix of the current layer.
        pub const OutputDim = LayerSettings.getDimensionOf(.output_matrix); 
        
        const H = LayerSettings.getDimensionOf(.rnn_state); // H = SizeOfLayer = Layer Size;
        const RnnWeightDimension = LayerSettings.getDimensionOf(.rnn_weight_matrix);

        pub const RegularizationOptions = enum {
            Norm,
            BatchNorm,
            DropOut,
        };

        const FullyConnected = struct {
            wx: Matrix(T, WeightDim.@"0", WeightDim.@"1"),
            // wx: MatrixV2(T, WeightDim.@"0", WeightDim.@"1", LayerSettings.convention),
            /// Biases for a layer is represented by a M x 1 matrix or row vector.
            /// Where M represent the `LayerSize`.
            bias: @Vector(SizeOfLayer, T),
        };

        /// For a RNN layer the weight matrix have the dimension: 
        /// [HiddenLayerSize][TimeWindowSize + HiddenLayerSize]
        const RnnLayer = struct {
            pub const RnnWeightDim = LayerSettings.getDimensionOf(.rnn_weight_matrix);

            wx: Matrix(T, WeightDim.@"0", WeightDim.@"1"),
            wh: Matrix(T, RnnWeightDim.@"0", RnnWeightDim.@"1"),
            // wx: MatrixV2(T, WeightDim.@"0", WeightDim.@"1", LayerSettings.convention),
            // wh: MatrixV2(T, RnnWeightDim.@"0", RnnWeightDim.@"1", LayerSettings.convention),
            bias: @Vector(SizeOfLayer, T),
        };

        const InputLayer = struct {
            const input_shape = LayerSettings.getDimensionOf(.input_matrix);
            /// input matrix(x): { inputFeatures, Timesteps } for column-major and { Timesteps, inputFeatures } when row-major.
            x: Matrix(T, input_shape.@"0", input_shape.@"1"), // Matrix<T, shape.@"0", shape@"1">
            // x: MatrixV2(T, input_shape.@"0", input_shape.@"1", LayerSettings.convention), // Matrix<T, shape.@"0", shape@"1">
        };

        const StateAPI = switch (LayerSettings.kind) {
            .Dense, .Output => FullyConnected,
            .Rnn => RnnLayer,
            else => struct {}
        };

        const State = struct {
            pub const wh_dim = LayerSettings.getDimensionOf(.rnn_weight_matrix);
            const RnnMatrix  = rnn:{
                if(LayerSettings.kind == .Rnn){
                    break :rnn ?Matrix(T, wh_dim.@"0", wh_dim.@"1");
                    // break :rnn ?MatrixV2(T, wh_dim.@"0", wh_dim.@"1", LayerSettings.convention);
                }else{
                    break :rnn if(LayerSettings.kind == .Rnn) @TypeOf(null) else {};
                    // break :rnn if(LayerSettings.kind == .Rnn) null else {};
                    // break :rnn if(LayerSettings.kind == .Rnn) null else {};
                }
            };
            
            wx: Matrix(T, WeightDim.@"0", WeightDim.@"1"),
            // wx: MatrixV2(T, WeightDim.@"0", WeightDim.@"1", LayerSettings.convention),
            wh: ?Matrix(T, wh_dim.@"0", wh_dim.@"1") = null,
            // wh: ?MatrixV2(T, wh_dim.@"0", wh_dim.@"1", LayerSettings.convention) = null,
            bias: @Vector(SizeOfLayer, T),
        };

        // layer_id: usize,
        // kind: LayerTypeV2,
        // wx: ?[]const T = null,
        // wh: ?[]const T = null,
        // bias: ?[]const T = null,
        // builder.ParameterSet

        pub const InitMode = union(CreateMode){
            /// Should contain parameter related data of: 
            /// E.g., .{ 1, LayerTypeV2.Rnn, wx.bytes, wh.bytes, bias.bytes}
            Args: struct{
                layer_id: usize,
                layer_kind: LayerTypeV2,
                wx: []const T,
                wh: ?[]const T,
                bias: []const T,
            },
            ParameterSet: builder.ParameterSet(T),
            /// The tag field type is just the associated layer id as `usize`.
            NewId: usize,
            /// Should create the `Builder` type, with the following args: 
            /// ```
            /// Builder(comptime T: type, comptime source: ModelSource, comptime path: []const u8, comptime Convention: InputShapeConvention)
            /// ```
            Inference: struct{model_src: builder.ModelSource, model_path: []const u8, start_offset: usize, bytes: []const u8},
        };


        // state: StateAPI, // WORKING
        state: if(LayerSettings.kind != .Input) State else .{},
        kind: LayerTypeV2 = LayerSettings.kind,
        /// This id, represent an index that points to a specific layer
        /// in a collection. It also act as the seed for random initialization
        /// of the weights and biases internally.
        id: usize,
        init_from: ?CreateMode = null,

        // pub fn init(comptime layer_id: usize, comptime mode: InitMode) !Self{
        pub fn init(comptime mode: InitMode) Self{
            return switch (mode) {
                // .Load => |param_states| try initFrom(param_states),
                .Args => |param_states| initFrom(param_states) catch @compileError("Failed initFrom → Args"),
                .ParameterSet => |param_set| initFromParams(&param_set),
                .NewId => |layer_id| init_new(layer_id),
                // .Inference => error.InitModeInferenceNotYetImplemented,
                .Inference => unreachable,
            };
        }
        
        /// To use the `initFrom` to initialize a new layer, we need to fill
        /// the associated state fields `wx`, `wh`, and `bias` from the binary blob. 
        /// The Builder type should be responsible for storing slices for all the trained 
        /// parameters for ONE layer at the time. 
        ///
        /// This function pass the saved parameter states as argument, and create a new 
        /// layer from this data. Mandatory and needed data to initialize a new layer, 
        /// needs the following fields: 
        /// ```
        /// struct{
        ///     layer_id: usize,
        ///     layer_kind: LayerTypeV2,
        ///     wx: []const T,
        ///     wh: ?[]const T,
        ///     bias: []const T,
        /// };
        /// ```
        fn initFrom(param_states: anytype) Self {
            const param_info = @typeInfo(@TypeOf(param_states));
            std.debug.assert(param_info == .@"struct");

            // Check if present instead of copying the data into the stack-frame. 
            const valid_params: bool = check_condition:{
                const params = param_info.@"struct".fields;
                var all_valid: bool = true;
                for(params) |param_field|{
                    all_valid = if(!@hasField(@TypeOf(param_states), param_field.name)) false;
                }
                break :check_condition all_valid;
            };

            //FIX: - below parse attempt might me redundant, add more sophisticated parsing check!
            const found_parameters: bool = comptime param_parse:{
                const params = param_info.@"struct".fields;

                var id_present: bool = false;
                var kind_present: bool = false;
                var wx_present: bool = false;
                var wh_present: bool = false;
                var bias_present: bool = false; 

                for(params) |param_field|{
                    if(param_field.type == usize and std.meta.eql(param_field.name, "layer_id")){
                        id_present = true;
                    }else if (param_field.type == LayerTypeV2 and std.meta.eql(param_field.name, "layer_kind")){
                        kind_present = true;
                    }else if(@typeInfo(param_field.type) == .optional){
                        const ChildType = @typeInfo(param_field.type).optional.child;
                        wh_present = if((ChildType == []const T) and std.meta.eql(param_field.name, "wh")) true;
                    }else if(param_field.type == []const T){
                        if(param_field.type == []const T){
                            wx_present = if(std.meta.eql(param_field.name, "wx")) true;
                            bias_present = if(std.meta.eql(param_field.name, "bias")) true;
                        }
                    }else{
                        break :param_parse false;
                    }
                }

                break :param_parse true;
            };

            if(valid_params or found_parameters){
                
                // 1. Build Wx as the raw PyTorch shape [OUT, IN] = [H, D] loaded from the row-major bytes.
                const wx_modified = wx_matrix:{

                    // The loaded bytes are ALWAYS in row-major bytes, so we need to use the Convention = RowSampleOrdering.
                    // To first construct the Wx matrix, and then transpose depending on the passed convention. 
                    var mat = Matrix(T, WeightDim.@"0", WeightDim.@"1") .from_array(param_states.wx, .RowSampleOrdering);
                    if (LayerSettings.convention == .RowSampleOrdering) 
                        // Dimension should be: [D, H] for X * W
                        break :wx_matrix mat.transpose() 
                    else 
                        // Keep Dimension as is: [H, D] for W * X
                        break :wx_matrix mat;
                };
        
                return switch (LayerSettings.kind) {
                    .Rnn => rnn_blk: {
                        if(param_states.wh == null) @compileError("Wh Matrix was null!");
                        break :rnn_blk Self{
                            .state = .{
                                .wx = wx_modified,
                                .wh = .from_array(param_states.wh.?, .RowSampleOrdering),
                                // "You can also assign from a slice with comptime-known length to a vector using .*"
                                .bias = @as(@Vector(SizeOfLayer, T), param_states.bias[0..SizeOfLayer].*),
                            },
                            .kind = @as(LayerTypeV2, param_states.layer_kind),
                            .id = @as(usize, param_states.layer_id),
                            .init_from = .Args,
                        };
                    },
                    .Dense, .Output => Self{
                        .state = .{
                            .wx = wx_modified,
                            .bias = @as(@Vector(SizeOfLayer, T), param_states.bias[0..SizeOfLayer].*),
                        },
                        .kind = @as(LayerTypeV2, param_states.layer_kind),
                        .id = @as(usize, param_states.layer_id),
                        .init_from = .Args,
                    },
                    else => Self{
                        .state = .{}, .kind = param_states.layer_kind, .id = param_states.layer_id, .init_from = .Args,
                    }
                };

            }else{
                // return error.AllParametersWasNotValid;
                @compileError("All Parameters was not valid!");
            }
        }

        fn initFromParams(parameters: *const builder.ParameterSet(T)) Self{
            if(builtin.mode == .Debug){
                std.debug.assert(parameters.fully_loaded());
                std.debug.assert(parameters.out_feature == SizeOfLayer);
            }

            const OUT: usize = parameters.out_feature;
            const IN: usize = parameters.in_features;
            const N = OUT * IN;

            //WARN: - The weight matrix (Wx) needs to be mapped to the correct runtime convention. 
            // Where the loaded binary blob is ALWAYS as row-major bytes according to Numpy C-order. 
    
            // 1. Build Wx as the raw PyTorch shape [OUT, IN] = [H, D] loaded from the row-major bytes.
            const wx_modified = wx_matrix:{

                // ALWAYS construct the matrix initially using Pytorch convention of [OUT, IN] as Numpy C-ordering.
                var mat = Matrix(T, OUT, IN).from_array(parameters.wx.?[0..N].*, .RowSampleOrdering);
                // var mat = MatrixV2(T, OUT, IN, .RowSampleOrdering).fromSlice(@constCast(parameters.wx.?));

                if (LayerSettings.convention == .RowSampleOrdering) 
                    // Dimension should be: [D, H] for X * W
                    break :wx_matrix mat.transpose() 
                else 
                    // Keep Dimension as is: [H, D] for W * X
                    break :wx_matrix mat;
            };

            // const wh_modified: ?MatrixV2(T, OUT, OUT, .RowSampleOrdering) = wh_matrix:{
            const wh_modified: ?Matrix(T, OUT, OUT) = wh_matrix:{
                if (LayerSettings.kind == .Rnn){
                    var mat = Matrix(T, OUT, OUT).from_array(parameters.wh.?[0..OUT*OUT].*, .RowSampleOrdering);
                    // var mat = MatrixV2(T, OUT, OUT, .RowSampleOrdering).fromSlice(@constCast(parameters.wh.?));
                    if (LayerSettings.convention == .RowSampleOrdering)
                        break :wh_matrix mat.transpose()
                    else 
                    break :wh_matrix mat;
                }else{
                    break :wh_matrix null;
                }
            };
    
            // 2. Construct the bias vector based on the following rules:
            // If we have both wx_bias and wh_bias → merge; else use → bias.
            const bias_modified: @Vector(SizeOfLayer, T) = bias_vec:{
                if (LayerSettings.kind == .Rnn){
                    if(builtin.is_test){
                        // std.debug.print("wx_bias: {any}\n", .{parameters.wx_bias.?});
                        // std.debug.print("wh_bias: {any}\n", .{parameters.wh_bias.?});
                        // std.debug.print("merged bias: {any}\n", .{parameters.merge_bias(SizeOfLayer)});
                    }else{
                        // @compileLog("wx_bias: ", parameters.wx_bias.?);
                        // @compileLog("wh_bias: ", parameters.wh_bias.?);
                        // @compileLog("Merged bias: ", parameters.merge_bias(SizeOfLayer));
                    }
                    break :bias_vec @as(@Vector(SizeOfLayer, T), parameters.merge_bias(SizeOfLayer));
                }else{
                    break :bias_vec @as(@Vector(SizeOfLayer, T), parameters.bias.?[0..SizeOfLayer].*);
                }
            };

            return switch (LayerSettings.kind) {
                .Rnn => Self{
                    .state = .{
                        .wx = wx_modified,
                        // .wh = .from_array(parameters.wh.?[0..RnnWeightDimension.@"0" * RnnWeightDimension.@"1"].*, parameters.convention),
                        // .wh = .from_array(parameters.wh.?[0..OUT*OUT].*, .RowSampleOrdering),
                        .wh = wh_modified,
                        .bias = bias_modified,
                    },
                    .kind = @as(LayerTypeV2, parameters.kind),
                    .id = @as(usize, parameters.layer_id),
                    .init_from = .ParameterSet,
                },
                .Dense, .Output => Self{
                    .state = .{
                        .wx = wx_modified,
                        // .wh = null,
                        .bias = bias_modified,
                    },
                    .kind = @as(LayerTypeV2, parameters.kind),
                    .id = @as(usize, parameters.layer_id),
                    .init_from = .ParameterSet,
                    
                },
                else => Self{
                    .state = .{}, .kind = parameters.kind, .id = parameters.layer_id, .init_from = .ParameterSet,
                }
            };
             
        }

        fn init_new(comptime layer_id: usize) Self {
            const isInputLayer = LayerSettings.kind == .Input;
            var self = Self{
                .state = switch (LayerSettings.kind) {
                    .Input => State{
                        .wx = .empty(),
                        .wh = null,
                        .bias = undefined,
                    },
                    .Rnn => State{
                        .wx = .zeroes(),
                        .wh = .zeroes(),
                        .bias = @splat(@as(T, 0.0)),
                    },
                    .Dense, .Output => State{
                        .wx = .zeroes(),
                        .wh = null,
                        .bias = @splat(@as(T, 0.0)),
                    }
                },
                .id = layer_id,
                .init_from = .NewId,
            };

            if (!isInputLayer) {
                self.apply_bias() catch |err| {
                    std.log.err("Trying to apply bias got error: {any}\n", .{err});
                };

                if(LayerSettings.kind == .Rnn){
                    _ = try self.apply_weights(.wx);
                    _ = try self.apply_weights(.wh);
                }else{
                    _ = try self.apply_weights(.wx);
                }
            }

            if (builtin.mode == .Debug or builtin.is_test){
                std.log.info("\t»»»Created a new {s} Layer({d}):«««\n||---------------------------------------------||\n", .{@tagName(LayerSettings.kind), layer_id});
                LayerSettings.show_info();
                std.log.info("||---------------------------------------------||\n", .{});
            }

            return self;
        }

        pub fn print_info(self: Self) void{
            std.log.info("\t\t»»»Layer({d})«««\n||---------------------------------------------||\n", .{self.id});
            LayerSettings.show_info();
            std.log.info("||---------------------------------------------||\n", .{});

        }

        pub fn print_state(self: Self) void{
            // std.debug.print("Weight(wx): {any}\n", .{self.state.wx.mat});
            self.state.wx.print_matrix("Weight(Wx)", PRINTMODE);
            if(self.state.wh) |wh|{
                // std.debug.print("Weight(Wh): {any}\n", .{wh.mat});
                wh.print_matrix("Weight(Wh)", PRINTMODE);
            }
            if(self.kind == .Rnn){
                std.debug.print("Merged bias(bx + bh): {any}\n", .{self.state.bias});
            }else{
                std.debug.print("Bias: {any}\n", .{self.state.bias});
            }

        }

        pub fn get_settings(_: Self) LayerSettingsV2{
            return LayerSettings ;
        }

        fn apply_weights(self: *Self, comptime target: enum {wx, wh}) !void {
            var byte_seeds: [8]u8 = undefined;
            std.crypto.random.bytes(&byte_seeds);
            const random_seed = std.mem.readInt(u64, &byte_seeds, .little);

            // var rgen = std.Random.DefaultPrng.init(self.id + random_seed);
            // const rand = rgen.random();
            // var random_gen = std.Random.Pcg.init(rand.int(u32));
            // const random = random_gen.random();

            switch (target) {
                .wx => {
                    var rgen = std.Random.DefaultPrng.init(self.id);
                    const rand = rgen.random();

                    var random_gen = std.Random.Pcg.init(rand.int(u32));
                    const random = random_gen.random();

                    const WeightMatrixType = Matrix(T, WeightDim.@"0", WeightDim.@"1");
                    const wx_scaling = @sqrt(0.1 / @as(f32, @floatFromInt(WeightMatrixType.Rows)));
                    
                    for (0..WeightMatrixType.Rows) |i| {
                        for (0..WeightMatrixType.Cols) |j| {
                            const val_rand = random.float(f32);
                            const rand_val = random.float(f32);
                            const norm = @sqrt(-2.0 * @log(val_rand)) * @cos(2.0 * std.math.pi * rand_val);
                            const scaled_val = norm * wx_scaling; 
                            self.state.wx.mat[i][j] = @as(T, @floatCast(scaled_val));
                        }
                    }
                },
                .wh => {
                    var rgen = std.Random.DefaultPrng.init(self.id + random_seed);
                    const rand = rgen.random();

                    var random_gen = std.Random.Pcg.init(rand.int(u32));
                    const random = random_gen.random();

                    const RnnWeightMatrixType = if(LayerSettings.kind == .Rnn) Matrix(T, RnnWeightDimension.@"0", RnnWeightDimension.@"1");
                    const wh_scaling = @sqrt(0.1 / @as(f32, @floatFromInt(RnnWeightMatrixType.Rows)));
                    
                    for (0..RnnWeightMatrixType.Rows) |i| {
                        for (0..RnnWeightMatrixType.Cols) |j| {
                            const val_rand = random.float(f32);
                            const rand_val = random.float(f32);
                            const norm = @sqrt(-2.0 * @log(val_rand)) * @cos(2.0 * std.math.pi * rand_val);
                            const scaled_val = norm * wh_scaling; 
                            // self.state.wh.mat[i][j] = @as(f16, @floatCast(scaled_val));
                            self.state.wh.?.mat[i][j] = @as(T, @floatCast(scaled_val));
                        }
                    }
                }
            }
        }

        fn apply_bias(self: *Self) !void {
            if (LayerSettings.convention == .ColumnFeatureOrdering and SizeOfLayer != WeightDim.@"0") {
                return error.BiasSizeNeedToMatchTheRowDimensionOfWeightMatrix;
            }else if (LayerSettings.convention == .RowSampleOrdering and SizeOfLayer != WeightDim.@"1") {
                return error.BiasSizeNeedToMatchTheColumnDimensionOfWeightMatrix;
            }else {
                var rgen = std.Random.DefaultPrng.init(self.id);
                const rand = rgen.random();
                var random_gen = std.Random.Pcg.init(rand.int(u32));
                const random = random_gen.random();
                const min_val: T = -0.1; 
                const max_val: T = 0.1; 

                for (0..@as(usize, SizeOfLayer)) |n| {
                    if(LayerSettings.activation) |activation_fn|{
                        const random_float = random.float(f32);
                        if (activation_fn == .SoftMax and self.kind == .Output){
                            self.state.bias[n] = 0.0;
                        }else {
                            const value = min_val + (random_float * (max_val - min_val));
                            self.state.bias[n] = @as(T, @floatCast(value));
                        } 
                    }
                }
            }
        }

        pub fn feedforward(self: *Self, X: *const Matrix(T, InputDim.@"0", InputDim.@"1")) ?Matrix(T, OutputDim.@"0", OutputDim.@"1"){
            // Sanity debug checks:
            if(builtin.mode == .Debug){
                switch(LayerSettings.kind){
                    .Rnn =>{
                        if (LayerSettings.convention == .ColumnFeatureOrdering) {
                            std.debug.assert(X.get_dimension().@"1" == LayerSettings.timewindow); // X: [D × T]
                        }else {
                            std.debug.assert(X.get_dimension().@"0" == LayerSettings.timewindow); // X: [T × D]
                        }
                    },
                    else => {
                        // General assertion checks below, such as: 
                        // - correct matrix dimensions,
                        // - linear algebra operations, 
                        // - etc...
                    }
                }

            }

            return switch (self.kind) {
                .Rnn => self.forwardpass_rnn(X),
                .Dense, .Output => self.forwardpass(X),
                else => null,
            };
        }

        pub fn feedforward_optimized(
            self: *Self,
            X: *const Matrix(T, InputDim.@"0", InputDim.@"1"),
            ws: anytype, // only required for RNN
            out: *Matrix(T, OutputDim.@"0", OutputDim.@"1"),
        ) void{
            if(builtin.mode == .Debug){
                if(LayerSettings.kind == .Rnn){
                    if (LayerSettings.convention == .ColumnFeatureOrdering) {
                        std.debug.assert(X.get_dimension().@"1" == LayerSettings.timewindow); // X: [D × T]
                    }else {
                        std.debug.assert(X.get_dimension().@"0" == LayerSettings.timewindow); // X: [T × D]
                    }
                }
            }

            switch (LayerSettings.kind) {
                .Rnn => {
                    // Require workspace for RNN
                    // const wsp = ws orelse {
                    //     @panic("RNN feedforward_into requires a workspace of owned matrix data.");
                    // };
                    // forwardpass_rnn_optimized(self, X, wsp, out);

                    forwardpass_rnn_optimized(self, X, ws, out);
                },
                .Dense, .Output => {
                    forwardpass_dense(self, X, out);
                },
                else => {}, // noop / unsupported
            }
        }

        fn forwardpass_debug_info(self: *Self, x_t: *const Matrix(T, InputDim.@"0", InputDim.@"1")) void{
            print_fn(PRINTMODE, "\nAt Layer({d}):\n", .{self.id});
            print_fn(PRINTMODE, "\tActivation: {?}\n", .{LayerSettings.activation});

            if(builtin.mode == .Debug and builtin.is_test) std.debug.assert(@typeInfo(@TypeOf(self.state.bias)).vector.len == SizeOfLayer);

            const wx_dim = self.state.wx.get_dimension();
            const x_dim = x_t.get_dimension();

            if(LayerSettings.convention == .ColumnFeatureOrdering){
                // hₜ = ϕ(Wₓ × xₜ + Wₕ × hₜ₋₁ + b), where b = (bx + bh)
                //     Wₓ × xₜ → [H × D] ⋅ [D × 1] = [H × 1], 
                //     Wₕ × hₜ₋₁ → [H × H] ⋅ [H × 1] = [H × 1].
                // E.g., hₜ ∈ ℝᴴ ˣ ¹ → Column-Major becomes hₜ ∈ ℝ¹ ˣ ᴴ as Row-Major. 
                if(LayerSettings.kind == .Rnn){
                    const wh_dim = self.state.wh.?.get_dimension();

                    print_fn(PRINTMODE, "\tConvention: {s}\n\tLayer Kind: {s}\n\tOperation: hₜ = ϕ(Wₓ × xₜ + Wₕ × hₜ₋₁ + b)\n", .{
                        @tagName(LayerSettings.convention),
                        @tagName(LayerSettings.kind),
                    });

                    print_fn(PRINTMODE, "\tExpected Dimensions: Wₓ × xₜ + Wₕ × hₜ₋₁  = [{d}, {d}] × [{d}, {d}] + [{d}, {d}] × [{d}, {d}]\n", .{
                        wx_dim.@"0", wx_dim.@"1",
                        x_dim.@"0", x_dim.@"1",
                        wh_dim.@"0", wh_dim.@"1",
                        wh_dim.@"0", 1,
                    });

                }else{
                    print_fn(PRINTMODE, "\tConvention: {s}\n\tLayer Kind: {s}\n\tOperation: Wₓ × X = [{d}, {d}] × [{d}, {d}]\n", .{
                        @tagName(LayerSettings.convention),
                        @tagName(LayerSettings.kind),
                        wx_dim.@"0", wx_dim.@"1",
                        x_dim.@"0", x_dim.@"1",
                    });
                    if(builtin.mode == .Debug or builtin.is_test) std.debug.assert(wx_dim.@"1" == x_dim.@"0");
                }

            }else{
                // hₜ = ϕ(xₜ × Wₓ  + hₜ₋₁ × Wₕ + b)
                if(LayerSettings.kind == .Rnn){
                    const wh_dim = self.state.wh.?.get_dimension();
                    print_fn(PRINTMODE, "\tConvention: {s}\n\tLayer Kind: {s}\n\tOperation: hₜ = ϕ(xₜ × Wₓ  + hₜ₋₁ × Wₕ + b)\n", .{
                        @tagName(LayerSettings.convention),
                        @tagName(LayerSettings.kind)
                    });
                    print_fn(PRINTMODE, "\tExpected Dimensions: xₜ × Wₓ + hₜ₋₁ × Wₕ = [{d}, {d}] × [{d}, {d}] + [{d}, {d}] × [{d}, {d}]\n", .{
                        x_dim.@"0", x_dim.@"1",
                        wx_dim.@"0", wx_dim.@"1",
                        1, wh_dim.@"0",
                        wh_dim.@"0", wh_dim.@"1",
                    });

                }else{
                    print_fn(PRINTMODE, "\tConvention: {s}\n\tLayer Kind: {s}\n\tOperation: X × Wₓ = [{d}, {d}] × [{d}, {d}]\n", .{
                        @tagName(LayerSettings.convention),
                        @tagName(LayerSettings.kind),
                        x_dim.@"0", x_dim.@"1",
                        wx_dim.@"0", wx_dim.@"1",
                    });
                    if(builtin.mode == .Debug or builtin.is_test) std.debug.assert(x_dim.@"1" == wx_dim.@"0");
                }
                
            }
            print_fn(PRINTMODE, "\n", .{});

        }

        fn forwardpass(self: *Self, x_t: *const Matrix(T, InputDim.@"0", InputDim.@"1")) Matrix(T, OutputDim.@"0", OutputDim.@"1"){
            if(builtin.os.tag != .freestanding or builtin.is_test) self.forwardpass_debug_info(x_t);

            var output_matrix: Matrix(T, OutputDim.@"0", OutputDim.@"1") = switch (LayerSettings.convention) {
                // When convention is column-major (features as rows, samples as columns).
                .ColumnFeatureOrdering => self.state.wx.matmul(x_t),

                // When convention is row-major (features as columns, samples as rows).
                // Then we multiply in the order: X*W. Make sure the dimension matches, 
                // and if we need to transpose the Wx matrix. 
                .RowSampleOrdering => x_t.matmul(self.state.wx),
            };

            // This would add the bias to the matrix depending on the matrix type.
            // E.g., if the matrix has column vector shape (N x 1), row vector shape (1 X N),
            // or multi row and column matrix shape (M x N).

            output_matrix.broadcasting(self.state.bias, LayerSettings.convention) catch |err| {
                if(builtin.mode == .Debug){
                    self.state.wx.print_matrix("", PRINTMODE);
                    output_matrix.print_matrix("", PRINTMODE);
                }
                std.log.err("Broadcasting error: {any}\n", .{err});
            };
            if(LayerSettings.activation != null) self.apply_activation(&output_matrix, false);
            // if(builtin.mode == .Debug or builtin.is_test) output_matrix.print_matrix("Layer Forward Output", PRINTMODE);
            return output_matrix;
        }

        fn forwardpass_dense(self: *Self, X: *const Matrix(T, InputDim.@"0", InputDim.@"1"), y_output: *Matrix(T, OutputDim.@"0", OutputDim.@"1")) void{
            switch (LayerSettings.convention) {
                .ColumnFeatureOrdering => {
                    self.state.wx.matmul_optimized(X, y_output);
                },
                .RowSampleOrdering => {
                    X.matmul_optimized(&self.state.wx, y_output);
                },
            }
            y_output.broadcasting(self.state.bias, LayerSettings.convention) catch |err| {
                if(builtin.mode == .Debug){
                    self.state.wx.print_matrix("", PRINTMODE);
                    y_output.print_matrix("", PRINTMODE);
                }
                std.log.err("Broadcasting error: {any}\n", .{err});
            };

            if(LayerSettings.activation != null) self.apply_activation(y_output, false);
        }
        
        /// Column-Major Dimensions:
        ///     X ∈ ℝᴰ ˣ ᵀ → full sequence (all timesteps),
        ///     xₜ ∈ ℝᴰ ˣ ᴮ⁼¹ → single sample,
        ///     hₜ₋₁, hₜ ∈ ℝᴴ ˣ ¹, 
        ///     Wₓ ∈ ℝᴴ ˣ ᴰ, 
        ///     Wₕ ∈ ℝᴴ ˣ ᴴ, 
        ///     b ∈ ℝᴴ ˣ ¹,
        ///     yᵣₙₙ ∈ ℝᴴ ˣ ᵀ.
        /// Row-Major Dimensions: 
        ///     - Are the transposed of the column-major versions. 
        ///     - E.g., hₜ ∈ ℝᴴ ˣ ¹ → Column-Major becomes hₜ ∈ ℝ¹ ˣ ᴴ as Row-Major. 
        /// ----------------------------------
        /// Feedforward RNN:
        /// hₜ = ϕ(Wₓ × xₜ + Wₕ × hₜ₋₁ + b) → [H × 1] + [H × 1] + [H × 1] → ...
        /// ... → Matrix(T, H, D) ⋅ Matrix(T, D, 1) + Matrix(T, H, H) ⋅ Matrix(T, H, 1) + @Vector(H, T)
        /// - Where: 
        ///     Wₓ × xₜ → [H × D] ⋅ [D × 1] = [H × 1], 
        ///     Wₕ × hₜ₋₁ → [H × H] ⋅ [H × 1] = [H × 1].
        /// ----------------------------------
        fn forwardpass_rnn(self: *Self, X: *const Matrix(T, InputDim.@"0", InputDim.@"1")) Matrix(T, OutputDim.@"0", OutputDim.@"1"){

            // hₜ = ϕ(Wₓ × xₜ + Wₕ × hₜ₋₁ + b), where hₜ₋₁ and hₜ ∈ ℝᴴ ˣ ¹. 
            var ht = Matrix(T, H.@"0", H.@"1").zeroes(); // hₜ → Cell state (update each timestep(t)) 

            // 0. Create the empty Output Matrix for the whole sequence where Hₜᵢₘₑₛₜₑₚₛ ∈ ℝᴴ ˣ ᵀ
            var y_sequence = Matrix(T, OutputDim.@"0", OutputDim.@"1").zeroes();  // full output sequence (all timesteps)

            if(builtin.os.tag != .freestanding or builtin.is_test or builtin.mode == .Debug){
                // self.forwardpass_debug_info(X);
            }

            for(0..LayerSettings.timewindow) |t|{

                // 1. Create xₜ (single timestep/sample), where X: [D × T] for column-major and [T × D] for row-major.
                const x_t = if(LayerSettings.convention == .ColumnFeatureOrdering)
                    Matrix(T, InputDim.@"0", 1).from_array(X.get_colvec(t), LayerSettings.convention) // [D × 1]
                else 
                    Matrix(T, 1, InputDim.@"1").from_array(X.mat[t], LayerSettings.convention); // [1 × D]

                // 2. Wₓ × xₜ → [H × D] ⋅ [D × 1] = [H × 1], xₜ ∈ ℝᴰ ˣ ᴮ⁼¹, Wₓ ∈ ℝᴴ ˣ ᴰ
                var weighted_sum = if(LayerSettings.convention == .ColumnFeatureOrdering) 
                    self.state.wx.matmul(x_t) 
                else x_t.matmul(self.state.wx);
                
                // 3. Wₕ × hₜ₋₁ → [H × H] ⋅ [H × 1] = [H × 1], hₜ₋₁, hₜ ∈ ℝᴴ ˣ ¹, Wₕ ∈ ℝᴴ ˣ ᴴ.
                const mat_h = if(LayerSettings.convention == .ColumnFeatureOrdering and LayerSettings.kind == .Rnn) 
                    self.state.wh.?.matmul(ht) 
                else ht.matmul(self.state.wh.?);

                 
                // To make the compiler happy, we need to cover all the paths (cases). 
                // Even though the might never occur...

                if (LayerSettings.kind == .Rnn){
                    // 4. Wₓ × xₜ + Wₕ × hₜ₋₁
                    weighted_sum.elementwise_operation(&mat_h, .Add) catch |err|{
                        std.log.err("Elementwise (Add) failed: {any}\n", .{err});
                    };

                    // 5. broadcast - add merge bias or biases (wx_bias + wh_bias)
                    // Wₓ × xₜ + bₓ + Wₕ × hₜ₋₁ + bₕ 
                    weighted_sum.broadcasting(self.state.bias, LayerSettings.convention) catch |err| {
                        std.log.err("Broadcasting error: {any}\n", .{err});
                    };

                    // 6. Update cell state: hₜ = ϕ(Wₓ × xₜ + Wₕ × hₜ₋₁ + b)
                    self.apply_activation(&weighted_sum, false);
                    ht = weighted_sum;

                    if(LayerSettings.convention == .ColumnFeatureOrdering){
                        const sample_vector = ht.get_colvec(0);
                        y_sequence.set_colvec(t, sample_vector[0..]);
                    }else{
                        const row_sample = ht.mat[0];
                        y_sequence.mat[t] = row_sample;
                    }
                    
                    if(builtin.mode == .Debug) {
                        // ht.print_matrix("hₜ = ϕ(Wₓ × xₜ + Wₕ × hₜ₋₁ + b) Output", PRINTMODE);
                        // if(builtin.mode == .Debug) y_sequence.print_matrix("yₜ sequence output", PRINTMODE);
                    }
                }

            }

            return y_sequence;
        }

        fn forwardpass_rnn_optimized(
            self: *Self,
            X: *const Matrix(T, InputDim.@"0", InputDim.@"1"),
            ws: anytype,
            y_output: *Matrix(T, OutputDim.@"0", OutputDim.@"1")
        ) void{
            const HN = SizeOfLayer; // number of hidden units (features in h_t)
            const D  = if (LayerSettings.convention == .ColumnFeatureOrdering)
                InputDim.@"0"  // X is [D × T]
            else
                InputDim.@"1"; // X is [T × D]

            var t: usize = 0; 
            while (t < LayerSettings.timewindow) : (t += 1) {
                
                if (LayerSettings.convention == .ColumnFeatureOrdering){

                    var ht = Matrix(T, HN, 1).zeroes();
                    var h_prev = Matrix(T, HN, 1).zeroes();
                    var Xt = Matrix(T, D, 1).zeroes(); // D×1
                    inline for (0..HN) |i| h_prev.mat[i][0] = 0;

                    // X is [D×T]; take column t to Xt (D×1) without big temps
                    X.get_colvec_into(t, ws.col_buf[0..D]);
                    Xt.set_colvec(0, ws.col_buf[0..D]);

                    // 2. h_t = Wₓ × xₜ → [H × D] ⋅ [D × 1] = [H × 1], xₜ ∈ ℝᴰ ˣ ᴮ⁼¹, Wₓ ∈ ℝᴴ ˣ ᴰ
                    // ---- h_t := 0 (destination) ----
                    inline for (0..HN) |i| ht.mat[i][0] = 0;

                    // ---- h_t += W_x * x_t ----
                    self.state.wx.matmul_optimized_acc(&Xt, &ht);

                    // 3. Wₕ × hₜ₋₁ → [H × H] ⋅ [H × 1] = [H × 1], hₜ₋₁, hₜ ∈ ℝᴴ ˣ ¹, Wₕ ∈ ℝᴴ ˣ ᴴ.
                    // ---- h_t += W_h * h_{t-1} ----
                    if (self.state.wh) |wh| {
                        wh.matmul_optimized_acc(&h_prev, &ht);
                    }

                    // 5. broadcast - add merge bias or biases (wx_bias + wh_bias)
                    // Wₓ × xₜ + bₓ + Wₕ × hₜ₋₁ + bₕ 
                    ht.broadcasting(self.state.bias, LayerSettings.convention) catch |err| {
                        std.log.err("Broadcasting error: {any}\n", .{err});
                    };

                    // ht.print_matrix("ht (col-major)", .debug_print);

                    self.apply_activation(&ht, false);

                    // ---- write h_t → y_out[:, t] ----
                    inline for (0..HN) |i| ws.ht_buf[i] = ht.mat[i][0];
                    y_output.set_colvec(t, ws.ht_buf[0..HN]);

                    // ---- h_{t-1} = h_t for next iter (copy) ----
                    inline for (0..HN) |i| h_prev.mat[i][0] = ht.mat[i][0];
                }else{
                    
                    var ht = Matrix(T, 1, HN).zeroes();

                    var h_prev = Matrix(T, 1, HN).zeroes();
                    var Xt = Matrix(T, 1, D).zeroes(); // 1×D
                    inline for (0..HN) |j| h_prev.mat[0][j] = 0;

                    Xt.set_rowvec(0, X.mat[t][0..D]);

                    // h_t := 0
                    inline for (0..HN) |j| ht.mat[0][j] = 0;

                    // h_t += x_t * W_x   → (1×D)*(D×H) = (1×H)
                    Xt.matmul_optimized_acc(&self.state.wx, &ht);

                    // h_t += h_{t-1} * W_h → (1×H)*(H×H) = (1×H)
                    if (self.state.wh) |wh| {
                        h_prev.matmul_optimized_acc(&wh, &ht);
                    }

                    // + bias, activation
                    ht.broadcasting(self.state.bias, .RowSampleOrdering) catch |err| {
                        std.log.err("Broadcasting error: {any}\n", .{err});
                    };
                    
                    // ht.print_matrix("ht (row-major)", .debug_print);
                    
                    self.apply_activation(&ht, false);
                                
                    y_output.set_rowvec(t, ht.mat[0][0..HN]);

                    inline for (0..HN) |j| h_prev.mat[0][j] = ht.mat[0][j];
                }
            }
        }


        fn apply_activation(_: Self, output_matrix: anytype, deriv_flag: bool) void {
            const M: usize = @typeInfo(@TypeOf(output_matrix.*)).@"struct".fields[1].defaultValue().?;
            const N: usize = @typeInfo(@TypeOf(output_matrix.*)).@"struct".fields[2].defaultValue().?;
            const ColVectorLength = M;
            const RowVectorLength = N;

            if(LayerSettings.activation) |activation|{
                switch (output_matrix.mat_type) {
                    .ColumnVector => {
                        var column_vec = output_matrix.*.get_colvec(0); // Obtains the (1 x n) vector.
                        const activation_vec = activation.execute_fn(T, ColVectorLength, column_vec[0..], deriv_flag);

                        output_matrix.*.set_colvec(0, activation_vec[0..]); 
                    },
                    .RowVector => {
                        var row_entries = output_matrix.*.mat[0];
                        output_matrix.*.mat[0] = activation.execute_fn(T, RowVectorLength, row_entries[0..], deriv_flag);
                    },
                    .Default => {
                        // When shape of matrix is (M x N). E.g., 3 x 2.
                        // We apply activation function element-wise by iterating
                        // each row or column in the matrix, depending on convention used.
                        switch (LayerSettings.convention) {
                            .ColumnFeatureOrdering => {
                                inline for (0..N) |j| {
                                    var sample_val = output_matrix.*.get_colvec(j);
                                    const activation_vec = activation.execute_fn(T, ColVectorLength, sample_val[0..], deriv_flag);
                                    output_matrix.*.set_colvec(j, activation_vec[0..]); 
                                }
                            },
                            .RowSampleOrdering => {
                                inline for (0..M) |i| {
                                    const row_vals = activation.execute_fn(T, RowVectorLength, output_matrix.*.mat[i][0..], deriv_flag);
                                    output_matrix.*.mat[i] = row_vals;
                                }
                            }
                        }
                    },
                }
            }else{
                if(builtin.mode == .Debug){
                    print_fn(PRINTMODE, "No activation was applied for Layer!\n", .{});
                }
            }
        }
    };
}

/// This Layer Base act as an interface for a base neural network layer type.
pub const LayerBase = struct {
    /// This represent a pointer to the specific Layer Type.
    ptr: *anyopaque,
    apply_weights_fn: *const fn (ptr: *anyopaque) anyerror!void,
    apply_zeroes_fn: *const fn (ptr: *anyopaque) anyerror!void,

    pub fn init(ptr: anytype) LayerType {
        const T = @TypeOf(ptr);
        const ptr_info = @typeInfo(T);
        // const self = @fieldParentPtr("weight_matrix", ptr);
        std.debug.print("Type Info: {any}", .{ptr_info});

        if (ptr_info != .Pointer) @compileError("ptr must be a pointer");
        if (ptr_info.Pointer.size != .One) @compileError("ptr must be a single item pointer");

        const gen = struct {
            pub fn apply_weights(func_ptr: *anyopaque) anyerror!void {
                const self: T = @ptrCast(@alignCast(func_ptr));
                return ptr_info.Pointer.child.apply_weights(self);
            }

            pub fn apply_zeroes(func_ptr: *anyopaque) anyerror!void {
                const self: T = @ptrCast(@alignCast(func_ptr));
                return ptr_info.Pointer.child.apply_zeroes(self);
            }
        };

        return LayerBase{
            .ptr = ptr,
            .apply_weights_fn = gen.apply_weights,
            .apply_zeroes_fn = gen.apply_zeroes,
        };
    }

    pub fn apply_weights(self: LayerType) !void {
        return self.apply_weights_fn(self.ptr);
    }

    pub fn apply_zeroes(self: LayerType) !void {
        return self.apply_zeroes_fn(self.ptr);
    }
};


/// Represent local layer data in the Neural Network. Such as the weight matrix and bias vector.
/// This generic type, utilize the `LayerType` base interface.
/// -------------------------
/// Row-Major → Output dim (m, k), when input [m][n], weights [n][k]:
///     input: batch × features, weight: features × output, output: batch × output. 
/// Where: X ∈ ℝ^{batch × features}.
/// -------------------------
/// Column-Major→ Output dim (k, m), when input [n][m], weights [k][n]:
///     input: features × batch, weight: output × features, output: output × batch. 
/// Where: X ∈ ℝ^{features × batch}.
pub fn Layer(comptime T: type, comptime LayerObject: LayerInfo, comptime Convention: InputShapeConvention) type {
    return struct {
        const Self = @This();

        /// Size of the layer in terms of number of neurons.
        pub const SizeOfLayer = LayerObject.layer_size().?;  
        const NumberOfClasses = if (isOutputLayer() and (LayerObject.get_shape_of(.num_classes) != null)) LayerObject.get_shape_of(.num_classes) else null; 
        pub const BatchSize = LayerObject.get_shape_of(.batch_size).?; 

        // --- Internal Shapes and Dimensions ---
        pub const Shapes = LayerObject.Shapes(Convention).get();
        pub const WeightDimension = Shapes.weight_dim; 

        /// Prior layers output which is the input data to the current layer.
        pub const InputDimension = Shapes.input_dim;
        pub const OutputDimension = Shapes.output_dim; 
        pub const OutputMatrix = Matrix(T, OutputDimension[0], OutputDimension[1]);
        pub const InputMatrix = Matrix(T, InputDimension[0], InputDimension[1]);
        //---------------------------------------

        // --- Capacity of the layer in terms of size, and number of params for the layer --- 
        const WeightCapacity = WeightDimension[0] * WeightDimension[1];
        const BiasCapacity = SizeOfLayer;
        const NumberParams = WeightCapacity + BiasCapacity; 
        //-----------------------------------------------------------------------------------

        pub const TimeWindow: usize = if (Convention == .ColumnFeatureOrdering)
            InputDimension[1]
        else
            InputDimension[0];

        /// Meta data and general Info about the Layer. This act as a placeholder,
        /// for determining what actions to execute for this layer.
        pub const Info = LayerObject;

        /// Weight matrix dimension is given by num nodes in layer l times l-1.
        /// Where `InputSize` represent prior layer size and `LayerSize` the current layer size.
        weight_matrix: ?Matrix(T, WeightDimension[0], WeightDimension[1]), 

        /// Biases for a layer is represented by a M x 1 matrix or row vector.
        /// Where M represent the `LayerSize`.
        bias_vector: ?@Vector(SizeOfLayer, T),

        //WARN: - Should I store the cached data, as a slice and an associated data shape?
        // My thought is that it would take up to much memory space if we have three Matrices.

        /// This should cache the input data given by saving the partial derivative of
        /// δz^[L]/δw^[L] = σ^[L-1](z) = input data from prior layer.
        cached_input: ?*const Matrix(T, InputDimension[0], InputDimension[1]),

        /// δa^[L]/δz^[L] = σ'(z). This should be stored during the forward pass.
        cached_z: ?Matrix(T, OutputDimension[0], OutputDimension[1]),

        /// This is the saved σ(z), activation output of the layer.
        cached_activation: ?Matrix(T, OutputDimension[0], OutputDimension[1]),

        /// This seed id, represent an index that points to a specific layer
        /// in a collection. It also act as the seed for random initialization
        /// of the weights and biases internally.
        id_seed: usize,

        memory_state: ?@Vector(SizeOfLayer, T) = switch (LayerObject.get_type()) {
            .Rnn => @splat(0),
            else => null,
        },
        // LayerObject.get_type()

        const InternalShape = struct{
            input_dim: struct{usize, usize},
            weight_dim: ?struct{usize, usize},
            output_dim: struct{usize, usize}, 
        }; 

        pub fn init(id: usize) Self {
            var self = Self{
                .weight_matrix = null,
                .bias_vector = null,
                .cached_input = null,
                .cached_z = null,
                .cached_activation = null,
                .id_seed = id,
            };

            if (!isInputLayer()) {
                _ = try self.apply_zeroes();

                self.apply_bias() catch |err| {
                    std.log.err("Trying to apply bias got error: {any}\n", .{err});
                };

                _ = try self.apply_weights();
            }

            std.log.info("\t»»»Created a new {s} Layer({d}):«««\n||---------------------------------------------||\n", .{@tagName(Info), id});
            show_info();
            std.log.info("||---------------------------------------------||\n", .{});

            return self;
        }

        pub fn show_info() void {
            const prior_dim0 = if (Convention == .RowSampleOrdering) "Batch Size" else "Input Size";
            const prior_dim1 = if (Convention == .RowSampleOrdering) "Input Size" else "Batch Size";
            const input_layer_dim0 = if (Convention == .RowSampleOrdering) "Batch Size" else "Features";
            const input_layer_dim1 = if (Convention == .RowSampleOrdering) "Features" else "Batch Size";
            const NumClasses = if (NumberOfClasses != null) NumberOfClasses else ""; 

            switch (Info) {
                .hidden => |info| {
                    std.log.info("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Activation Function: {s}\n    \u{2022} Prior Layer Dimension: {}x{}, ({s} x {s})\n    \u{2022} Expected Output Dimension: {}x{}\n    \u{2022} Input Shape Convention: {s}\n", .{ 
                        @tagName(info[0]), 
                        WeightDimension[0], WeightDimension[1], 
                        @tagName(info[2]), 
                        InputDimension[0], InputDimension[1], 
                        prior_dim0, prior_dim1, 
                        OutputDimension[0], OutputDimension[1], 
                        @tagName(Convention)
                    });
                },
                .input => |info| {
                    std.log.info("    \u{2022} Layer Type: {s}\n    \u{2022} Input Matrix: {}x{} ({s} x {s})\n", .{ 
                        @tagName(info[0]), 
                        InputDimension[0], InputDimension[1], 
                        input_layer_dim0, input_layer_dim1 
                    });
                },
                .output => |info| {
                    std.log.info("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Output Dimension: {}x{}\n    \u{2022} Number Of Classes: {any}\n    \u{2022} Loss Function: {s}\n", .{ 
                        @tagName(info[0]), 
                        WeightDimension[0], WeightDimension[1], 
                        OutputDimension[0], OutputDimension[1], 
                        NumClasses, 
                        @tagName(info[2]) 
                    });
                },
            }
            std.log.info("||---------------------------------------------||\n", .{});
        }

        /// Return the used activation function type in this layer.
        pub fn activation(_: Self) ActivationFunction {
            const activation_type = switch (Info) {
                .input => unreachable,
                .hidden => Info.get_activation() orelse unreachable,
                .output => |out_layer| {
                    const layer_type: LayerType = out_layer[0];
                    const output_activation: ActivationFunction = switch (layer_type) {
                        .SoftMax => ActivationFunction.SoftMax,
                        .Relu => ActivationFunction.Relu,
                        .LeakyRelu => ActivationFunction.LeakyRelu,
                        else => unreachable,
                    };
                    return output_activation;
                },
            };
            return activation_type;
        }

        pub fn LayerOutputMatrixDimension(_: Self) struct {comptime_int, comptime_int} {
            return OutputDimension; 
        }

        pub fn isOutputLayer() bool {
            switch (Info) {
                .input => return false,
                .hidden => return false,
                .output => return true,
            }
        }

        pub fn isInputLayer() bool {
            switch (Info) {
                .input => return true,
                .hidden => return false,
                .output => return false,
            }
        }

        /// Update the weights and bias using e.g., SGD:
        /// W = W - η·∂L/∂W
        /// b = b - η·∂L/∂b
        /// TODO: - Add optimzer type as parameter, so we can run different optimization 
        /// algorithms to minimize the cost. E.g., SGD, Adam, ... 
        fn update_params(self: *Self, weight_grad: Matrix(T, WeightDimension[0], WeightDimension[1]), bias_grad: @Vector(SizeOfLayer, T), hypr_param: *HyperParameters) !void {
            // Apply scaling on weight and bias
            var scaled_weight_grad = weight_grad; 
            const scale_vector: @Vector(SizeOfLayer, T) = @splat(hypr_param.*.learning_rate);
            const scaled_bias_grad = self.bias_vector.? - (bias_grad * scale_vector); 

            // Apply scaling on the weight gradient matrix, via scalar multiplication.
            scaled_weight_grad.scalar_multiplication(hypr_param.*.learning_rate); // Part: η·∂L/∂W

            // Update Weights and Bias: 
            try self.weight_matrix.?.elementwise_operation(scaled_weight_grad, .Sub); // Applying the full part: W = W - η·∂L/∂W.
            self.bias_vector = scaled_bias_grad; // Updating the bias: b = b - η·∂L/∂b → b = scaled_bias_grad.
            
        }

        /// We accumulate the gradient of a neuron across all samples — one gradient value per neuron, summed over the batch.
        /// The sum over the batch would obtain one scalar gradient per neuron. 
        /// The intuition behind this is to calculate how strongly each input dimension influenced 
        /// each neuron's loss, aggregated over the batch (for both the bias and weight). 
        /// 
        // fn bias_derivative(_: Self, dldz_matrix: *const Matrix(T, OutputDimension[0], OutputDimension[1])) @Vector(SizeOfLayer, T) {
        fn bias_derivative(_: Self, dldz_matrix: anytype) @Vector(SizeOfLayer, T) {
            // Column-Major Z shape: [n₃ × 1], A[i][j] = output from neuron i for sample j.
            // Row-Major Z shape: [1 × n₃], A[i][j] = output from neuron j for sample i.
            // const SizeOfBatch: comptime_int = LayerObject.get_shape_of(.batch_size).?;  
            const FeatureSize = SizeOfLayer; 

            var sample_sum: @Vector(FeatureSize, T) = undefined; 
            for (0..FeatureSize) |i| {
                //WARN: - Got a usize bug, its hardcoded to 3 atm. 
                const row_vec: @Vector(BatchSize, T) = if (Convention == .ColumnFeatureOrdering) 
                    dldz_matrix.mat[i] 
                else 
                    dldz_matrix.get_colvec(i); // 1 feature = 1 neuron, aggregated over the batch. 
                 
                const sum_scalar: T = @reduce(.Add, row_vec); 
                sample_sum[i] = sum_scalar; 
            }
            return sample_sum; 
        }

        pub fn loss_backward(self: *Self, grad_loss: Matrix(T, OutputDimension[0], OutputDimension[1]), hypr_param: *HyperParameters) !Matrix(T, InputDimension[0], InputDimension[1]) {
            if(builtin.mode == .Debug) std.debug.assert(comptime Self.isOutputLayer() == true);

            var cached_input = self.cached_input.?.*; 
            
            const dl_db = self.bias_derivative(grad_loss); 
            const dl_dw = if (Convention == .ColumnFeatureOrdering) 
                grad_loss.matmul(cached_input.transpose()) //dW₃ = dz₃ · a₂ᵀ
            else 
                cached_input.transpose().matmul(grad_loss);

            // dl/da → upstream propagator term: propagator = (dZ₃ · W₃ᵀ), shape(propagator) = (OutputDimension[0], OutputDimension[1]). 
            // Where the propagator shape is the same as the cached_input shape (prior output). 
            const propagator = if (Convention == .RowSampleOrdering) 
                    grad_loss.matmul(self.weight_matrix.?.transpose())
                else 
                    self.weight_matrix.?.transpose().matmul(grad_loss); 

            if(builtin.mode == .Debug){
                std.debug.assert(dl_dw.rows == WeightDimension[0] and dl_dw.cols == WeightDimension[1]); 
                std.debug.assert(propagator.rows == InputDimension[0] and propagator.cols == InputDimension[1]);
            }
            
            try self.update_params(dl_dw, dl_db, hypr_param); 
            return propagator; 
        }

        /// This is the backward API, for calculating the partial derivative of the loss w.r.t 
        /// the `z` where z = X*W + b. Internally this function would return dh, dw.
        /// In other words: ∂L/∂Z is the downstream gradient, while the upstream gradient is ∂L/∂h.
        /// If f : ℝᵐ → ℝⁿ , then we get the m x n Jacobian Matrix, as ℝⁿˣᵐ. 
        /// ----------------------------------------
        /// The method, returns the δ = ∂L/∂Z Matrix (∂L/∂Z₃ → ∂L/∂Z₂ → ∂L/∂Z₁), and saves the gradients: ∂L/∂W, ∂L/∂b. 
        /// Where: δ = ∂L/∂Z = ∂L/∂a ⊙ ∂a/∂Z = ∂L/∂a ⊙ f'(z).
        /// -----------------------
        /// Important notes: 
        /// • The partial derivative has the same shape as the dependent parameter (e.g., W, b, Z).
        ///   - So in order to check if backpropagation is correct, we check if the matrix dimension match.
        /// • backpropagating through an activation function, we apply 
        /// the Hadamard product (element wise multiplication, ⊙), because f(z) is applied element-wise.
        /// --------------------------------
        pub fn backward(self: *Self, upstream_matrix: Matrix(T, OutputDimension[0], OutputDimension[1]), hypr_param: *HyperParameters) !Matrix(T, InputDimension[0], InputDimension[1])  {
            // const param_value: ?f16 = if (self.activation() == ActivationFunction.LeakyRelu)
            //     hypr_param.*.alpha
            // else
            //     null; 

            var cached_input = self.cached_input.?.*; 
            var da_dz = self.cached_z.?; 

            self.apply_activation(&da_dz, true); // f′(z) partial derivative. 
           
            const dz = upstream_matrix.hadamard_product(da_dz) catch unreachable; 

            if (cached_input.transpose().cols != dz.rows) {
                if(builtin.mode == .Debug) std.log.debug("A transpose: {any}\n", .{cached_input.transpose()});
                @panic("Calculating dl_dw failed, dimension mismatch - backprop for dl/dz in hidden layer failed!"); 
            }

            const dl_dw: Matrix(T, WeightDimension[0], WeightDimension[1]) = if (Convention == .ColumnFeatureOrdering) 
                dz.matmul(cached_input.transpose()) //dW₃ = dz₃ · a₂ᵀ
            else 
                cached_input.transpose().matmul(dz);

            const dl_db = self.bias_derivative(dz); 
            
            // New Propagator - Upstream term
            const propagator = if (Convention == .ColumnFeatureOrdering and !Self.isOutputLayer)
                self.weight_matrix.?.transpose().matmul(dz)
            else 
                dz.matmul(self.weight_matrix.?.transpose()); 

            if(builtin.mode == .Debug){
                std.debug.assert(dl_dw.rows == WeightDimension[0] and dl_dw.cols == WeightDimension[1]); 
                std.debug.assert(propagator.rows == InputDimension[0] and propagator.cols == InputDimension[1]);
            }

            try self.update_params(dl_dw, dl_db, hypr_param); 
            return propagator; 
        }

        /// Computing for the specific layer: z = X*W + B. The node computation should
        /// wrap inside an activation function.
        /// They pseudo logic is: z = (weight_matrix[i][0..]*x[0..]) + bias_vector[0..]
        /// Remember(!): The activation output of each layer has the shape (n^[L], m).
        /// Where "m" represent the batch size / or sample size.
        /// -------------------------------------
        pub fn feedforward(self: *Self, prior_output: *const Matrix(T, InputDimension[0], InputDimension[1]), hypr_param: *const HyperParameters) Matrix(T, OutputDimension[0], OutputDimension[1]) {
            var param_value: ?f32 = null; 
            const OutputMatrixType = @TypeOf(self.cached_activation.?); // Expected Output Matrix dimension
            // var output_matrix: OutputMatrixType = undefined; // CHECK THIS!  

            // std.debug.print("Feedforward for Layer: {d}\n", .{self.id_seed}); 

            if (self.activation() == ActivationFunction.LeakyRelu) {
                // std.debug.print("Alpha received: {any}\n", .{hypr_param});
                param_value = hypr_param.*.alpha;
            }else{
                param_value = null; 
            }

            var output_matrix: OutputMatrixType = switch (Convention) {
                // When convention is column-major (features as rows, samples as columns).
                .ColumnFeatureOrdering => self.weight_matrix.?.matmul(prior_output),

                // When convention is row-major (features as columns, samples as rows).
                // Then we multiply in the order: X*W
                .RowSampleOrdering => prior_output.matmul(self.weight_matrix.?),
            };

            // This would add the bias to the matrix depending on the matrix type.
            // E.g., if the matrix has column vector shape (N x 1), row vector shape (1 X N),
            // or multi row and column matrix shape (M x N).

            output_matrix.broadcasting(self.bias_vector.?, Convention) catch |err| {
                if(builtin.mode == .Debug){
                    self.weight_matrix.?.print_matrix("", PRINTMODE);
                    output_matrix.print_matrix("", PRINTMODE);
                }
                std.log.err("Broadcasting error: {any}\n", .{err});
            };

            self.cached_input = prior_output;
            self.cached_z = output_matrix;

            self.apply_activation(&output_matrix, false);
            self.cached_activation = output_matrix;

            return self.cached_activation.?;
        }

        fn apply_activation(self: *Self, output_matrix: anytype, deriv_flag: bool) void {
            const M: usize = @typeInfo(@TypeOf(output_matrix.*)).@"struct".fields[1].defaultValue().?;
            const N: usize = @typeInfo(@TypeOf(output_matrix.*)).@"struct".fields[2].defaultValue().?;
            const ColVectorLength = M;
            const RowVectorLength = N;

            if (self.cached_z == null) {
                std.debug.print("self.cached info: {any}, type: {any}\n", .{ self.cached_z, @TypeOf(self.cached_z) });
                // @compileError("Need to run / calculate z value, before applying activation function!");
            }

            switch (output_matrix.mat_type) {
                .ColumnVector => {
                    var column_vec = output_matrix.*.get_colvec(0); // Obtains the (1 x n) vector.
                    const activation_vec = self.activation().execute_fn(T, ColVectorLength, column_vec[0..], deriv_flag);

                    output_matrix.*.set_colvec(0, activation_vec[0..]); 
                },
                .RowVector => {
                    var row_entries = output_matrix.*.mat[0];
                    output_matrix.*.mat[0] = self.activation().execute_fn(T, RowVectorLength, row_entries[0..], deriv_flag);
                },
                .Default => {
                    // When shape of matrix is (M x N). E.g., 3 x 2.
                    // We apply activation function element-wise by iterating
                    // each row or column in the matrix, depending on convention used.
                    switch (Convention) {
                        .ColumnFeatureOrdering => {
                            inline for (0..N) |j| {
                                var sample_val = output_matrix.*.get_colvec(j);
                                const activation_vec = self.activation().execute_fn(T, ColVectorLength, sample_val[0..], deriv_flag);
                                output_matrix.*.set_colvec(j, activation_vec[0..]); 
                            }
                        },
                        .RowSampleOrdering => {
                            inline for (0..M) |i| {
                                const row_vals = self.activation().execute_fn(T, RowVectorLength, output_matrix.*.mat[i][0..], deriv_flag);
                                output_matrix.*.mat[i] = row_vals;
                            }
                        }
                    }
                },
            }
        }

        fn get_dimension(self: Self) LayerDim {
            const input_len = self.layer_info.dim(0);
            const hidden_len = self.layer_info.dim(1);
            return LayerDim{ input_len, hidden_len };
        }

        fn apply_weights(self: *Self) !void {
            // const self: *Layer(T, InfoLayer) = @ptrCast(@alignCast(ctx_ptr));
            var rgen = std.Random.DefaultPrng.init(self.id_seed);
            const rand = rgen.random();
            var random_gen = std.Random.Pcg.init(rand.int(u32));
            const random = random_gen.random();

            const WeightMatrixType = @TypeOf(self.weight_matrix.?); 
            const RowSize: usize = @typeInfo(WeightMatrixType).@"struct".fields[1].defaultValue().?;
            const ColumnSize: usize = @typeInfo(WeightMatrixType).@"struct".fields[2].defaultValue().?;

            // const value = min + (rand_float * (max - min));
            const scaling = @sqrt(0.1 / @as(f32, @floatFromInt(RowSize)));
            
            for (0..RowSize) |i| {
                for (0..ColumnSize) |j| {
                    const val_rand = random.float(f32);
                    const rand_val = random.float(f32);
                    const norm = @sqrt(-2.0 * @log(val_rand)) * @cos(2.0 * std.math.pi * rand_val);
                    const scaled_val = norm * scaling; 
                    self.weight_matrix.?.mat[i][j] = @as(T, @floatCast(scaled_val));
                }
            }
        }

        fn apply_bias(self: *Self) !void {
            if (Convention == .ColumnFeatureOrdering and SizeOfLayer != WeightDimension[0]) {
                return error.BiasSizeNeedToMatchTheRowDimensionOfWeightMatrix;
            }else if (Convention == .RowSampleOrdering and SizeOfLayer != WeightDimension[1]) {
                return error.BiasSizeNeedToMatchTheColumnDimensionOfWeightMatrix;
            }else {
                var rgen = std.Random.DefaultPrng.init(self.id_seed);
                const rand = rgen.random();
                var random_gen = std.Random.Pcg.init(rand.int(u32));
                const random = random_gen.random();
                const min_val: T = -0.1; 
                const max_val: T = 0.1; 

                for (0..@as(usize, SizeOfLayer)) |n| {
                    const random_float = random.float(f32);
                    const activation_fn = self.activation();
                    if (activation_fn == .SoftMax and Self.isOutputLayer()){
                        self.bias_vector.?[n] = 0.0;
                    }else {
                        const value = min_val + (random_float * (max_val - min_val));
                        self.bias_vector.?[n] = @as(T, @floatCast(value));
                    } 

                }
            }
        }

        fn apply_zeroes(self: *Self) !void {
            const WeightMatrixType = @TypeOf(self.weight_matrix.?); 
            const RowSize: usize = @typeInfo(WeightMatrixType).@"struct".fields[1].defaultValue().?;
            const ColumnSize: usize = @typeInfo(WeightMatrixType).@"struct".fields[2].defaultValue().?;

            self.weight_matrix = Matrix(T, RowSize, ColumnSize).create(std.mem.zeroes([RowSize][ColumnSize]T));
            self.bias_vector = std.mem.zeroes([SizeOfLayer]T);
            // self.bias_vector = @splat(T);
        }
    };
}

pub fn Matrix(comptime T: type, comptime nrows: usize, comptime ncols: usize) type {
    return struct {
        const Rows = nrows;
        const Cols = ncols;
        pub const Capacity: usize = Rows * Cols;
        const Self = @This();
       
        mat: [Rows][Cols]T = undefined,
        rows: usize = Rows,
        cols: usize = Cols,
        mat_type: MatrixType = if (ncols == 1) MatrixType.ColumnVector else if (nrows == 1) MatrixType.RowVector else MatrixType.Default,

        pub fn create(initial_values: [nrows][ncols]T) Self {
            return Self{
                .mat = initial_values,
                .rows = initial_values.len,
                .cols = ncols,
            };
        }

        pub fn empty() Self {
            return Self{
                .mat = undefined,
                .rows = nrows,
                .cols = ncols,
            };
        }

        pub fn zeroes() Self {
            return Self{
                .mat = std.mem.zeroes([Rows][Cols]T),
                .rows = nrows,
                .cols = ncols,
            };
        }

        pub const MatrixType = enum {
            ColumnVector,
            RowVector,
            Default,
        };

        pub const ElementOperation = enum {
            Add,
            Mul,
            Sub,
        };

        pub fn total_len(_: Self) usize {
            return Capacity; 
        }

        pub fn memory_layout(self: Self) void {

            const base_addr = @intFromPtr(&self); 
            const mat_addr = @intFromPtr(&self.mat);
            
            // const offset_incrementor: u32 = @bitSizeOf(f32); // 2 byte offset as u32 (zero extended)
            // const hex_addr: u32 = 0x04; // Address length
            // const next_addr: u32 = hex_addr + offset_incrementor; 
            std.debug.print("Size of element data type: 0b{b} = {d} = 0x{x}\n", .{@bitSizeOf(T), @bitSizeOf(T), @bitSizeOf(T)});
            std.debug.print("Base address of Self: 0x{x}, Matrix address: 0x{x}\n", .{base_addr, mat_addr});

            
            inline for (0..Rows) |i| {
                inline for (0..Cols) |j| {
                    print_fn(PRINTMODE, "Matrix element[{d}][{d}] address: 0x{x}, in bits: 0b{b:0>16}\nElement as decimal address: {d}\n", .{i, j, @intFromPtr(&self.mat[i][j]), @intFromPtr(&self.mat[i][j]), @intFromPtr(&self.mat[i][j])});
                }
            }
        }

        pub fn print_matrix(self: Self, comptime header_info: []const u8, comptime stdout_mode: PrintMode) void {
            // String literals: *const [0:]u8 vs []const u8
            const width = Cols;
            const height = Rows; 
            const upperleft = "\u{2308}";
            const upperright = "\u{2309}";
            const bottomleft = "\u{230A}";
            const bottomright = "\u{230B}";
            const pipe = "|";
            const start_bracket = "[";
            const end_bracket = "]";

            const cell_fmt = if (@typeInfo(T) == .float and @sizeOf(T) == 4) "{d: ^9.5}" else "{d: ^9.5}";
            
            if (header_info.len < 1){
                print_fn(stdout_mode, "Matrix Dimension: \x1b[32m({d},{d})\x1b[0m, Type: \x1b[34m{s}\x1b[0m ↓\n", .{
                    Rows, 
                    Cols, 
                    @tagName(self.mat_type)}); 
            }else {
                print_fn(stdout_mode, "Matrix Dimension: \x1b[32m({d},{d})\x1b[0m, Type: \x1b[34m{s}\x1b[0m ↓ - [{s}]\n", .{
                    Rows, 
                    Cols, 
                    @tagName(self.mat_type), 
                    header_info}); 
            }

            // var fmt_buffer: [20][]const u8 = undefined;
            // var fmt_array = std.ArrayList([]const u8).initBuffer(&fmt_buffer);
            // fmt_array.appendSliceBounded(std.fmt.comptimePrint(" ABC...\n", .{})) catch unreachable;

            // fmt_array.appendBounded(std.fmt.comptimePrint(" ABC...\n", .{})) catch unreachable;
            // print_fn(stdout_mode, comptime fmt_array.items[0], .{});

            for (0..height) |i|{
                if (i == 0){
                    if (Rows == 1){
                        print_fn(stdout_mode, "{s} ", .{start_bracket});
                        // fmt_array.printBounded("{s} ", .{start_bracket}) catch {};
                    }else {
                        print_fn(stdout_mode, "{s} ", .{upperleft});
                        // fmt_array.printBounded("{s} ", .{upperleft}) catch {};
                    }
                }else if (i == height - 1){
                    print_fn(stdout_mode, "{s} ", .{bottomleft});
                    // fmt_array.printBounded("{s} ", .{bottomleft}) catch {};
                }else {
                    print_fn(stdout_mode, "{s} ", .{pipe});
                    // fmt_array.printBounded("{s} ", .{pipe}) catch {};
                }
                // Formatting for each data cell in the matrix     
                for (0..width) |j|{
                    const element: T = self.mat[i][j];

                    if (j == 0 and Cols > 1){
                        // print_fn(stdout_mode, "{d: <4}", .{element});
                        print_fn(stdout_mode, cell_fmt, .{element});
                        // fmt_array.printBounded(cell_fmt, .{element}) catch {};
                    }else if (self.mat_type == .RowVector){
                        if (@as(T, element) >= 10.0){
                            print_fn(stdout_mode, cell_fmt, .{element});
                            // fmt_array.printBounded(cell_fmt, .{element}) catch {};
                        }else{
                            print_fn(stdout_mode, cell_fmt, .{element});
                            // fmt_array.printBounded(cell_fmt, .{element}) catch {};
                        }
                    }else if (Cols == 1){
                        print_fn(stdout_mode, " {: ^7.5}", .{element});
                        // fmt_array.printBounded(" {: ^7.5}", .{element}) catch {};
                    }else if(self.mat_type == .Default) {
                        print_fn(stdout_mode, cell_fmt, .{element});
                        // fmt_array.printBounded(cell_fmt, .{element}) catch {};
                    }
                    else {
                        print_fn(stdout_mode, cell_fmt, .{element});
                        // fmt_array.printBounded(cell_fmt, .{element}) catch {};
                    }
                }
                if (i == 0) {
                    if (Rows == 1){
                        print_fn(stdout_mode, "{s}\n", .{end_bracket});
                        // fmt_array.printBounded("{s}\n", .{end_bracket}) catch {};
                    }else {
                        print_fn(stdout_mode, " {s}\n", .{upperright});
                        // fmt_array.printBounded(" {s}\n", .{upperright}) catch {};
                    }
                } else if (i == height - 1) {
                    if (Cols == 1){
                        print_fn(stdout_mode, " {s: <3}\n", .{bottomright});
                        // fmt_array.printBounded(" {s: <3}\n", .{bottomright}) catch {};
                    }else {
                        print_fn(stdout_mode, " {s}\n", .{bottomright});
                        // fmt_array.printBounded(" {s}\n", .{bottomright}) catch {};
                    }
                } else {
                    if (Cols == 1){
                        print_fn(stdout_mode, " {s: <3}\n", .{pipe});
                        // fmt_array.printBounded(" {s: <3}\n", .{pipe}) catch {};
                    }else {
                        print_fn(stdout_mode, " {s}\n", .{pipe});
                        // fmt_array.printBounded(" {s}\n", .{pipe}) catch {};
                    }
                }
            }
            
            print_fn(stdout_mode, "\n", .{});
            // fmt_array.printBounded("\n", .{}) catch {};
            // const final_fmt: []const u8 = @constCast(fmt_array.items);
            // print_fn(stdout_mode, fmt_builder, .{});
            // print_fn(stdout_mode, fmt_array.items, .{});
            
        }

        /// Used when updating the bias and weights during SGD. 
        pub fn scalar_multiplication(self: *Self, scalar: T) void {
            const scalar_vec: @Vector(Cols, T) = @splat(scalar); 
            inline for (0..Rows) |i| {
                const row_vec: @Vector(Cols, T) = self.mat[i]; 
                const applied_row = scalar_vec * row_vec;
                self.mat[i] = applied_row; 
            }
        }

        pub fn get_dimension(self: Self) struct { usize, usize } {
            return .{ self.rows, self.cols };
        }

        pub fn flatten_array(self: Self) [nrows * ncols]T {
            var item_offset: usize = 0;
            var array: [nrows * ncols]T = undefined;
            for (0..nrows) |row_offset| {
                const row_slice = self.mat[row_offset][0..ncols];
                @memcpy(array[item_offset .. item_offset + ncols], row_slice);
                item_offset += ncols;
            }
            return array;
        }

        pub fn from_array(data: [Rows * Cols]T, comptime Convention: InputShapeConvention) Self {
            var new_mat: [Rows][Cols]T = undefined;
            var data_offset: usize = 0; // runtime known. 
            _ = &data_offset; 
            if (Convention == .RowSampleOrdering) {
                for (0..Rows) |row| {
                    // To extract a comptime-known length from a runtime-known offset,
                    // first extract a new slice from the starting offset, then an array of comptime-known length. 
                    // new_mat[row] = data[data_offset .. data_offset + Cols].*;
                    new_mat[row] = data[data_offset..][0..Cols].*;
                    data_offset += Cols;
                }
            }else {
                for (0..Cols) |col| {
                    for (0..Rows) |row| {
                        new_mat[row][col] = data[data_offset];
                        data_offset += 1;
                    }
                }
            }
            return create(new_mat);
        }

        /// Broadcasting: C_{i,j} = A_{i,j} + b_j.
        /// This mode should be run when `MatrixType` is MatrixType.Default.
        /// Important(!): In deep learning, addition of a matrix and a vector, called `broadcasting` is allowed.
        /// This would yield another matrix: C = A + b, where C_{i,j} = A_{i,j} + b. Where the vector (b) is added,
        /// to each row of the matrix.
        pub fn broadcasting(self: *Self, vec: anytype, MatrixConvention: InputShapeConvention) !void {
            // E.g., Matrix of shape (Rows, Cols), Matrix(M x 1), vec(1 x 3)
            // var col_vector: @TypeOf(vec) = undefined;
            // const ColVectorLength = Rows;
            const VecLength: usize = @typeInfo(@TypeOf(vec)).vector.len;
            const VecDimension = struct{usize, usize};
            const vec_dim = VecDimension{1, VecLength};

            if ((self.cols == vec_dim[1] or self.cols == 1 or vec_dim[1] == 1 or (MatrixConvention == .ColumnFeatureOrdering and vec_dim[0] == 1)) and (self.rows == vec_dim[0] or self.rows == 1 or vec_dim[0] == 1)){
                // std.debug.print("Broadcasting is possible - Convention: {s} [CHECK OK]\n", .{@tagName(MatrixConvention)});
                // std.debug.print("Bias vector: {any}\n", .{vec});
                // std.debug.print("Weighted Sum Matrix passed during broadcasting: \n", .{});
                // self.print_matrix("");
            }else {
                print_fn(PRINTMODE, "Broadcasting is not possible - Convention: {s} [CHECK FAILED]\n", .{@tagName(MatrixConvention)});
                // std.debug.print("Broadcasting is not possible - Convention: {s} [CHECK FAILED]\n", .{@tagName(MatrixConvention)});
                return error.BroadcastingIsNotPossibleShapeCheckFailed; 
            }

            if (self.mat_type == MatrixType.RowVector or (self.mat_type == MatrixType.Default and self.rows == 1)) {
                // The vec `anytype` should be of type @Vector(Cols, T) - Row-wise broadcasting.
                const RowVector = @Vector(Cols, T);
                // const broadcasted_vec: RowVector = @splat(vec[0]);
                 
                std.debug.assert(self.mat[0].len == Cols);
                const matrix_row = self.mat[0];
                const row_vector: RowVector = matrix_row[0..Cols].*; 
                
                if (@TypeOf(row_vector) == @TypeOf(vec)){
                    const new_vector = row_vector + vec; 
                    self.mat[0] = new_vector;  
                }else {
                    return error.VectorDimensionForAddingElementWiseIsNotTheSame;
                    // @panic("Vector dimension does not match, for row vector!");
                }


            // }else if (self.mat_type == MatrixType.ColumnVector or (self.mat_type == MatrixType.Default) and self.cols == 1){
            }else if (self.mat_type == MatrixType.ColumnVector){
                // The vec `anytype` should be of type @Vector(Rows, T) - Column-wise broadcasting.
                
                // Row-major: bias acts like a scalar (len == 1)
                // Col-major: bias is per-row (len == Rows)
                std.debug.assert(
                    if (MatrixConvention == .RowSampleOrdering) (VecLength == 1) else (VecLength == Rows)
                );

                for (0..Rows) |i| {
                    // std.debug.print("vec: {any}\n", .{vec});
                    // self.mat[i][0] = self.mat[i][0] + vec[i]; // Old broken...
                    const add_val: T = if (MatrixConvention == .RowSampleOrdering) vec[0] else vec[i];
                    self.mat[i][0] = self.mat[i][0] + add_val;
                }
            }else if (self.mat_type == MatrixType.Default and (self.rows > 1) and self.cols > 1){

                if (false){
                    @panic("In branch: self.mat_type == MatrixType.Default and (self.rows > 1) and self.cols > 1)");
                }

                switch (MatrixConvention) {
                    .RowSampleOrdering => {
                        // Broadcasting would take (1, m) → (n, m).    
                        // Example: Bias(1, 3) → Matrix(4, 3)
                        if (VecLength == self.cols and VecLength != self.rows) {
                            for (0..self.rows) |i| {
                                const row_vector: @Vector(Cols, T) = self.mat[i][0..Cols].*; 

                                if (@TypeOf(row_vector) == @TypeOf(vec)){
                                    const new_vec = row_vector + vec; 
                                    self.mat[i] = new_vec;
                                }else{
                                    return error.RowSizeOfMatrixAndVectorDoesNotMatch;
                                }
                            }
                        }

                    },
                    .ColumnFeatureOrdering => {
                        // The vector should be interpreted as a column vector (m, 1) but always have type 
                        // of a row vector self.bias = vec = @Vector(SizeOfLayer, T).
                        // Broadcasting would take (n, 1) → (n, m). 
                        
                        if (VecLength == self.rows){
                            // Broadcasting extending from (m, 1) to (m, n)
                            for (0..Rows) |n| {
                                const column_value: T = vec[n]; 
                                // This would create a temporary broadcasted vector with length same as 
                                // target matrix number of columns. 
                                const broadcasted_row: @Vector(Cols, T) = @splat(column_value); 
                                const matrix_row: @Vector(Cols, T) = self.mat[n][0..Cols].*;  
                                const updated_row = matrix_row + broadcasted_row; 
                                self.mat[n] = updated_row;  
                            }
                        }else {
                            return error.ColumnVectorSizeDoNotMatchSizeOfMatrixColumn; 
                        }
                    },
                }

            }else {
                return error.BroadcastingIsNotValidForTheMatrixAndBiasVector;
            }

        }
                

        /// SIMD instruction utilization, calculating the dot product.
        /// The input should be represented as matrices of type:
        /// A = []const @Vector(LayerSize, T), B = same type as A.
        /// The dot product would multiple rows from A with cols from B.
        // inline fn dotSIMD(comptime vec_size: usize, vec_a: []const T, vec_b: []const T) linksection(".iram0.text") T {
        inline fn dotSIMD(comptime vec_size: usize, vec_a: []const T, vec_b: []const T) T {
            const VecSize: usize = comptime vec_size;
            const FeatureVector = @Vector(VecSize, T);

            // You can also assign from a slice with comptime-known length to a vector using .*
            const vec1: FeatureVector = vec_a[0..VecSize].*; // from slice to vec / array type by dereferencing.
            const vec2: FeatureVector = vec_b[0..VecSize].*;
            // const product: FeatureVector = vec1 * vec2; // Element-wise multiplication.
            return @reduce(.Add, vec1 * vec2);
            // return @reduce(.Add, product);
        }

        pub fn elementwise_function(self: *Self, f: fn (T) T) void {
            const apply_op = struct {
                fn apply(entries: [Cols]T) @Vector(Cols, T) {
                    var row_vector: @Vector(Cols, T) = undefined;
                    inline for (0..Cols) |j| {
                        row_vector[j] = f(entries[j]);
                    }
                    return row_vector;
                }
            }.apply;

            inline for (0..Rows) |i| {
                const row_vec: @Vector(Cols, T) = apply_op(self.mat[i]);
                self.mat[i] = @as([Cols]T, row_vec);
            }
        }

        /// The elementwise_operation, would pass the vector operation to apply to all elements 
        /// in the matrix. Togheter with a scalar value to apply on every entries. 
        /// For instance, first a row vector is created using the @splat bultin. 
        /// Then this vector is applied row-wise over all elements. 
        pub fn elementwise_operation(self: *Self, other: *const Self, op: ElementOperation) !void {
            // const apply_op = struct {
            //     fn apply(mat_row: [Cols]T, other_row: [Cols]T, operation: ElementOperation) !@Vector(Cols, T) {
            //         var row_vector: @Vector(Cols, T) = mat_row;
            //         const other_vector: @Vector(Cols, T) = other_row;
            //         switch (operation) {
            //             .Add => row_vector += other_vector, // row_vector = row_vector + other_vector.
            //             .Mul => row_vector *= other_vector,
            //             .Sub => row_vector -= other_vector, 
            //         }
            //         return row_vector;
            //     }
            // }.apply;
            
            inline for (0..Rows) |i| {
                // const applied_row: [Cols]T = apply_op(self.mat[i]);
                // self.mat[i] = try apply_op(self.mat[i], other.mat[i], op); 
                inline for (0..Cols) |j|{
                    const a = self.mat[i][j];
                    const b = other.mat[i][j];
                    self.mat[i][j] = switch (op){
                        .Add => a + b,
                        .Mul => a * b,
                        .Sub => a - b,
                    };
                }
            }
        }

        /// Element-wise multiplication (⊙). The `Hadamard product` is valid for the size requirment,
        /// when both matrices have the same dimension (m x n). This operation is used, e.g.,
        /// when applying or changing the weights during gradient descent learning algorithm.
        pub inline fn hadamard_product(self: Self, matrix: anytype) !Matrix(T, Rows, Cols) {
            const M: usize = @typeInfo(@TypeOf(matrix)).@"struct".fields[1].defaultValue().?;
            const N: usize = @typeInfo(@TypeOf(matrix)).@"struct".fields[2].defaultValue().?;

            if (Rows != M and Cols != N) {
                return error.NoMatchingDimensionError;
            }
            var updated_mat: [Rows][Cols]T = undefined;
            inline for (0..Rows) |i| {
                const row_vec: @Vector(Cols, T) = self.mat[i];
                const row_other: @Vector(N, T) = matrix.mat[i]; // copy matrix row.
                const new_row = row_vec * row_other;
                updated_mat[i] = new_row;
            }
            return Matrix(T, Rows, Cols).create(updated_mat);
        }


        /// Matrix multiplication Optimized - `matmul`. 
        /// /// output → self × rhs  (with no return-by-value)
        /// Is a linear transformation, that utilize the dot product,
        /// over the rows of the first and cols of the second matrix.
        /// Dot product operation on two matrices A and B. This operation yields a new matrix dimension.
        /// E.g., A = m x n, and B = n x p, would give us AB = C. Where C = m x p.
        pub inline fn matmul_optimized(
            self: *const Self,
            rhs: anytype,
            output: *Matrix(T, Rows, switch(@typeInfo(@TypeOf(rhs))){
                .pointer => |ptr| @typeInfo(ptr.child).@"struct".fields[2].defaultValue().?,
                .@"struct" => |strct| strct.fields[2].defaultValue().?,
                else => @compileError("rhs arg needs to be Matrix or *Matrix")}) 
        )linksection(".iram0.text") void{
            @setFloatMode(.optimized);
            @setEvalBranchQuota(7000);
            const Rhs = switch (@typeInfo(@TypeOf(rhs))) {
                .pointer => |ptr| @typeInfo(ptr.child).@"struct",
                .@"struct" => |strct| strct,
                else => @compileError("rhs_mat must be Matrix or *Matrix"),
            };

            const M: usize = Rhs.fields[1].defaultValue().?; // rhs rows
            const N: usize = Rhs.fields[2].defaultValue().?; // rhs cols
            std.debug.assert(Cols == M);

            // zero out destination
            inline for (0..Rows) |i| {
                inline for (0..N) |n| output.mat[i][n] = 0;
            }

            // dot products
            inline for (0..Rows) |i| {
                inline for (0..N) |n| {
                    var acc: T = 0;
                    inline for (0..Cols) |k| acc += self.mat[i][k] * rhs.mat[k][n];
                    output.mat[i][n] = acc;
                }
            }
        }

        /// output += self × rhs  (accumulate version; optimized for RNN operation)
        pub inline fn matmul_optimized_acc(
            self: *const Self,
            rhs: anytype,
            output: anytype,
        )linksection(".iram0.text") void{
            @setFloatMode(.optimized);
            @setEvalBranchQuota(7000);

            const Out = switch (@typeInfo(@TypeOf(output))) {
                .pointer => |ptr| @typeInfo(ptr.child).@"struct",
                .@"struct" => |strct| strct,
                else => @compileError("out mat must be Matrix or *Matrix"),
            };

            const OutRows: usize = Out.fields[1].defaultValue().?;
            const OutCols: usize = Out.fields[2].defaultValue().?;

            const Rhs = switch (@typeInfo(@TypeOf(rhs))) {
                .pointer => |ptr| @typeInfo(ptr.child).@"struct",
                .@"struct" => |strct| strct,
                else => @compileError("rhs_mat must be Matrix or *Matrix"),
            };

            const RowsRhs: usize = Rhs.fields[1].defaultValue().?;
            const ColsRhs: usize = Rhs.fields[2].defaultValue().?;

            if (builtin.mode == .Debug){
                std.debug.assert(Cols == RowsRhs);
                std.debug.assert(OutRows == Rows);
                std.debug.assert(OutCols == ColsRhs);
            }

            // const M: usize = Rhs.fields[1].defaultValue().?; // rhs rows
            // const N: usize = Rhs.fields[2].defaultValue().?; // rhs cols
            // std.debug.assert(Cols == M);

             inline for (0..OutRows) |i| {
                inline for (0..ColsRhs) |n| {
                    var acc: T = 0;
                    inline for (0..Cols) |k| acc += self.mat[i][k] * rhs.mat[k][n];
                    output.mat[i][n] += acc;
                }
            }

        }

        /// Matrix multiplication - `matmul`. Is a linear transformation, that utilize the dot product,
        /// over the rows of the first and cols of the second matrix.
        /// Dot product operation on two matrices A and B. This operation yields a new matrix dimension.
        /// E.g., A = m x n, and B = n x p, would give us AB = C. Where C = m x p.
        pub inline fn matmul(self: Self, rhs_mat: anytype) linksection(".iram0.text") Matrix(T, Rows, switch (@typeInfo(@TypeOf(rhs_mat))) {
        // pub inline fn matmul(self: Self, rhs_mat: anytype) Matrix(T, Rows, switch (@typeInfo(@TypeOf(rhs_mat))) {
            .pointer => |ptr| @typeInfo(ptr.child).@"struct".fields[2].defaultValue().?,
            .@"struct" => |strct| strct.fields[2].defaultValue().?,
            else => @compileError("the rhs_mat arg needs to be Matrix or *Matrix"),
        }) {
            @setFloatMode(.optimized);

            // const ABC: usize = @typeInfo(@TypeOf(rhs_mat)).pointer.child;
            const RhsMatrixType = switch (@typeInfo(@TypeOf(rhs_mat))) {
                .pointer => |ptr| @typeInfo(ptr.child).@"struct",
                .@"struct" => |strct| strct,
                else => @compileError("the rhs_mat arg needs to be Matrix or *Matrix"),
                
            };
            // const M: usize = @typeInfo(@TypeOf(rhs_mat)).@"struct".fields[1].defaultValue().?;
            // const N: usize = @typeInfo(@TypeOf(rhs_mat)).@"struct".fields[2].defaultValue().?;

            const M: usize = RhsMatrixType.fields[1].defaultValue().?;
            // const M: usize = Self.Rows;
            const N: usize = RhsMatrixType.fields[2].defaultValue().?;
            std.debug.assert(Cols == M); 

            if (Cols != M) {
                // std.debug.print("Cols != M: {any}\n{any}\n", .{self.mat, rhs_mat.mat}); 
                // @compileError("The matrix dimension do not match. Check that LHS matrix's col == RHS matrix's row.");
            }

            // From M x N to N x M transformation.
            var new_mat: [Rows][N]T = undefined;

            // Now we can utilze dot product over same size vectors.
            inline for (0..Rows) |i| {
                inline for (0..N) |n| {
                    const row_rhs = rhs_mat.get_colvec(n);
                    new_mat[i][n] = dotSIMD(Cols, self.mat[i][0..], row_rhs[0..]);
                    // new_mat[i][n] = dot_value;
                }
            }
            return Matrix(T, Rows, N).create(new_mat);
        }

        pub fn get_colvec(self: Self, col_index: usize) [Rows]T {
        // pub fn get_colvec(self: Self, col_index: usize) linksection(".iram0.text") [Rows]T {
            var column_vector: [Rows]T = undefined;
            for (0..Rows) |i| {
                column_vector[i] = self.mat[i][col_index];
            }
            return column_vector;
        }
        
        pub fn get_colvec_into(self: *const Self, col_index: usize, buf: []T) void {
            if (builtin.mode == .Debug) std.debug.assert(buf.len >= Rows);
            inline for (0..Rows) |i| buf[i] = self.mat[i][col_index];
        }

        pub fn set_colvec(self: *Self, col_index: usize, vec: []const T) void {
            std.debug.assert(vec.len == Rows);
            std.debug.assert(col_index < Cols);
            // inline for (0..M) |i| {
            //     output_matrix.*.mat[i][j] = activation_vec[i];
            // }
            inline for (0..Rows) |i| {
                self.mat[i][col_index] = vec[i]; 
            }
        }

        pub fn set_rowvec(self: *Self, row_index: usize, vec: []const T) void {
            if (builtin.mode == .Debug){
                std.debug.assert(vec.len == Cols);
                std.debug.assert(row_index < Rows);
            }
            inline for (0..Cols) |j| self.mat[row_index][j] = vec[j];
        }

        /// The transpose would e.g. yield a mapping from 3x2 to 2x3.
        /// Rule: (AB)ᵀ = BᵀAᵀ. 
        /// This transposition algorithm perform either an inplace-algorithm 
        /// transposition, by flipping over its main diagonal. 
        pub fn transpose(self: *Self) linksection(".iram0.text") Matrix(T, Cols, Rows) {
        // pub fn transpose(self: *Self) Matrix(T, Cols, Rows) {
            const is_squared: bool = (Rows == Cols); 
            if (is_squared) {
                // Run specific inplace-algorithm below: 
                var i: usize = 0;
                // for (0..Cols - 1) |j| {
                //     inner: for (1..Rows) |i| {
                //         if (i == j) continue :inner; 
                //         const temp_ij: T = self.mat[i][j]; 
                //         // std.debug.print("Swap {d} with {d}\n", .{temp_ij, self.*.mat[j][i]}); 
                //         self.mat[i][j] = self.mat[j][i];
                //         self.mat[j][i] = temp_ij; 
                //     }
                // }
                // std.debug.print("Transpose compare in-place: {any}\n", .{self.mat});
                while(i < Rows): (i += 1){
                    var j: usize = i + 1;
                    while(j < Cols): (j += 1){
                        const temp = self.mat[i][j];
                        self.mat[i][j] = self.mat[j][i];
                        self.mat[j][i] = temp;
                    }
                }
                return self.*;
            }else {
                var mat_transpose: [Cols][Rows]T = undefined;
                for (0..Cols) |j| {
                    for (0..Rows) |i| {
                        mat_transpose[j][i] = self.mat[i][j];
                    }
                }

                return Matrix(T, Cols, Rows).create(mat_transpose); 

            }
            // return Matrix(T, Cols, Rows).create(self.mat);
        }
    };
}


pub const PrintMode = enum {
    debug_print, 
    log_output,
    buffered,
};

fn buffered_print(comptime fmt: []const u8, args: anytype) void{
    var stdout_buffer: [1024]u8 = undefined;

    var stdout_writer: std.fs.File.Writer = std.fs.File.stdout().writer(&stdout_buffer);
    stdout_writer.interface.print(fmt, args) catch {};
    stdout_writer.interface.flush() catch unreachable;
}

pub fn print_fn(comptime stdout_mode: PrintMode, comptime fmt: []const u8, args: anytype) void{
    const is_embedded = builtin.target.os.tag == .freestanding;

    // var stdout_buffer: ?[1024]u8 = if(builtin.target.os.tag != .freestanding and stdout_mode == .buffered) undefined else null;
    // var stdout_writer: ?std.fs.File.Writer = if(stdout_buffer) |*buffer| io_blk:{
    //     break :io_blk std.fs.File.stdout().writer(buffer);
    // }else null;

    // const print_callable: *const fn(comptime fmt: []const u8, args: anytype) void = switch (stdout_mode) {
    //     .debug_print => std.debug.print, 
    //     .log_output => std.log.debug,
    //     .buffered => &stdout_writer.?.interface.print catch std.debug.print,
    // };
    //
    // print_callable(fmt, args);

    // if(stdout_writer) |*io_writer| io_writer.interface.flush() catch unreachable;

    switch(stdout_mode){
        .debug_print => {
            if(comptime is_embedded){
                std.log.debug(fmt, args);
            }else{
                std.debug.print(fmt, args);
            }
        },
        .log_output => {
            std.log.info(fmt, args);
        },
        .buffered => {
            if(comptime is_embedded){
                std.log.debug(fmt, args);
            }else{
                buffered_print(fmt, args);
            }
        }
    }
    

}

/// The `LayerDim` tuple, should represent the previous layers output dimension.
/// Which is needed for defining the layer weight matrix shape. As well as the
/// output dimension of the current layer.
/// --------------------------------
/// • W^[L] → (n^[L], n^[L-1])
/// • A^[L-1] → (n^[L-1], m)
/// • b^[L] → (n^[L], 1)
/// • Z^[L] → (n^[L], m)
/// --------------------------------
pub const LayerDim = struct { usize, usize };

pub const DataShapeType = enum {
    batch_size,
    /// Same as input size.
    feature_size,
    output_size,
    prev_size,
    /// Same as hidden layer size (or number of units / neurons).
    layer_size,
    num_classes,
};

pub const LayerDataShapes = union(DataShapeType) {
    /// The `batch_size` represent the hyper-parameter that amounts,
    /// for the number of samples (data) passed to the network, 
    /// before updating the models parameter (weights and bias). 
    batch_size: usize, 
    /// This is also known as the input shape and is the dimension,
    /// of a single sample. 
    feature_size: usize,
    /// This is the output size of the layer, 
    /// which equal to the number of neurons in the current layer.
    output_size: usize,

    /// This is the previous layers output size. 
    prev_size: usize, 

    /// Current layer size and is the same as number of neurons in the layer. 
    layer_size: usize, 

    /// The number of classes / labels is the number of possible outcomes or categories the 
    /// network can predict. The size of the output layer, for a classification model, have 
    /// the same amount of neurons as number of classes. 
    num_classes: usize,

    pub fn get_shape(self: LayerDataShapes) usize {
        switch (self) {
           .batch_size => |bsize| return bsize,
           .feature_size => |fsize| return fsize,
           .output_size => |osize| return osize,
           .prev_size => |psize| return psize,
           .layer_size => |lsize| return lsize,
           .num_classes => |nsize| return nsize,
        }
    }
    pub fn get_tag(self: LayerDataShapes) DataShapeType {
        switch (self) {
           .batch_size => DataShapeType.batch_size,
           .feature_size => DataShapeType.feature_size,
           .output_size => DataShapeType.output_size,
           .prev_size => DataShapeType.prev_size,
           .layer_size => DataShapeType.layer_size,
           .num_classes => DataShapeType.num_classes,
        }
    }
};

pub const InternalDimension = struct{
    input_dim: struct{usize, usize},
    weight_dim: struct{usize, usize},
    output_dim: struct{usize, usize}, 
}; 

pub const LayerShapes = union(enum) {
    input: InternalDimension,
    hidden: InternalDimension,
    output: InternalDimension,

    pub fn get(self: LayerShapes) InternalDimension {
        switch (self) {
        .input => |input_dimensions| return input_dimensions,
        .hidden => |hidden_dimensions| return hidden_dimensions, 
        .output => |output_dimensions| return output_dimensions,
        }
    }
};

/// This should take in shapes such as `layer_size`, `batch_size`, etc...
pub const LayerDimension = struct{LayerDataShapes, LayerDataShapes, LayerDataShapes};  

/// Number of neurons in the current layer.
pub const LayerSize = struct { usize };

pub const CreateMode = enum(u8){
    Args,
    ParameterSet,
    NewId,
    Inference,
};


/// The following type, is a layer specific config type, describing a layers state. 
/// The shape of a layer is defined by its INPUT- and OUTPUT size. Here the input_dim(D)
/// would represent the previous layers output or the feature size. While the output_dim(H),
/// represents the current layers size (or number of hidden units in the layer).
/// • Feature Size(D): Number of input features per timestep (e.g., number of sensor channels).
/// • Layer Size(H): Number of hidden units / neurons in a specific layer.
/// ----------------------------------
/// Column-Major Dimensions:
///     xₜ ∈ ℝᴰ ˣ ᴮ⁼¹
///     hₜ₋₁, hₜ ∈ ℝᴴ ˣ ¹
///     Wₓ ∈ ℝᴴ ˣ ᴰ
///     Wₕ ∈ ℝᴴ ˣ ᴴ
///     b ∈ ℝᴴ ˣ ¹
/// ----------------------------------
/// Wₓ × xₜ → [H × D] ⋅ [D × 1] = [H × 1]
/// Wₕ × hₜ₋₁ → [H × H] ⋅ [H × 1] = [H × 1]
/// Feedforward RNN:
/// hₜ = ϕ(Wₓ × xₜ + Wₕ × hₜ₋₁ + b) → [H × 1] + [H × 1] + [H × 1] → ...
/// ... → Matrix(T, H, D) ⋅ Matrix(T, D, 1) + Matrix(T, H, H) ⋅ Matrix(T, H, 1) + @Vector(H, T)
/// ----------------------------------
/// Column-Major → (Features x Batch).
/// Row-Major → (Batch x Features).
pub const LayerSettingsV2 = struct {
    const Self = @This();
    /// Characteristics of this layer. 
    kind: LayerTypeV2,
    /// How data is ordered, and can be either row-major (samples row-wise)
    /// or column-major (unique samples on each columns).
    convention: InputShapeConvention,
    /// Same as the Feature size(D).
    input_dim: usize,
    /// The output/hidden dimension represent the layer size(H) or the number of hidden units/neurons 
    /// in the given layer.
    output_dim: usize,
    /// The batch size is mostly relevant for training the network. So 
    /// doing inference-only we set this to a default of 1. 
    batch_size: usize = 1,
    /// Represent the number of timesteps(T), and default to 1 for non-RNN layers.
    timewindow: usize = 1,
    /// Activation function of this layer. Otherwise, null if the layer is e.g., input layer.
    activation: ?ActivationFunction = null,

    pub const Target = enum {
        /// The matrix input to this layer.
        input_matrix,
        /// State and parameters of this layer.
        weight_matrix,
        /// Resulting output matrix of this layer.
        /// Often denoted as Wₓ in formulas, which maps input → hidden space.  
        /// Wₓ = [H x D] = Matrix[H][D] (column-major) and Matrix[D][H] (row-major).
        output_matrix,
        /// Bias vector length (as 1×N or N×1 per depending on convention).
        bias_vector,
        /// Scalar value of the number of hidden units or layer size (H).
        layer_size,
        /// Recurrent weight matrix - representing the shared state in the RNN layer. 
        /// Often denoted as Wₕ in formulas, which maps from previous state → next state. 
        /// Wₕ = [H x H] = Matrix[H][H].
        rnn_weight_matrix,
        /// Represent the cell state denoted as h_t.
        rnn_state,
    };

    pub fn newInputLayer(comptime input_features: usize, comptime Convention: InputShapeConvention, comptime TimeSteps: usize) Self{
        return Self{
            .kind = .Input,
            .convention = Convention,
            .input_dim = input_features,
            .output_dim = input_features, 
            .batch_size = 1,
            .timewindow = TimeSteps, 
            .activation = null,
        };
    }

    pub fn setBatchSize(self: *Self, num_batches: usize) void{
        self.batch_size = num_batches;
    }

    /// The shapes (or dimension) of a target can be either convention dependent 
    /// or independent. When we use a row-major convention the mapping would look 
    /// something like: X[T,IN] * W[IN,OUT] → store W = [IN, OUT] for feedforward.
    /// For column-major we want: W[OUT,IN] * X[IN,T] → store W = [OUT, IN]. This 
    /// way we have the correct dimension constraints during matrix multiplication.
    pub fn getDimensionOf(comptime self: Self, comptime target: Target) switch (target) {
        .layer_size => usize,
        .bias_vector => usize,
        else => struct{usize, usize},
    }{
        const IN = self.input_dim;      // FeatureSize(D).
        const OUT = self.output_dim;    // LayerSize(H).
        const B = self.batch_size;      // BatchSize(B).
        const T = self.timewindow;      // TimeWindow/Timesteps(T).

        // shape0 (out_features) = {shape0} and shape1 (in_features) = {shape1}
        // Pytorch Weight: [OUT, IN], X = [IN, OUT] = [input_features, output_features]
        // RowSampleOrdering: X * Wx → [IN, OUT] * [IN, OUT] → missmatch in zig

        // During initialization when RowSampleOrdering we would need to transpose the
        // weight matrices to match the dimensions. 
        // Since feedforward for RowSampleOrdering would perform X * Wx, we need to:
        // 1. Keep Dim as [OUT, IN] for all the wx undependent on the convention used. 
        // 2. Then we create the matrix from the array.
        // 3. Lastly transpose it the matrix from step 2. 
        return switch (self.kind) {
            .Input => switch (target) {
                .input_matrix, .output_matrix => if(T == 1) 
                    (if (self.convention == .RowSampleOrdering) .{B, IN} else .{IN, B})
                else 
                    (if (self.convention == .RowSampleOrdering) .{T, IN} else .{IN, T}),
                .weight_matrix => .{0, 0},
                .bias_vector => @as(usize, 0), 
                .layer_size => IN,
                .rnn_weight_matrix, .rnn_state => .{0, 0},
            },
            .Dense, .Output => switch(target){
                .input_matrix => input_blk:{
                    if(T == 1){
                        break :input_blk if(self.convention == .RowSampleOrdering) .{B, IN} else .{IN, B};
                    }else{
                        break :input_blk if(self.convention == .RowSampleOrdering) .{T, IN} else .{IN, T};
                    }
                },
                .weight_matrix => if(self.convention == .RowSampleOrdering) .{IN, OUT} else .{OUT, IN},
                .output_matrix => output_blk:{
                    if(T == 1){
                        break :output_blk if(self.convention == .RowSampleOrdering) .{B, OUT} else .{OUT, B};
                    }else{
                        break :output_blk if(self.convention == .RowSampleOrdering) .{T, OUT} else .{OUT, T};
                    }
                },
                // Row-major yields bias vector: 1 x OUT and column-major the bias vector: OUT x 1. 
                .bias_vector => OUT, 
                .layer_size => OUT,
                .rnn_weight_matrix, .rnn_state => .{0, 0},
            },
            .Rnn => switch (target) {
                // Row-major:  T × D   (timesteps × features)
                // Col-major:  D × T   (features × timesteps)
                .input_matrix => if(self.convention == .RowSampleOrdering) .{T, IN} else .{IN, T},
                .weight_matrix => if(self.convention == .RowSampleOrdering) .{IN, OUT} else .{OUT, IN},
                .output_matrix => rnn_output:{
                    if(T == 1){
                        break :rnn_output if(self.convention == .RowSampleOrdering) .{1, OUT} else .{OUT, 1};
                    }else{
                        break :rnn_output if(self.convention == .RowSampleOrdering) .{T, OUT} else .{OUT, T};
                    }
                },
                .bias_vector => if(self.convention == .RowSampleOrdering) OUT else OUT,
                .layer_size => OUT,
                .rnn_weight_matrix => .{OUT, OUT},
                .rnn_state => if(self.convention == .RowSampleOrdering) .{B, OUT} else .{OUT, B},
            },
        };

    }


    pub fn show_info(comptime self: Self) void {
        const Convention = self.convention;
        // const print_mode: PrintMode = if(builtin.cpu.arch != .riscv32 or builtin.is_test) PrintMode.debug_print else PrintMode.log_output;

        const prior_dimension0_str = dim0_blk:{
            if(self.timewindow == 1) {
                break :dim0_blk if(self.convention == .RowSampleOrdering) "BatchSize" else "Input Features";
            }else{
                break :dim0_blk if(self.convention == .RowSampleOrdering) "TimeWindow" else "Input Features";
            }
        };
        
        const prior_dimension1_str = dim1_blk:{
            if(self.timewindow == 1) {
                break :dim1_blk if(self.convention == .RowSampleOrdering) "Input Features" else "BatchSize";
            }else{
                break :dim1_blk if(self.convention == .RowSampleOrdering) "Input Features" else "TimeWindow";
            }
        };
        _ = prior_dimension1_str;
        _ = prior_dimension0_str;

        const input_layer_dim0 = if (self.convention == .RowSampleOrdering) "Batch Size" else "Features";
        const input_layer_dim1 = if (self.convention == .RowSampleOrdering) "Features" else "Batch Size";

        const timewindow_str = if (self.timewindow != 1) std.fmt.comptimePrint("TimeWindow/Timesteps: {d}", .{self.timewindow}) else "";

        const activation_str = if (self.activation != null) std.fmt.comptimePrint("Activation Function: {s}({d})", .{@tagName(self.activation.?), self.activation.?.LeakyRelu}) else "Activation Function: null";

        switch (self.kind) {
            .Input => |info| {
                const InputDimension = self.getDimensionOf(.input_matrix);
                print_fn(PRINTMODE, "    \u{2022} Layer Type: {s}\n    \u{2022} Input Matrix: {}x{} ({s} x {s})\n    \u{2022} {s}\n    \u{2022} Batch Size: {d}\n", .{ 
                    @tagName(info), 
                    InputDimension.@"0", InputDimension.@"1", 
                    input_layer_dim0, input_layer_dim1,
                    timewindow_str,
                    self.batch_size,
                });
            },
            .Dense, .Output => |info| {
                const InputDimension = self.getDimensionOf(.input_matrix);
                const OutputDimension = self.getDimensionOf(.output_matrix);
                const WeightDimension = self.getDimensionOf(.weight_matrix);
                if(info == .Dense){
                    print_fn(PRINTMODE, "    \u{2022} Layer Type: {s}\n    \u{2022} Input Dimension: {}x{}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Output Dimension: {}x{}\n    \u{2022} {s}\n", .{ 
                        @tagName(info), 
                        InputDimension.@"0", InputDimension.@"1",
                        WeightDimension.@"0", WeightDimension.@"1", 
                        OutputDimension.@"0", OutputDimension.@"1", 
                        activation_str,
                    });
                }else{
                    print_fn(PRINTMODE, "    \u{2022} Layer Type: {s}\n    \u{2022} Input Dimension: {}x{}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Output Dimension: {}x{}\n", .{ 
                        @tagName(info), 
                        InputDimension.@"0", InputDimension.@"1",
                        WeightDimension.@"0", WeightDimension.@"1", 
                        OutputDimension.@"0", OutputDimension.@"1", 
                    });

                }
            },
            .Rnn => |info| {
                const InputDimension = self.getDimensionOf(.input_matrix);
                const OutputDimension = self.getDimensionOf(.output_matrix);
                const WeightDimension = self.getDimensionOf(.weight_matrix);
                const RnnWeightDimension = self.getDimensionOf(.rnn_weight_matrix);

                print_fn(PRINTMODE, "    \u{2022} Layer Type: {s}\n    \u{2022} Input Dimension: {}x{}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} RNN Weight Matrix: {}x{}\n    \u{2022} {s}\n    \u{2022} Output Dimension: {}x{}\n    \u{2022} Data Convention: {s}\n", .{ 
                    @tagName(info), 
                    InputDimension.@"0", InputDimension.@"1", 
                    WeightDimension.@"0", WeightDimension.@"1", 
                    RnnWeightDimension.@"0", RnnWeightDimension.@"1", 
                    activation_str, 
                    // prior_dimension0_str, prior_dimension1_str, 
                    OutputDimension.@"0", OutputDimension.@"1", 
                    @tagName(Convention)
                });
            },
        }
        print_fn(PRINTMODE, "||---------------------------------------------||\n", .{});
    }

};

test "layer-settings" {
    print_fn(PRINTMODE, "---Test Block: 'layer-settings'\n", .{});
    const batch_size: usize = 1;
    const timesteps: usize = 10; 
    const input_features: usize = 1;
    const Henc: usize = 16;
    const Hlat: usize = 8;
    const Hdec: usize = 16;

    const input_data_colmajor = [input_features][timesteps]f32{
        [_]f32{ 
            1.0, 0.0, 0.0, 1.0, 0.0, 
            1.0, 1.0, 0.0, 1.0, 0.0
        },
        // [_]f32{ 0.0, 1.0, 1.0, 0.0 },
    };
    
    const input_data_rowmajor = [timesteps][input_features]f32{
        [_]f32{ 1.0 },
        [_]f32{ 0.0 },
        [_]f32{ 0.0 },
        [_]f32{ 1.0 },
        [_]f32{ 0.0 },
        [_]f32{ 1.0 },
        [_]f32{ 1.0 },
        [_]f32{ 0.0 },
        [_]f32{ 1.0 },
        [_]f32{ 0.0 },
    };
    _ = input_data_rowmajor;

    const input_matrix_col = Matrix(f32, input_features, timesteps).create(input_data_colmajor);
    // const input_matrix_row = Matrix(f32, timesteps, input_features).create(input_data_rowmajor);

    input_matrix_col.print_matrix("Input Matrix(X) [Input Features × Timesteps]", PRINTMODE);
    // input_matrix_row.print_matrix("Input Matrix(X) [Timesteps × Input Features]", PRINTMODE);

    // Assume In=1, T=10, Henc=16, Hlat=8, Hdec=16. Shapes you’ll get from getDimensionOf are: 
    // - Input Layer: 
    //      input_matrix  = {T, In} → [10 × 1]
    //      output_matrix = {T, In} → [10 × 1]
    // - Encoder RNN: 
    //      weight_matrix (Wx) = {In, Henc}         → [1 × 16] 
    //      rnn_weight_matrix(Wh) = {Henc, Henc}    → [16 × 16]
    //      rnn_state = {B, Henc}                   → [1 × 16]
    //      output_matrix = {T, Henc}               → [10 × 16]
    // - FC Encoder: 
    //      input_matrix = {T, Henc}        → [10 × 16]
    //      weight_matrix = {Henc, Hlat}    → [16 × 8]
    //      output_matrix = {T, Hlat}       → [10 × 8]
    // - Decoder RNN: 
    //      weight_matrix (Wx) = {Hlat, Hdec}       → [8 × 16]
    //      rnn_weight_matrix(Wh) = {Hdec, Hdec}    → [16 × 16]
    //      rnn_state = {B, Hdec}                   → [1 × 16]
    //      output_matrix = {T, Hdec}               → [10 × 16]
    // - FC Head:
    //      input_matrix = {T, Hdec}        → [10 × 16]
    //      weight_matrix = {Hdec, In}      → [16 × 1]
    //      output_matrix = {T, In}         → [10 × 1]

    // const input_layer_cfg = LayerSettingsV2.newInputLayer(input_features, .RowSampleOrdering, timesteps); // X: [T × D] = [10 × 1]
    const input_layer_cfg = LayerSettingsV2.newInputLayer(input_features, .ColumnFeatureOrdering, timesteps); // X: [D × T] = [1 × 10]
    _ = input_layer_cfg; 

    // wx: [D × H] → RowSampleOrdering
    // wh: [H × H] → RowSampleOrdering
    
    const layer_cfg_rnn_encode = LayerSettingsV2{
        .kind = .Rnn,
        .convention = .ColumnFeatureOrdering,
        .batch_size = batch_size, 
        .input_dim = input_features, // D: Input features.
        .output_dim = Henc, // H: Layer Size.
        .timewindow = timesteps, // T: Timesteps/TimeWindow
        .activation = .{ .LeakyRelu = 0.1 },
    };
    
    //WARN: - Next layer should take the previous layers size as its input_dim. 
    // Also, if the next layer is the output, its output_dim should match the 
    // number of input features(D) from the input matrix.

    const fc_encoder_layer_cfg = LayerSettingsV2{
        .kind = .Dense,
        .convention = .ColumnFeatureOrdering,
        .batch_size = batch_size, 
        .input_dim = Henc, // D: Input features as Henc (previous layer size).
        .output_dim = Hlat, // H: Layer Size as the latent layer size Hlat.
        .timewindow = timesteps, // T: Timesteps/TimeWindow
        .activation = null,
    };

    const rnn_decode_cfg = LayerSettingsV2{
        .kind = .Rnn,
        .convention = .ColumnFeatureOrdering,
        .batch_size = batch_size, 
        .input_dim = Hlat, // D: Input features as Hlat (previous layer size).
        .output_dim = Hdec, // H: Layer Size as the decoder layer size (Hdec).
        .timewindow = timesteps, // T: Timesteps/TimeWindow
        .activation = .{ .LeakyRelu = 0.1 },
    };
    
    const fc_output_cfg = LayerSettingsV2{
        .kind = .Output,
        .convention = .ColumnFeatureOrdering,
        .batch_size = batch_size, 
        .input_dim = Hdec, // D: Input features → Hdec
        .output_dim = input_features, // D → back to feature space.
        .timewindow = timesteps, // T: Timesteps/TimeWindow
        .activation = null, // Pure raw value no activation since its linear. 
    };

    var rnn_enc_layer    =  LayerV2(f32, layer_cfg_rnn_encode).init(.{ .NewId = 1 });
    var fc_encoder_layer =  LayerV2(f32, fc_encoder_layer_cfg).init(.{ .NewId = 2 });
    var rnn_decode_layer =  LayerV2(f32, rnn_decode_cfg).init(.{ .NewId = 3 });
    var output_layer     =  LayerV2(f32, fc_output_cfg).init(.{ .NewId = 4 });
        
    // rnn_enc_layer.state.wx.print_matrix("Layer(1) Wₓ initial", PRINTMODE);
    // rnn_enc_layer.state.wh.print_matrix("Layer(1) Wₕ initial", PRINTMODE);
    // const bias_matrix = Matrix(f32, 3, 1).from_array(rnn_enc_layer.state.bias, .RowSampleOrdering);
    // bias_matrix.print_matrix("Layer(1) bias initial", PRINTMODE);

    // const rnn_encode_out = rnn_enc_layer.feedforward(&input_matrix_row);
    const rnn_encode_out = rnn_enc_layer.feedforward(&input_matrix_col);
    if (rnn_encode_out) |rnn_enc_output|  {
        const fc_encode_out = fc_encoder_layer.feedforward(&rnn_enc_output); 
        if (fc_encode_out)  |fc_enc_output|{
            const rnn_decode_out = rnn_decode_layer.feedforward(&fc_enc_output); 
            if (rnn_decode_out) |rnn_dec_output|{
                const fc_decode_out = output_layer.feedforward(&rnn_dec_output); 
                if(fc_decode_out) |pred|{
                    pred.print_matrix("Prediction Y (Output Layer)", PRINTMODE);
                }
            }  
        }   
    }

    return error.SkipZigTest; 
}


// Computing for the specific layer: z = X*W + B. The node computation should
// wrap inside an activation function.
// They pseudo logic is: z = (weight_matrix[i][0..]*x[0..]) + bias_vector[0..]
// Remember(!): The activation output of each layer has the shape (n^[L], m).
// Where "m" represent the batch size / or sample size.
// -------------------------------------

pub const LayerTypeV2 = enum(u8){
    // Norm,
    // BatchNorm,
    // Dropout,

    /// The Input layer contains no weights. 
    Input = 1,
    Dense = 2,
    /// RNN layers have a state, hₜ, that is updated at each time step as a sequence is processed. 
    /// A cell state is formalized as: hₜ = f𞁤(xₜ, hₜ₋₁), where: 
    /// f𞁤 = function with weights W. 
    /// xₜ = input. 
    /// hₜ₋₁ = prior or old state. 
    Rnn = 3,
    /// The output layer, usally the same as a Dense layer. 
    Output = 4,

    pub fn from(id: u8) LayerTypeV2{
        return @enumFromInt(id);
    }

};

/// Specific Layer types, which dictate the behavior and logic
/// towards a specific layer type.
pub const LayerType = enum(u8) {
    Norm,
    BatchNorm,
    Linear,
    Dense,
    SoftMax,
    Relu,
    LeakyRelu,
    Embedding,
    Dropout,
    MultiHeadAttention,
    Transformer,
    Default,
    Conv1D,
    Lstm,
    Rnn,

    pub fn tryFrom(any: anytype) !LayerType {
        // const info = @typeInfo(@TypeOf(any)); 
        if (@TypeOf(any) == u8){
            return @enumFromInt(any); 
        }

        if (@TypeOf(any) == []const u8 or @TypeOf(any) == [:0]const u8){
            if(std.meta.stringToEnum(LayerType, @tagName(any))) |layer| {
                return layer;
            }
        }

        return error.FailedParsingToLayerType; 

    }
};

pub const LayerTypeSettings = union(LayerType) {
    Norm: void,
    BatchNorm: void,
    Linear: void,
    Dense: void,
    Softmax: void,
    Embedding: void,
    Dropout: void,
    MultiHeadAttention: void,
    Transformer: void,
};


//NOTE: - The input layer's neurons represent the input features. 
// • Number of Samples (Batch Size) = How many individual data points are passed through the network at once. 
//      - A sample could be: a sentance, an image or sensor readings etc...
// ---------------------------------
// • Input Features = how many features (or dimensions) each sample has. E.g.,
// words in a sentacne. 
//      - Example: if we have 100 images, each image has 784 pixels (28x28 grayscale). 
//      Then input shape X = 100 x 784 = Matrix(100, 784).
//      Where 100 → Number of samples (batch size).
//      And 784 → Number of input features. 
//---------------------------------


/// The `InputShapeInfo` would explain how input dimension is propagated to the rest of the network layers. 
/// For example, if input is using a "Row-wise" convention, then input dimension should be Matrix(samples, features).
/// Then the weight matrix in next layer would have dimension of: Matrix(features, num_neurons) or Matrix(prior_output, n).
/// -----------------------------------
/// The input shape can be either X = Matrix(m, n) or X = Matrix(n, m), where m = number of samples (batch size) and n = features.
pub const InputShapeConvention = enum(u8) {
    /// During `FeatureFirst` each column represent a sample, and each row a feature.  
    /// Can also be desribed as "column-major" ordering. 
    ColumnFeatureOrdering = 1,
    /// Whenever `RowSampleOrdering`, we use row-wise convention (batch first).
    /// Where each row is one unique sample, and each column a feature. 
    /// This is also known as "row-major" ordering. 
    /// Row-major matrices mean having one batch item per row.
    /// In `RowSampleOrdering` the input matrix X is a (batch_size x feature_size), 
    /// the feature_size = n = inputs to the neural network. 
    RowSampleOrdering = 2,

    pub fn from(convention_id: u8) InputShapeConvention{
        return @enumFromInt(convention_id);
    }

};


/// General Layer type info such as dimension of the layer,
/// and if the layer use a specific `ActivationFunction` etc...
/// This also act as a placeholder for specific layer actions to perform.
/// -----------------------------------------------
/// • Batch Size(B): The number of independent input sequences processed in parallel.
/// • Feature Size(D): Number of input features per timestep (e.g., number of sensor channels).
/// • Layer Size(H): Number of hidden units / neurons in a specific layer.
/// • TimeWindow / Timesteps(T): Amount of timesteps in a window (e.g., when using RNN).
/// • Weight Matrix(W): Trainable parameter that connect inputs to outputs in a layer. 
/// • Output(Y): The result of the feedforward from a given layer. 
/// -----------------------------------------------
pub const LayerInfo = union(enum) {
    input: struct { LayerType, LayerDimension},
    hidden: struct { LayerType, LayerDimension, ActivationFunction },
    output: struct { LayerType, LayerDimension, LossType },

    pub fn get_type(self: LayerInfo) LayerType {
        const val = switch (self) {
            .hidden => |vals| vals[0],
            .input => |vals| vals[0],
            .output => |vals| vals[0],
        };
        return val;
    }

    pub fn layer_size(self: LayerInfo) ?usize {
        return self.get_shape_of(.layer_size); 
    }

    pub fn get_dimension(self: LayerInfo) LayerDimension {
        const val = switch (self) {
            .hidden => |dims| dims[1],
            .input => |dims| dims[1],
            .output => |dims| dims[1],
        };
        return val; 
    }

    pub fn dim(self: LayerInfo, comptime i: comptime_int) usize {
        const val = switch (self) {
            .hidden => |vals| vals[1],
            .input => |vals| vals[1],
            .output => |vals| vals[1],
        };
        if (i > 1) @compileError("Index 1 and 2 is only valid. [Row: index 0, Col: index 1]");
        return val[i];
    }

    pub fn get_shape_of(self: LayerInfo, shape_type: DataShapeType) ?usize {
        const dim_tuple: LayerDimension = self.get_dimension();   

        if (@as(DataShapeType, dim_tuple[0]) == shape_type) {
            const data: LayerDataShapes = dim_tuple[0];
            return data.get_shape();
        }else if (@as(DataShapeType, dim_tuple[1]) == shape_type) {
            const data: LayerDataShapes = dim_tuple[1];
            return data.get_shape();
        }else if (@as(DataShapeType, dim_tuple[2]) == shape_type){
            const data: LayerDataShapes = dim_tuple[2]; 
            return data.get_shape(); 
        }else {
            return null; 
        }
    }

    pub fn get_shape_tags(self: LayerInfo) [3]DataShapeType {
        comptime var tags: [3]DataShapeType = undefined; 
        const layer_shapes: LayerDimension = self.get_dimension(); 
        inline for (layer_shapes, 0..) |shape, i| {
            const dim_type: LayerDataShapes = shape; 
            tags[i] = dim_type.get_tag();  
        }
        return tags; 
    }

    pub fn get_activation(self: LayerInfo) ?ActivationFunction {
        switch (self) {
            .hidden => |vals| return vals[2],
            .input => return null,
            .output => return null,
        }
    }

    pub fn loss_kind(self: LayerInfo) ?LossType {
        switch (self) {
            .hidden => return null,
            .input => return null,
            .output => |vals| return vals[2],
        }
    }


    /// Should get the row and column dimensions/shapes for the given layer type (input, hidden, output).
    /// It also rearrange the dimension based on the convention used (row-major or column-major). 
    /// The intuition is to think of each row (row-major) as one input sample or each column (column-major)
    /// as one independent sample. On embedded devices we prefer the *Column-Major* over the row-major.
    /// Since it allows for more efficient memory access and often reduce the amount of transpose operations.
    /// --------------------------------
    /// For Row-Major Convention: 
    ///     → input × weight = [BatchSize, FeatureSize] × [FeatureSize, LayerSize] => [BatchSize, LayerSize].
    ///     Example: X = [BatchSize, FeatureSize], W = [FeatureSize, LayerSize], Y = [BatchSize, LayerSize].
    ///         - Where: W = [In][Out] = [FeatureSize = Input Size][LayerSize].
    /// For Column-Major Convention: 
    ///     → weight ×  input = [LayerSize, FeatureSize] × [FeatureSize, BatchSize] => [LayerSize, BatchSize]
    ///     Example: X = [FeatureSize, BatchSize], W = [LayerSize, FeatureSize], Y = [LayerSize, BatchSize].
    ///         - Where: W = [Out][In] = [LayerSize][FeatureSize = Input Size].
    /// --------------------------------
    pub fn Shapes(self: LayerInfo, comptime Convention: InputShapeConvention) LayerShapes {
        const dimension_types: LayerDimension = self.get_dimension(); 
        const batch_size = if (self.get_shape_of(.batch_size) != null) self.get_shape_of(.batch_size) else null; 
        const SizeOfLayer = if (self.layer_size() != null) self.get_shape_of(.layer_size).? else @compileError("You need to pass size of layer!"); 
        
        const other_type, const other_dim = dim_blk: {
            var shapes: ?struct{DataShapeType, usize} = null; 
            inline for (dimension_types) |dim_type| {
                const shape_type = @as(DataShapeType, dim_type); 
                if (shape_type != .batch_size and shape_type != .layer_size) {
                    const other_size: ?usize = switch (shape_type) {
                        .feature_size => self.get_shape_of(.feature_size).?,
                        .output_size => self.get_shape_of(.output_size).?,
                        .prev_size => self.get_shape_of(.prev_size).?,
                        // .layer_size => self.get_shape_of(.layer_size).?,
                        .num_classes => self.get_shape_of(.num_classes).?,
                        else => null, 
                    }; 
                    shapes = .{shape_type, other_size.?};
                    break :dim_blk shapes.?; 
                }else {
                    continue; 
                }
            }
            break :dim_blk .{DataShapeType.batch_size, 0}; 
        };

        switch(self) {
            .input => {
                const is_valid: bool = switch (other_type) {
                    .feature_size => true, 
                    .output_size => true, 
                    else => false, 
                };
                if (Convention == .ColumnFeatureOrdering and is_valid) {
                    const input_layer_shape: struct {usize, usize} = .{other_dim, batch_size.?};
                    return LayerShapes{
                        .input = .{
                            .input_dim = input_layer_shape,
                            .weight_dim = .{0, 0},
                            .output_dim = input_layer_shape,
                        }
                    }; 
                }else if (Convention == .RowSampleOrdering and is_valid){
                    const input_layer_shape: struct {usize, usize} = .{batch_size.?, other_dim};
                    return LayerShapes{
                        .input = .{
                            .input_dim = input_layer_shape,
                            .weight_dim = .{0, 0},
                            .output_dim = input_layer_shape,
                        }
                    }; 
                }else {
                    @compileError("You need to provide either of the three sizes: .feature_size, .output_size, .layer_size, as shapes to the Input Layer!"); 
                }
            },
            .hidden => {
                const is_valid: bool = switch (other_type) {
                    .feature_size => true, 
                    .prev_size => true, 
                    else => false, 
                };

                if (Convention == .ColumnFeatureOrdering and is_valid) {
                    return LayerShapes{
                        .hidden = .{
                            .input_dim = .{other_dim, batch_size.?}, // Input or prior output to current layer. 
                            .weight_dim = .{SizeOfLayer, other_dim},
                            .output_dim = .{SizeOfLayer, batch_size.?},
                        }
                    }; 

                }else if (Convention == .RowSampleOrdering and is_valid) {
                    return LayerShapes{
                        .hidden = .{
                            .input_dim = .{batch_size.?, other_dim},
                            .weight_dim = .{other_dim, SizeOfLayer},
                            .output_dim = .{batch_size.?, SizeOfLayer},
                        }
                    }; 
                }else {
                    @compileError("Compile-time panic - Need to pass either .feature_size or .prev_size togheter with .batch_size, as valid sizes!"); 
                }
            },

            .output => {
                // TODO: - Add handle case for `.num_classes` - number of classes need to match the output layer size. 
                const is_valid: bool = switch (other_type) {
                    .prev_size => true, 
                    else => false, 
                };
                    
                // Col-Major - Feature size first.  
                if (Convention == .ColumnFeatureOrdering and is_valid) {
                    return LayerShapes{
                        .output = .{
                            .input_dim = .{other_dim, batch_size.?}, // Input or prior output (last hidden layer) into the output-layer. 
                            .weight_dim = .{SizeOfLayer, other_dim},
                            .output_dim = .{SizeOfLayer, batch_size.?},
                        }
                    }; 
                }else if (Convention == .RowSampleOrdering and is_valid){
                    // Row-Major - Batch Size first.  
                    return LayerShapes{
                        .output = .{
                            .input_dim = .{batch_size.?, other_dim},
                            .weight_dim = .{other_dim, SizeOfLayer},
                            .output_dim = .{batch_size.?, SizeOfLayer}, // SizeOfLayer need to match Number of Classes. 
                        }
                    }; 
                }else {
                    print_fn(PRINTMODE, "Got the shapes: {any}\n", .{dimension_types});
                    @panic("Panics in output layer shape case!"); 
                }
            },
        }
        @compileError("Invalid layer shape configuration for " ++ @tagName(self));
    }
};

test "dot-product SIMD instruction and feedforward logic" {
    print_fn(PRINTMODE, "\nDot product SIMD and feedforward test logic!\n", .{});
    const BatchSize: usize = 1;
    const NumFeatures: usize = 2; 

    const dummy_input = [NumFeatures][BatchSize]f32{
        .{2.0},
        .{1.0},
    };
    
    const rowmajor_dummy_input = [BatchSize][NumFeatures]f32{
        .{2.0, 1.0},
    };

    //LayerDim{PreviousLayerSize, Current LayerSize}, where the Weight Matrix becomes LayerSize x PrevSize.
    const dummy_matrix = Matrix(f32, 2, 1).create(dummy_input);
    const dummy_matrix_rowmajor = Matrix(f32, 1, 2).create(rowmajor_dummy_input); 
    print_fn(PRINTMODE, "Dummy Matrix (2 x 1): {any}\n", .{dummy_matrix.mat});

    const weight_mat = [3][2]f32{
        [_]f32{ 1.0, 4.0 },
        [_]f32{ 3.0, 1.0 },
        [_]f32{ 2.0, 2.0 },
    };

    // Row-Major Weight Matrix shape(NumFeatures, LayerSize). 
    const weight_mat_rowmajor = [2][3]f32{
        [_]f32{ 1.0, 2.0, 3.0 },
        [_]f32{ 4.0, 5.0, 6.0},
    };


    const expected_z_before_bias = [3][1]f32{
        .{6.0},
        .{7.0},
        .{6.0},
    };
    // With bias_relu
    const expected_z_with_bias = [3][1]f32{
        .{7.0},
        .{-3.0},
        .{9.0},
    };
    const expected_activation = [3][1]f32{
        .{7.0},
        .{-2.998e-1},
        .{9.0},
    };
    
    _ = expected_activation;
    _ = expected_z_with_bias;
    _ = expected_z_before_bias;



    const bias = [_]f32{ 1.0, 2.0, 3.0 };
    const bias_relu = [_]f32{ 1.0, -10.0, 3.0 };
    // const input_test 
    // if W(3, m) = W(3, 1)
    // To obtain a WX matrix of ()
    const PreviousLayerSize: usize = 2;
    _ = PreviousLayerSize;
    const CurrentLayerSize: usize = 3; // Layer has 3 number of neurons in layer
    
    const params = HyperParameters{
        .optimizer = .Adam,
        .learning_rate = 0.001,
        .gamma = 1.0,
        .dropout_rate = 0.1,
        .epochs = 100,
        .epsilon = 0.01,
        .alpha = 0.1,
    };


    const layer_default = LayerInfo{ .hidden = .{ LayerType.Linear, LayerDimension{LayerDataShapes{.layer_size = 3},LayerDataShapes{.feature_size = NumFeatures}, LayerDataShapes{.batch_size = BatchSize} }, ActivationFunction.Relu } };

    const layer_leaky = LayerInfo{ .hidden = .{ LayerType.Linear, LayerDimension{LayerDataShapes{.layer_size = 3}, LayerDataShapes{.batch_size = BatchSize}, LayerDataShapes{.feature_size = NumFeatures} }, ActivationFunction{.LeakyRelu = params.alpha}} };

    const HiddenLayer1 = Layer(f32, layer_default, InputShapeConvention.ColumnFeatureOrdering); // Expect (n, m) Input
    const HiddenLayerLeaky = Layer(f32, layer_leaky, InputShapeConvention.RowSampleOrdering); // Expect (m, n) Input

    var layer = HiddenLayer1.init(1);
    var layer_leakyrely = HiddenLayerLeaky.init(2);
    
    // Test case Input Matrix: 2 x 1:  
    layer.weight_matrix.? = Matrix(f32, CurrentLayerSize, NumFeatures).create(weight_mat); // 3 x 2 Weight Matrix.
    layer.bias_vector.? = bias; // Bias: 1 x 3. 
    
    layer_leakyrely.weight_matrix.? = Matrix(f32, NumFeatures, CurrentLayerSize).create(weight_mat_rowmajor);
    layer_leakyrely.bias_vector.? = bias_relu;

    // Expected: (3 x 2) * (2 x 1) → (3 x 1) + (1 x 3). 

    //Try feedforward for a hidden layer dotproduct on matrix, check dimension
    // z = W * x + b

    std.debug.print("The dummy Input Matrix Passed to Feedforward Column-Major test case: \n", .{});
    dummy_matrix.print_matrix("", .debug_print);

    // Feedforward test case 1 - ReLU + Column-Major Convention:
    var z_activation = layer.feedforward(&dummy_matrix, &params); // Expected Output [7.0, 9.0, 9.0]
    const activation_arr = z_activation.flatten_array();
    _ = activation_arr; 
    const z = layer.cached_z.?.flatten_array();
    
    std.debug.print("Type of layer.cached_z.?.flatten_array: {any}\n", .{@TypeOf(z)});
    std.debug.print("Feedforward Ouput Matrix Before ReLU: \n", .{});
    layer.cached_z.?.print_matrix("", .debug_print);
    std.debug.print("Feedforward Ouput Matrix After ReLU: \n", .{});
    z_activation.print_matrix("", .debug_print);

    try std.testing.expect((z[0] == 7.0) and (z[1] == 9.0) and (z[2] == 9.0));
 
    // Feedforward test case 2 - Leaky ReLU + Row-Major Convention:
    std.debug.print("The dummy Input Matrix Passed to Feedforward Row-Major test case: \n", .{});

    var z_activation_alpha = layer_leakyrely.feedforward(&dummy_matrix_rowmajor, &params);
    const z_leaky = layer_leakyrely.cached_z.?.flatten_array();
    // const activation_arr_leaky = z_activation_alpha.flatten_array();

    std.debug.print("Feedforward Ouput Matrix Before Leaky ReLU: \n", .{});
    layer_leakyrely.cached_z.?.print_matrix("", .debug_print);
    std.debug.print("Feedforward Ouput Matrix After Leaky ReLU: \n", .{});
    z_activation_alpha.print_matrix("", .debug_print);
    
    try std.testing.expect((z_leaky[0] == 7.0) and (z_leaky[1] == -1.0) and (z_leaky[2] == 15.0));
    // try std.testing.expect(activation_arr_leaky[1] == expected_activation[1][0]);

    // Pass by slice pointer reference for modification.
    const ActivationRelu = ActivationFunction{.Relu = {}};
    
    var z_relu = [_]f32{ 1.0, -10.0, 3.0 };
    const z_activation_out = ActivationRelu.execute_fn(f32, 3, z_relu[0..], false);
    std.debug.print("Bias test for negative ReLU value: {any}\n", .{z_relu});
    std.debug.print("After applying ReLU:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{ z_activation_out[0], z_activation_out[1], z_activation_out[2] });

    std.debug.print("\n**END OF TEST BLOCK***\n", .{});
    return error.SkipZigTest;
}

test "Matrix operation validation" {

    const matrix_d = [2][3]f32{
        .{ 5, 1, 2 },
        .{ 2, 2, 1 },
    };

    const matrix_c = [3][2]f32{
        .{ 1, 4 },
        .{ 2, 3 },
        .{ 3, 2 },
    };

    const TestMatrixC = Matrix(f32, 3, 2).create(matrix_c);
    var TestMatrixD = Matrix(f32, 2, 3).create(matrix_d);
    std.debug.print("Test Matrix C: {any}\nTest Matrix D: {any}\n", .{ TestMatrixC.mat, TestMatrixD.mat });

    // **Transpose of Matrix test case**
    const expected_type: [3][2]f32 = undefined;
    const transpose_d = TestMatrixD.transpose();
    std.debug.print("Transposing the matrix of type {any} yields: {any}\n", .{ @TypeOf(matrix_d), transpose_d });
    try std.testing.expect(@TypeOf(transpose_d.mat) == @TypeOf(expected_type));

    //-------------------------------------------------------------
    //**Dot product on Matrix C and D [MatMul] test case**
    std.debug.print("Type Info check: {any}\n", .{@typeInfo(@TypeOf(TestMatrixD)).@"struct".fields[2].defaultValue()});
    const TestMatrixMeta = Matrix(f32, 3, @typeInfo(@TypeOf(TestMatrixD)).@"struct".fields[2].defaultValue().?);
    std.debug.print("TestMatrixMeta: {any}\n", .{TestMatrixMeta});

    const expected_dim: [3][3]f32 = undefined;
    const dot_cd = TestMatrixC.matmul(TestMatrixD);
    std.debug.print("Matrix dot product (matmul) C*D yields type: {any}, and value: {any}\n", .{ @TypeOf(dot_cd.mat), dot_cd.mat });
    try std.testing.expect(@TypeOf(dot_cd.mat) == @TypeOf(expected_dim));

    //-------------------------------------------------------------
    //**Hadamard test case**
    const hadamard = try TestMatrixC.hadamard_product(TestMatrixC);
    std.debug.print("Hadamard Product of Matrix C ⊗ C yields:\n", .{});
    hadamard.print_matrix("", .debug_print);

    std.debug.print("\n**END OF MATRIX OPERATIONS TEST BLOCK***\n", .{});
    return error.SkipZigTest; 
}

test "FF-dimension-checks" {
    const BatchSize: usize = 3;
    // const InputSize: usize = 2;
    const FeatureSize: usize = 2; 
    const H1_SIZE: usize = 3;
    const H2_SIZE: usize = 2;
    // Input shape (BatchSize, Features) → Flatten Input = (1, BatchSize * Features)

    const params = HyperParameters{
        .optimizer = .Adam,
        .learning_rate = 0.001,
        .gamma = 1.0,
        .dropout_rate = 0.1,
        .epochs = 100,
        .epsilon = 0.01,
        .alpha = 0.1,
    };
    
    // Column-Wise (Feature First) convention. Each column is a sample, and each row is a feature. 
    // Row-Wise (Batch- or Sample First) convention. Each row is a unique sample. 

    const RowConvention = InputShapeConvention.RowSampleOrdering; 
    const ColumnConvention = InputShapeConvention.ColumnFeatureOrdering; 

    const layer_info = [_]LayerInfo{
        LayerInfo{ .input = .{ 
            LayerType.Embedding, 
            LayerDimension{
                LayerDataShapes{.layer_size = 2},
                LayerDataShapes{.feature_size = FeatureSize}, 
                LayerDataShapes{.batch_size = BatchSize }
            } 
        }},
        // H1 Layer → 
        LayerInfo{ .hidden = .{ 
            LayerType.Linear, 
            LayerDimension{
                LayerDataShapes{.layer_size = H1_SIZE},
                LayerDataShapes{.feature_size = FeatureSize}, 
                LayerDataShapes{.batch_size = BatchSize }
            }, 
            ActivationFunction.Relu 
        }},
        // H2 Layer →
        LayerInfo{ .hidden = .{ 
            LayerType.Linear, 
            LayerDimension{
                LayerDataShapes{.layer_size = H2_SIZE},
                LayerDataShapes{.prev_size = H1_SIZE}, 
                LayerDataShapes{.batch_size = BatchSize }
            },
            ActivationFunction.Relu 
        }},
        LayerInfo{ .output = .{ 
            LayerType.SoftMax, 
            LayerDimension{
                LayerDataShapes{.layer_size = 3},
                LayerDataShapes{.prev_size = H2_SIZE}, 
                LayerDataShapes{.batch_size = BatchSize }
            }, 
            LossType.CrossEntropy 
        }},
    };
   
    // Feature Size = Number of input neurons. The feature size refers to the number of input features per sample. 
    // Batch Size = Number of samples. 
    // Number of output neurons = Output Size = LayerSize
    // RowSampleOrdering → X(BatchSize, Features), W(Features, LayerSize), Z(BatchSize, LayerSize) = Input next layer
    // ColumnFeatureOrdering → X(Features, BatchSize), W(LayerSize, Features), Z(LayerSize, BatchSize)
    
    // INPUT LAYER: X(2, 3) → ()
    //H1: W(3, 2), X(2, 3), Bias(1, 3)... → Output Matrix Expected Shape = 3 x 3.  
    //H2: W(2, 3), H1(3, 3), Bias(1, 2)... → Expected Shape = 2 x 3.  
    //OUTPUT LAYER: W(3, 3), H2(2, 3), Bias(1, 3)... → Expected Output Shape = 3 x 3 
    // (!): Target Classes Y (actual labels) shape(NumFeatures, BatchSize) == Input shape(NumFeatures, BatchSize).
    // (!) Loss output → Shape(1, BatchSize)... 


    const dummy_input = [2][3]f32{
        .{ 1.0, 2.0, 3.0 },
        .{ 4.0, 5.0, 6.0 },
    };

    // const input_matrix = Matrix(f32, 2, 3).create(dummy_input);
    const input_matrix = Matrix(f32, FeatureSize, BatchSize).create(dummy_input);
    
    var h1 = Layer(f32, layer_info[1], ColumnConvention).init(1);
    var h2 = Layer(f32, layer_info[2], ColumnConvention).init(2);
    var output_layer = Layer(f32, layer_info[3], ColumnConvention).init(3);

    const output_matrix_h1 = h1.feedforward(&input_matrix, &params); 
    
    const h1_w_dim0, const h1_w_dim1 = h1.weight_matrix.?.get_dimension();
    const h1_a_dim0, const h1_a_dim1 = h1.cached_activation.?.get_dimension();
    const h1_in_dim0, const h1_in_dim1 = h1.cached_input.?.get_dimension();

    std.debug.print("Input X to H1:\n", .{});
    h1.cached_input.?.print_matrix("", .debug_print); 

    std.debug.print("Forwardpass through H1: W1 Dim({d},{d}), A^[L-1] Dim({d},{d}), A^[L]=σ(z1) Dim({d},{d})\n", .{ h1_w_dim0, h1_w_dim1, h1_in_dim0, h1_in_dim1, h1_a_dim0, h1_a_dim1 });
    
    h1.weight_matrix.?.print_matrix("", .debug_print); 
    h1.cached_activation.?.print_matrix("", .debug_print); 

    std.debug.print("↓==================================↓\n", .{});

    const output_matrix_h2 = h2.feedforward(&output_matrix_h1, &params); // Expected Matrix(2, 3).
    const h2_w_dim0, const h2_w_dim1 = h2.weight_matrix.?.get_dimension();
    const h2_a_dim0, const h2_a_dim1 = h2.cached_activation.?.get_dimension();
    const h2_in_dim0, const h2_in_dim1 = h2.cached_input.?.get_dimension();

    std.debug.print("Input X to H2:\n", .{});
    h2.cached_input.?.print_matrix("", .debug_print); 
    
    std.debug.print("Forwardpass through H2: W2 Dim({d},{d}), A^[L-1] Dim({d},{d}), A^[L]=σ(z2) Dim({d},{d})\n", .{ h2_w_dim0, h2_w_dim1, h2_in_dim0, h2_in_dim1, h2_a_dim0, h2_a_dim1 });
    
    h2.weight_matrix.?.print_matrix("", .debug_print);
    h2.cached_activation.?.print_matrix("", .debug_print); 

    std.debug.print("↓==================================↓\n", .{});

    const probs = output_layer.feedforward(&output_matrix_h2, &params);
    const output_input = output_layer.cached_input.?;
    _ = output_input;

    const out_a_dim0, const out_a_dim1 = probs.get_dimension();
    std.debug.print("Softmax Activation, A^[L]=σ(z3) Dim({d},{d}):\n", .{out_a_dim0, out_a_dim1 });
    probs.print_matrix("", .debug_print);
    std.debug.print("↓==================================↓\n", .{});

    //TODO: - Do I really need to pass `OutSize` and `BatchSize` here. In the NNModel, 
    //we pass the list of layer_info. From there we can check the output layer dimension value. 
    
    const LossObject = LossFunction(f32, LossType.CrossEntropy, 3, BatchSize, ColumnConvention);
    // const y_true = [_]f32{ 0.0, 1.0, 0.0 }; // as one-hot encoded vector.
    const y_true_batch = [3][3]f32{
        .{ 1.0, 0.0, 0.0},
        .{ 0.0, 1.0, 0.0},
        .{ 0.0, 0.0, 1.0},
    }; // as one-hot encoded vector.
    const y_matrix = Matrix(f32, 3, 3).create(y_true_batch); // Must match the Softmax output dimension.  
    std.debug.print("Y Matrix as One-Hot Encoding: \n", .{});
    y_matrix.print_matrix("", .debug_print); 
    _ = LossObject; 

    // var batch_predictions: [BatchSize]f32 = undefined;  
    // var batch_losses: @Vector(BatchSize, f32) = undefined;  
    // const batch_scalar: f32 = 1.0 / @as(f32, BatchSize); 
    // if (out_a_dim1 > 1){
    //     // When number of batches / columns are more than 1. Then we calcluate the column-wise loss 
    //     // for each of the batches. 
    //     for (0..BatchSize) |batch| {
    //         const batch_probs = probs.get_colvec(batch);
    //         batch_predictions = batch_probs; 
    //         const batch_losses_vec = LossObject.get(batch_probs[0..], y_true_batch[batch][0..], false);
    //         const losses_arr: [BatchSize]f32 = batch_losses_vec.?; 
    //         const argmax = LossObject.argmax(losses_arr[0..]);
    //         const batch_loss = losses_arr[argmax];
    //         batch_losses[batch] = batch_loss;  
    //
    //         std.debug.print("Batch {d}, loss: {d}\n", .{batch, batch_loss}); 
    //         std.debug.print("Softmax probabilities: {any}\nCross entropy loss: {any}\n", .{batch_predictions, batch_losses });
    //     }
    //
    //     const batch_sum = @reduce(.Add, batch_losses); 
    //     const batch_avg_loss = batch_scalar * batch_sum; 
    //     std.debug.print("Batch Loss Vector: {any}\n", .{batch_losses}); 
    //     std.debug.print("Average Batch Loss: {d}\n", .{batch_avg_loss});
    // }


    // Test case - Feedforward with Row-Major Ordering: 
    const dummy_predicition = Matrix(f32, 3, 3).create([3][3]f32{
        .{0.7188, 0.81, 0.877},
        .{0.0828, 0.04846, 0.0271},
        .{0.1987, 0.1414, 0.0961},
    });

    _ = dummy_predicition; 
    
    const dummy_input_old = [2][3]f32{
        .{ 1.0, 2.0, 3.0 },
        .{ 4.0, 5.0, 6.0 },
    };
    _ = dummy_input_old; 

    const dummy_input_rowmajor = [3][2]f32{
        .{ 1.0, 4.0 },
        .{ 2.0, 5.0 },
        .{ 3.0, 6.0 }, 
    };

    var h1_cached = h1.cached_input.?.*;
    const colmajor_input = h1_cached.transpose(); 
    const input_rowmajor = Matrix(f32, BatchSize, FeatureSize).create(dummy_input_rowmajor);

    //WARN: - Add logic for calculating the average depending on the batch size 1 / m. 

    // var input_layer = Layer(f32, layer_info[0], RowConvention).init(0); 
    var h1_rowmajor = Layer(f32, layer_info[1], RowConvention).init(1);
    var h2_rowmajor = Layer(f32, layer_info[2], RowConvention).init(2);
    var output_layer_rowmajor = Layer(f32, layer_info[3], RowConvention).init(3);

    // Test and assign the weights and biases of the ColumnFeatureOrdering test above and compare with RowSampleOrdering: 
    h1_rowmajor.weight_matrix = h1.weight_matrix.?.transpose();
    h1_rowmajor.bias_vector = h1.bias_vector; 
    h2_rowmajor.weight_matrix = h2.weight_matrix.?.transpose();
    h2_rowmajor.bias_vector = h2.bias_vector;  
    output_layer_rowmajor.weight_matrix.? = output_layer.weight_matrix.?.transpose(); 
    output_layer_rowmajor.bias_vector = output_layer.bias_vector; 

    std.debug.print("Input data: \n", .{}); 
    // input_rowmajor.print_matrix(""); 
    colmajor_input.print_matrix("", .debug_print);
    _ = input_rowmajor; 
    
    const output_h1 = h1_rowmajor.feedforward(&colmajor_input, &params); 
    const output_h2 = h2_rowmajor.feedforward(&output_h1, &params); 

    // const output_h2_colmajor = output_matrix_h2.transpose(); 
    const output_pred = output_layer_rowmajor.feedforward(&output_h2, &params); 
    // const output_pred_test = output_layer_rowmajor.feedforward(output_h2_colmajor, &params); 

    std.debug.print("Row-Major Feedforward (H1 → H2 → Output Layer Prediction): \n", .{});
    output_h1.print_matrix("", .debug_print);
    output_h2.print_matrix("", .debug_print);
    output_pred.print_matrix("", .debug_print); // As Softmax probabilities... 

    // Since this matrix is an identity matrix transposing won't change the dimension. 
    var y_before_transposed = Matrix(f32, 3, 3).create(y_true_batch); // Must match the Softmax output dimension.  
    const y_transposed = y_before_transposed.transpose();
    std.debug.print("Y Matrix as One-Hot Encoding: \n", .{});
    y_transposed.print_matrix("", .debug_print); 
    
    std.debug.print("Comparing Column-Major & Row-Major feedforward output: \n", .{});
    probs.print_matrix("", .debug_print);  
    output_pred.print_matrix("", .debug_print);
    // output_pred_test.print_matrix("");

    return error.SkipZigTest; 


}
