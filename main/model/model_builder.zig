const std = @import("std");
const layer_types = @import("layers.zig");
const Layer = layer_types.Layer;
const LayerOptions = layer_types.LayerOptions;
const LayerTest = layer_types.LayerTest;
const LayerInfo = layer_types.LayerInfo;
const LayerType = layer_types.LayerType;
const LayerDim = layer_types.LayerDim;
const Matrix = layer_types.Matrix;
const common = @import("common_functions.zig");
const LossType = common.LossType;
const LossFunction = common.LossFunction;
const ActivationFunction = common.ActivationFunction;
const OptimizerType = @import("optimizer.zig").OptimizerType;
const assert = std.debug.assert;

/// This act as the base model, for building a deep learning model.
pub fn NNModel(comptime T: type, comptime LayerData: []const type) type {
    return struct {
        const Self = @This();

        /// Number of unique layers in the topology network.
        pub const NumLayers: usize = LayerData.len;

        /// Type of the input layer. E.g., size of layer etc...
        pub const InputLayer = @TypeOf(LayerData[0]);

        /// First dimensions should represent one sample data (row dimension).
        pub const InputSize: usize = LayerData[0].Info.dim(0);

        /// The `BatchSize` is the same as number of features per input.
        /// This value dictate the matrix dimensions for each layer activation output.
        pub const BatchSize: usize = LayerData[0].Info.dim(1);

        /// Index of the last layer in the computational graph network.
        pub const OutputLayerIndex: usize = LayerData.len - 1;

        const OutputLayer = Layer(T, LayerData[OutputLayerIndex].Info);
        const OutputInfo = OutputLayer.Info;
        const OutputLayerSize = OutputInfo.dim(1);
        const OutputLossType: LossType = OutputInfo.output[2];
        const Loss = LossFunction(T, OutputLossType, OutputLayerSize);

        /// This should work as a mutable tuple, for easy access to all the layers,
        /// in the neural network.
        layers: std.meta.Tuple(LayerData),

        hypr_params: HyperParameters,

        pub fn init(hyper_params: HyperParameters) Self {
            var self = Self{
                .layers = undefined,
                .hypr_params = hyper_params,
                .cached_prediction = null,
                .cached_z = null,
            };

            inline for (LayerData, 0..) |val, idx| {
                if (idx < LayerData.len) {
                    self.layers[idx] = val.init(idx);
                    // val.* = LayerData[idx].init();

                    // self.layer_arr[idx] = LayerNode{
                    //     .layer = Layer(T, val.into_option()),
                    //     .prev_layer = if (idx == 0) null else &self.layer_arr[idx - 1],
                    //     .next_layer = if (idx == NumLayers - 1) null else &self.layer_arr[idx + 1],
                    // };
                }
            }
            return self;
        }

        //TODO: - This is the start for implementing a graph like double linked list data structure.
        pub const LayerNode = struct {
            layer: Layer(T, LayerData[0].Info) = undefined,
            prev_layer: ?*LayerNode = null,
            next_layer: ?*LayerNode = null,
        };

        pub fn iterator(self: *const Self) LayerIterator(LayerData) {
            return .{ .layer_obj = self.layers };
        }

        pub fn LayerIterator(comptime L: type) type {
            return struct {
                layer_obj: [*]L, // many-item-pointer
                layer_index: usize = 0,
                len: usize = NumLayers,

                pub fn next(self: *@This()) ?*L {
                    while (self.len > 0) {
                        self.len -= 1;
                        self.layer_obj += 1; //pointer arithmetic - incrementing the pointer value.
                        return &self.layer_obj[0];
                    }
                    return null;
                }
            };
        }

        pub fn get_layer(self: *Self, comptime idx: usize) *Layer(T, LayerData[idx].Info) {
            return &self.layers[idx];
        }

        /// This would calculate the already known gradient of the output layer.
        /// By calculating the partial derivatives:
        /// ∂C/∂Z^[L] = ∂C/∂A^[L] * ∂A^[L]/∂Z^[L]
        fn backward_loss(self: Self, y_actual: []const T) void {
            // const last_index: usize = NumLayers - 1;
            // var jacobian_softmax: [OutputLayerSize][OutputLayerSize]T = undefined;
            // var JacobianMatrix = self.get_layer(last_index).LayerMatrix(OutputLayerSize, OutputLayerSize);

            const s_probs = self.activation().execute_fn(T, OutputLayerSize, self.cached_z[0..], false, null);

            // const da_dz = ActivationFunction.softmax_derivative(T, s_probs, OutputLayerSize);
            const dc_dz: @Vector(OutputLayerSize, T) = LossFunction(T, LossType.CrossEntropy, OutputLayerSize).get(s_probs[0..], y_actual, true);

            _ = dc_dz;
        }

        /// The prediction is the same as the feedforward pass.
        pub fn predict_y(self: Self, input_data: []const T) []const T {
            // var layer_output = input_data;
            const EndIndex = InputSize * BatchSize;
            var layer_output = Matrix(T, InputSize, BatchSize).from_array(input_data[0..EndIndex].*);

            inline for (0..NumLayers) |i| {
                const layer_activation = self.get_layer(i).activation();
                const alpha: ?T = if (layer_activation == ActivationFunction.LeakyRelu) self.hypr_params.alpha else null;
                const activation_output = self.get_layer(i).feedforward(layer_output, alpha);
                layer_output = activation_output;
            }

            return layer_output;
        }

        /// This function would calculate the sum of gradients.
        /// /// The essence of backpropagation is knowing about the chain rule.
        /// Given by: f(g(x)) = f’(g(x)) * g’(x) or (d/dx)f(g(x)) = (df/dg)*(dg/dx).
        /// Remember(!): gradient: ∇C = [∂C/∂w_1 , ∂C/∂w_2 ... ∂C/∂w_l]
        /// ----------------------------------------------------
        /// The `model_variable` represent the trainable variables such as the
        /// Weights(L) and Biases(L) in each propagated layer in the model.
        /// While the `expression` arg, is what should be derived with regard
        /// to the `model_variable` arg.
        fn backward_grad(self: Self, expression: []const T, layer_id: usize) !void {
            if (self.cached_z == null or self.cached_prediction == null) {
                return error.FeedforwardNotRunned;
            }

            _ = expression;
            const variable = ModelVariable(Layer(T, LayerData[layer_id].Info));
            // variable.get_weight(layer_number: usize, mat_indices: struct{usize, usize})
            _ = variable;

            // 1. Construct the chain graph to perform back prop (partial derivate), gradient on.
            // 2. Simpify expression if able to.
            // 3. Calculate the partial derivative w.r.t some variable (e.g., W, b, etc...).
            // 4. Multiply the partial derivative togheter.
            // ---------------------------------------------
            // Remember(!): gradient: ∇C = [∂C/∂w_1 , ∂C/∂w_2 ... ∂C/∂w_l]

            var layer_index: usize = NumLayers - 1;
            while (layer_index != 0) : (layer_index -= 1) {
                if (self.get_layer(layer_index).isOutputLayer()) {
                    // const dLdZ = backward_loss(); //∂C/∂Z^L = ∂C/∂A^L * ∂A^L/∂Z^L = ?
                }
            }
        }

        /// Saves model in JSON format.
        pub fn save_model(self: Self) void {
            _ = self;
        }

        pub fn get_params() void {}

        // pub fn train(y: matrix_type, yhat: matrix_type, optimizer: optimizer_type) !void{}

    };
}

pub fn ModelVariable(comptime T: type) type {
    return struct {
        const Self = @This();
        value: T,

        pub fn get_weight(layer_number: usize, mat_indices: struct { usize, usize }) []const T {
            // const layer: Layer(T, comptime LayerObject: LayerInfo)
            _ = layer_number;
            _ = mat_indices;
            unreachable;
        }
    };
}

/// Should return ∂z/∂x, if `expression` = z and `variable` = x. So it would calculate the partial
/// derivative of something with respect to the passed value.
pub fn PartialDerivative(comptime T: comptime_float, expression: anytype) type {
    return struct {
        const Self = @This();
        const ExpressionType = @TypeOf(expression);

        pub fn withRespectTo(variable: *ModelVariable(T)) struct { T, T } {
            _ = variable;

            //TODO: - Define if the Model Variable is of "Scalar" or "Matrix/Vector" type.
            // Then run the specific anonymous function within this scope.
        }

        pub fn compose(f: fn (T) T, g: fn (T) T) fn (T) T {
            return struct {
                fn call_compose(x: T) T {
                    return f(g(x));
                }
            }.call_compose;
        }
    };
}

pub fn ModelBuffer(comptime T: type) type {
    return struct {
        data: T,
        capacity: usize,

        pub fn get_capacity(layers: []const LayerInfo) usize {
            var total_capacity: usize = 0;
            for (layers) |item| {
                const weight_size: usize = item.into_option().dim[0] * item.into_option().dim[1];
                const bias_size: usize = item.into_option().dim[1];
                const total_size: usize = weight_size + bias_size;
                total_capacity += total_size;
            }
            return total_capacity;
        }
    };
}

pub const HyperParameters = struct {
    input_size: usize,
    hidden_layers: usize,
    optimizer: OptimizerType,
    learning_rate: f16,
    dropout_rate: f16,
    epochs: u32,
    epsilon: f16,
    alpha: f16,
};

pub fn DataManager(comptime T: type) type {
    return struct {
        input_data: [][]const u8,
        vocabulary: std.AutoHashMap(u16, []const T),
        const Self = @This();

        pub fn init(allocator: std.mem.Allocator, path: []const u8) !Self {
            const log_file = try std.fs.cwd().openFile(path, .{});
            defer log_file.close();

            const log_data = try log_file.readToEndAlloc(allocator, std.math.maxInt(usize));

            var log_list = std.ArrayList([]const u8).init(allocator);
            defer log_list.deinit();

            var sequence_iter = std.mem.splitScalar(u8, log_data, '\n');
            while (sequence_iter.next()) |line| {
                if (line.len != 0) {
                    try log_list.append(line);
                    std.debug.print("Line: {s}\n", .{line});
                }
            }
            const log_seq = try log_list.toOwnedSlice();

            return Self{
                .input_data = log_seq,
                .vocabulary = undefined,
            };
        }

        pub fn input_dimension(self: Self) struct { usize, usize } {
            const nrows = self.input_data[0].len;
            const ncols = self.input_data[0][0..].len;
            return .{ nrows, ncols };
        }

        fn deinit(self: Self) void {
            _ = self;
        }

        /// Here we would tokenize log sections such as: `date`, `severity`, `message`.
        fn tokenize(self: Self) !void {
            std.debug.print("Log Sequences: {}\n", .{self.input_data.len});
            for (self.input_data) |sequence| {
                if (sequence.len == 0) {
                    continue;
                }
                var tokens = std.mem.tokenizeAny(u8, sequence, " ");
                std.debug.print("tokens: {s}\n", .{tokens.buffer});

                // std.ascii.toLower(c: u8)
                while (tokens.next()) |token| {
                    std.debug.print("token: {s}\n", .{token});
                }
                // std.mem.trim(comptime T: type, slice: []const T, values_to_strip: []const T)
            }
        }

        /// Word embedding that reflect the importance of a word in a document,
        /// relative to a collection of documents (corpus).
        fn tf_idf_embedding(self: Self, token: []const u8) !void {
            _ = self;
            _ = token;
        }

        /// This should not return void but should return the preprocessed
        /// word embedding data as a matrix containing N number vector of words.
        pub fn get_embedding_matix() void {}

        /// Perform word embedding using techniques such as `Word2Vec`.
        /// Numerical encoding such that words similar are closer to each other,
        /// in a defined vector space.
        fn word_embedding() !void {}

        /// Involves parsing the log data, by calling e.g., `tokenize`.
        fn preprocess(self: Self) !void {
            // 1. Lowercasing + punctuation stripping
            // 2. Split each sequence log into substrings (words)
            // 3. Recombine substrings into tokens (ngrams)
            // 4. Indexing tokens (unique int value with each token)
            // 5. Transform each sequence log using the index into vector.
            try self.tokenize();
            try word_embedding();
        }
    };
}

test "Neural Network model builder test - adding layers" {
    // This act as our sequential layer model.

    const layers = comptime [_]type{
        Layer(f16, LayerInfo{ .input = .{ LayerType.Embedding, LayerDim{ 2, 3 } } }),
        Layer(f16, LayerInfo{ .hidden = .{ LayerType.Linear, LayerDim{ 2, 3 }, ActivationFunction.LeakyRelu } }),
        Layer(f16, LayerInfo{ .hidden = .{ LayerType.Norm, LayerDim{ 3, 3 }, ActivationFunction.None } }),
        Layer(f16, LayerInfo{ .hidden = .{ LayerType.Linear, LayerDim{ 3, 3 }, ActivationFunction.LeakyRelu } }),
        Layer(f16, LayerInfo{ .output = .{ LayerType.Softmax, LayerDim{ 3, 3 }, LossType.CrossEntropy } }),
    };

    // const UniqueLayer = Layer(f16, comptime layer_option: ?LayerOptions)

    // const model_capacity = ModelBuffer(f16).get_capacity(&meta_layers);
    // var model_buffer = [_]f16{0} ** 100;

    const params = HyperParameters{
        .input_size = 2,
        .hidden_layers = 3,
        .optimizer = OptimizerType.Adam,
        .learning_rate = 0.001,
        .dropout_rate = 0.1,
        .epsilon = 0.01,
        .epochs = 100,
        .alpha = 0.01,
    };

    //CreateUniqueTuple(types.len, types[0..types.len].*);
    var net = NNModel(f16, &layers).init(params);

    var h1 = net.get_layer(1);
    const h2 = net.get_layer(2);
    const h3 = net.get_layer(3);
    // @intFromPtr(value: anytype)

    std.debug.print("h1 type: {any}\n", .{@TypeOf(net.get_layer(1))});
    std.debug.print("Net Info: {any}\n", .{net});

    std.debug.print("h1 weights: {any}\nh2 weights: {any}\nh3 weights: {any}\n", .{ h1.weight_matrix, h2.weight_matrix, h3.weight_matrix });
    std.debug.print("h1 bias: {any}\nh2 bias: {any}\nh3 bias: {any}\n", .{ h1.bias_vector, h2.bias_vector, h3.bias_vector });

    // Test modification:
    h1.bias_vector = [_]f16{ 1, 2, 3 };
    std.debug.print("Modifying h1 bias: {any}\n", .{h1.bias_vector});
    std.debug.print("Modifying h1 after: {any}\n", .{net.get_layer(1)});

    std.debug.print("self.layers type: {any}\n", .{@TypeOf(net.layers)});
}
