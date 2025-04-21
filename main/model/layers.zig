const std = @import("std");
const math = std.math;
const testing = std.testing;
const model = @import("model_builder.zig");
const HyperParameters = model.HyperParameters; 

const common = @import("common_functions.zig");
const ActivationFunction = common.ActivationFunction;
const LossType = common.LossType;
const LossFunction = common.LossFunction;
const assert = std.debug.assert;

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
        pub const Shapes = LayerObject.ComponentShapes(Convention).get();
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

        // const loss_kind = if (LayerObject.loss_kind() != null) LayerObject.loss_kind().? else null; 
        // const LossFn = LossFunction(T, comptime loss_type: LossType, comptime OutSize: usize, comptime BatchSize: usize, comptime Convention: InputConvention)

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
        // cached_input: ?*Matrix(T, InputDimension[0], InputDimension[1]),

        /// δa^[L]/δz^[L] = σ'(z). This should be stored during the forward pass.
        cached_z: ?Matrix(T, OutputDimension[0], OutputDimension[1]),

        /// This is the saved σ(z), activation output of the layer.
        cached_activation: ?Matrix(T, OutputDimension[0], OutputDimension[1]),

        /// This seed id, represent an index that points to a specific layer
        /// in a collection. It also act as the seed for random initialization
        /// of the weights and biases internally.
        id_seed: usize,

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
                    std.debug.panic("Trying to apply bias got error: {any}\n", .{err});
                };
                _ = try self.apply_weights();
            }

            const prior_dim0 = if (Convention == .RowSampleOrdering) "Batch Size" else "Input Size";
            const prior_dim1 = if (Convention == .RowSampleOrdering) "Input Size" else "Batch Size";
            const input_layer_dim0 = if (Convention == .RowSampleOrdering) "Batch Size" else "Features";
            const input_layer_dim1 = if (Convention == .RowSampleOrdering) "Features" else "Batch Size";
            
            const NumClasses = if (NumberOfClasses != null) NumberOfClasses else ""; 

            std.debug.print("\t»»»Created a new {s} Layer({d}):«««\n||---------------------------------------------||\n", .{@tagName(Info), id});
            switch (Info) {
                .hidden => |info| {
                    std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Activation Function: {s}\n    \u{2022} Prior Layer Dimension: {}x{}, ({s} x {s})\n    \u{2022} Expected Output Dimension: {}x{}\n    \u{2022} Input Shape Convention: {s}\n", .{ @tagName(info[0]), WeightDimension[0], WeightDimension[1], @tagName(info[2]), InputDimension[0], InputDimension[1], prior_dim0, prior_dim1, OutputDimension[0], OutputDimension[1], @tagName(Convention)});
                },
                .input => |info| {
                    std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Input Matrix: {}x{} ({s} x {s})\n", .{ @tagName(info[0]), InputDimension[0], InputDimension[1], input_layer_dim0, input_layer_dim1 });
                },
                .output => |info| {
                    std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Output Dimension: {}x{}\n    \u{2022} Number Of Classes: {any}\n    \u{2022} Loss Function: {s}\n", .{ @tagName(info[0]), WeightDimension[0], WeightDimension[1], OutputDimension[0], OutputDimension[1], NumClasses, @tagName(info[2]) });
                },
            }
            std.debug.print("||---------------------------------------------||\n", .{});

            return self;
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
            // std.debug.print("Learning rate: {d}\n", .{hypr_param.*.learning_rate});

            // Apply scaling on the weight gradient matrix, via scalar multiplication.
            scaled_weight_grad.scalar_multiplication(hypr_param.*.learning_rate); // Part: η·∂L/∂W

            // -------------------------------------------
            // weight_grad.print_matrix("Weight gradient");
            // scaled_weight_grad.print_matrix("After applying learning rate on Weight grad");
            // std.debug.print("Bias gradient: {any}\n", .{bias_grad});
            //
            // self.weight_matrix.?.print_matrix("Weight Before Update");
            // std.debug.print("Bias Before Update: {any}\n", .{self.bias_vector.?});
            // -------------------------------------------

            // Update Weights and Bias: 
            try self.weight_matrix.?.elementwise_operation(scaled_weight_grad, .Sub); // Applying the full part: W = W - η·∂L/∂W.
            self.bias_vector = scaled_bias_grad; // Updating the bias: b = b - η·∂L/∂b → b = scaled_bias_grad.
           
            // -----------------------------------------------------
            // self.weight_matrix.?.print_matrix("Weight After Update");
            // std.debug.print("Bias After Update: {any}\n", .{self.bias_vector.?});
            
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
            std.debug.assert(comptime Self.isOutputLayer() == true);

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

            std.debug.assert(dl_dw.rows == WeightDimension[0] and dl_dw.cols == WeightDimension[1]); 
            std.debug.assert(propagator.rows == InputDimension[0] and propagator.cols == InputDimension[1]);
            
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
            const param_value: ?f16 = if (self.activation() == ActivationFunction.LeakyRelu)
                hypr_param.*.alpha
            else
                null; 
            // std.debug.assert(matrix_dldz.*.rows == Rows and matrix_dldz.*.cols == Cols); 

            var cached_input = self.cached_input.?.*; 
           
            var da_dz = self.cached_z.?; 
            self.apply_activation(&da_dz, param_value, true); // f′(z) partial derivative. 
           
            const dz = upstream_matrix.hadamard_product(da_dz) catch unreachable; 

            if (cached_input.transpose().cols != dz.rows) {
                std.debug.print("A transpose: {any}\n", .{cached_input.transpose()});
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

            std.debug.assert(dl_dw.rows == WeightDimension[0] and dl_dw.cols == WeightDimension[1]); 
            std.debug.assert(propagator.rows == InputDimension[0] and propagator.cols == InputDimension[1]);

            try self.update_params(dl_dw, dl_db, hypr_param); 
            // dl_dw.print_matrix("Expected Weight Grad");
            return propagator; 
        }

        /// Computing for the specific layer: z = X*W + B. The node computation should
        /// wrap inside an activation function.
        /// They pseudo logic is: z = (weight_matrix[i][0..]*x[0..]) + bias_vector[0..]
        /// Remember(!): The activation output of each layer has the shape (n^[L], m).
        /// Where "m" represent the batch size / or sample size.
        /// -------------------------------------
        pub fn feedforward(self: *Self, prior_output: *const Matrix(T, InputDimension[0], InputDimension[1]), hypr_param: *const HyperParameters) Matrix(T, OutputDimension[0], OutputDimension[1]) {
            var param_value: ?f16 = null; 
            const OutputMatrixType = @TypeOf(self.cached_activation.?); // Expected Output Matrix dimension
            var output_matrix: OutputMatrixType = undefined; // CHECK THIS!  

            // std.debug.print("Feedforward for Layer: {d}\n", .{self.id_seed}); 

            if (self.activation() == ActivationFunction.LeakyRelu) {
                // std.debug.print("Alpha received: {any}\n", .{hypr_param});
                param_value = hypr_param.*.alpha;
            }else{
                param_value = null; 
            }

            switch (Convention) {
                .ColumnFeatureOrdering => {
                    // When convention is column-major (features as rows, samples as columns).
                    output_matrix = self.weight_matrix.?.matmul(prior_output);
                },
                .RowSampleOrdering => {
                    // When convention is row-major (features as columns, samples as rows).
                    // Then we multiply in the order: X*W
                    output_matrix = prior_output.matmul(self.weight_matrix.?);
                },
            }

            //WARN: - Having to many matrices on the stack is inefficient. Needs optimization!
            // Maybe use a LinkedList with pointers to next and previous = less matrices. 
          

            // This would add the bias to the matrix depending on the matrix type.
            // E.g., if the matrix has column vector shape (N x 1), row vector shape (1 X N),
            // or multi row and column matrix shape (M x N).

            output_matrix.broadcasting(self.bias_vector.?, Convention) catch |err| {
                std.debug.print("Output Matrix Dim before broadcasting: ({d},{d})\n", .{output_matrix.rows, output_matrix.cols});
                std.debug.print("Bias vector length before broadcasting: {d}\n", .{SizeOfLayer});
                std.debug.print("Prior Output Matrix dimension before broadcasting: {any}\n", .{prior_output.get_dimension()});
                std.debug.print("Weight Matrix, and Output Matrix:\n", .{});
                
                self.weight_matrix.?.print_matrix("");
                output_matrix.print_matrix("");

                std.debug.panic("Broadcasting error: {any}\n", .{err});
            };

            self.cached_input = prior_output;
            self.cached_z = output_matrix;
            self.apply_activation(&output_matrix, param_value, false);
            self.cached_activation = output_matrix;
            // std.debug.print("In feedforward, self.cached_activation: {any}\n", .{self.cached_activation.?});

            return self.cached_activation.?;
        }

        fn apply_activation(self: *Self, output_matrix: anytype, hypr_param: ?T, deriv_flag: bool) void {
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
                    // When shape of matrix is (n x 1).
                    var column_vec = output_matrix.*.get_colvec(0); // Obtains the (1 x n) vector.
                    const activation_vec = self.activation().execute_fn(T, ColVectorLength, column_vec[0..], deriv_flag, hypr_param);

                    output_matrix.*.set_colvec(0, activation_vec[0..]); 
                },
                .RowVector => {
                    // When shape of matrix is (1 x N).
                    var row_entries = output_matrix.*.mat[0];
                    output_matrix.*.mat[0] = self.activation().execute_fn(T, RowVectorLength, row_entries[0..], deriv_flag, hypr_param);
                },
                .Default => {
                    // When shape of matrix is (M x N). E.g., 3 x 2.
                    // We apply activation function element-wise by iterating
                    // each row or column in the matrix, depending on convention used.
                    switch (Convention) {
                        .ColumnFeatureOrdering => {
                            inline for (0..N) |j| {
                                var sample_val = output_matrix.*.get_colvec(j);
                                const activation_vec = self.activation().execute_fn(T, ColVectorLength, sample_val[0..], deriv_flag, hypr_param);
                                output_matrix.*.set_colvec(j, activation_vec[0..]); 
                            }
                        },
                        .RowSampleOrdering => {
                            inline for (0..M) |i| {
                                const row_vals = self.activation().execute_fn(T, RowVectorLength, output_matrix.*.mat[i][0..], deriv_flag, hypr_param);
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
                    self.weight_matrix.?.mat[i][j] = @as(f16, @floatCast(scaled_val));
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
                        self.bias_vector.?[n] = @as(f16, @floatCast(value));
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
            
            // const offset_incrementor: u32 = @bitSizeOf(f16); // 2 byte offset as u32 (zero extended)
            // const hex_addr: u32 = 0x04; // Address length
            // const next_addr: u32 = hex_addr + offset_incrementor; 
            // std.debug.print("Hex address example with offset: 0b{b}, 0b{b} = 0x{x}\nNext address: 0b{b} = 0x{x}\nIncrement again: 0b{b} = 0x{x}, address diff: 0b{b}\n", .{offset_incrementor, hex_addr, hex_addr, next_addr, next_addr, (next_addr + offset_incrementor), (next_addr+offset_incrementor), @as(u16, (next_addr+offset_incrementor)-next_addr)});
            std.debug.print("Size of element data type: 0b{b} = {d} = 0x{x}\n", .{@bitSizeOf(T), @bitSizeOf(T), @bitSizeOf(T)});
            std.debug.print("Base address of Self: 0x{x}, Matrix address: 0x{x}\n", .{base_addr, mat_addr});
            var writer = std.io.getStdOut().writer();
            
            inline for (0..Rows) |i| {
                inline for (0..Cols) |j| {
                    // const ptr_addr = @intFromPtr(&self.mat[i][j]);
                    // const element_bit_addr: u64 = @bitCast(ptr_addr);
                    writer.print("Matrix element[{d}][{d}] address: 0x{x}, in bits: 0b{b:0>16}\nElement as decimal address: {d}\n", .{i, j, @intFromPtr(&self.mat[i][j]), @intFromPtr(&self.mat[i][j]), @intFromPtr(&self.mat[i][j])}) catch unreachable;
                }
            }
        }

        pub fn print_matrix(self: Self, comptime header_info: []const u8) void {
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

            var writer = std.io.getStdOut().writer();
            
            if (header_info.len < 1){
                writer.print("Matrix Dimension: \x1b[32m({d},{d})\x1b[0m, Matrix Type: \x1b[34m{s}\x1b[0m ↓\n", .{Rows, Cols, @tagName(self.mat_type)}) catch unreachable; 
            }else {
                writer.print("Matrix Dimension: \x1b[32m({d},{d})\x1b[0m, Matrix Type: \x1b[34m{s}\x1b[0m ↓ - [{s}]\n", .{Rows, Cols, @tagName(self.mat_type), header_info}) catch unreachable; 
            }

            for (0..height) |i|{
                if (i == 0){
                    if (Rows == 1){
                        writer.print("{s} ", .{start_bracket}) catch unreachable;
                    }else {
                        writer.print("{s} ", .{upperleft}) catch unreachable;
                    }
                }else if (i == height - 1){
                    writer.print("{s} ", .{bottomleft}) catch unreachable;
                }else {
                    writer.print("{s} ", .{pipe}) catch unreachable;
                }
                
                for (0..width) |j|{
                    const element: T = self.mat[i][j];
                    if (j == 0 and Cols > 1){
                        writer.print("{d: <3}", .{element}) catch unreachable;
                    }else if (self.mat_type == .RowVector){
                        if (@as(f16, element) > 9.0){
                            writer.print("  {d: <3}", .{element}) catch unreachable;
                        }else{
                            writer.print("{d}", .{element}) catch unreachable;
                        }
                    }else if (Cols == 1){
                        writer.print("{d}", .{element}) catch unreachable;
                    }else if(self.mat_type == .Default) {
                        writer.print("{d: >9}", .{element}) catch unreachable;
                    }
                    else {
                        writer.print("{d: >3}", .{element}) catch unreachable;
                    }
                }
                if (i == 0) {
                    if (Rows == 1){
                        writer.print("{s}\n", .{end_bracket}) catch unreachable;
                    }else {
                        writer.print(" {s}\n", .{upperright}) catch unreachable;
                    }
                } else if (i == height - 1) {
                    if (Cols == 1){
                        writer.print(" {s: <3}\n", .{bottomright}) catch unreachable;
                    }else {
                        writer.print(" {s}\n", .{bottomright}) catch unreachable;
                    }
                } else {
                    if (Cols == 1){
                        writer.print(" {s: <3}\n", .{pipe}) catch unreachable;
                    }else {
                        writer.print(" {s}\n", .{pipe}) catch unreachable;
                    }
                }
                
            }
            writer.print("\n", .{}) catch unreachable;
            
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
                std.debug.print("Broadcasting is not possible - Convention: {s} [CHECK FAILED]\n", .{@tagName(MatrixConvention)});
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

                std.debug.assert(Rows == VecLength);

                for (0..Rows) |i| {
                    self.mat[i][0] = self.mat[i][0] + vec[i]; 
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
        inline fn dotSIMD(comptime vec_size: usize, vec_a: []const T, vec_b: []const T) T {
            const VecSize: usize = comptime vec_size;
            const FeatureVector = @Vector(VecSize, T);

            // You can also assign from a slice with comptime-known length to a vector using .*
            const vec1: FeatureVector = vec_a[0..VecSize].*; // from slice to vec / array type by dereferencing.
            const vec2: FeatureVector = vec_b[0..VecSize].*;
            const product: FeatureVector = vec1 * vec2; // Element-wise multiplication.
            return @reduce(.Add, product);
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
        pub fn elementwise_operation(self: *Self, other: Self, op: ElementOperation) !void {
            const apply_op = struct {
                fn apply(mat_row: [Cols]T, other_row: [Cols]T, operation: ElementOperation) !@Vector(Cols, T) {
                    var row_vector: @Vector(Cols, T) = mat_row;
                    const other_vector: @Vector(Cols, T) = other_row;
                    switch (operation) {
                        .Add => row_vector += other_vector, // row_vector = row_vector + other_vector.
                        .Mul => row_vector *= other_vector,
                        .Sub => row_vector -= other_vector, 
                    }
                    return row_vector;
                }
            }.apply;
            
            inline for (0..Rows) |i| {
                // const applied_row: [Cols]T = apply_op(self.mat[i]);
                self.mat[i] = try apply_op(self.mat[i], other.mat[i], op); 
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

        /// Matrix multiplication - `matmul`. Is a linear transformation, that utilize the dot product,
        /// over the rows of the first and cols of the second matrix.
        /// Dot product operation on two matrices A and B. This operation yields a new matrix dimension.
        /// E.g., A = m x n, and B = n x p, would give us AB = C. Where C = m x p.
        pub inline fn matmul(self: Self, rhs_mat: anytype) Matrix(T, Rows, @typeInfo(@TypeOf(rhs_mat)).@"struct".fields[2].defaultValue().?) {
            const M: usize = @typeInfo(@TypeOf(rhs_mat)).@"struct".fields[1].defaultValue().?;
            const N: usize = @typeInfo(@TypeOf(rhs_mat)).@"struct".fields[2].defaultValue().?;
            std.debug.assert(Cols == M); 

            if (Cols != M) {
                std.debug.print("Cols != M: {any}\n{any}\n", .{self.mat, rhs_mat.mat}); 
                // @compileError("The matrix dimension do not match. Check that LHS matrix's col == RHS matrix's row.");
            }

            // From M x N to N x M transformation.
            var new_mat: [Rows][N]T = undefined;

            // Now we can utilze dot product over same size vectors.
            inline for (0..Rows) |i| {
                inline for (0..N) |n| {
                    // const row_lhs = self.mat[i][0..]; //Matrix LHS[i][0..]
                    const row_rhs = rhs_mat.get_colvec(n);
                    // const dot_value = dotSIMD(Cols, row_lhs, row_rhs[0..]);
                    const dot_value = dotSIMD(Cols, self.mat[i][0..], row_rhs[0..]);
                    new_mat[i][n] = dot_value;
                }
            }
            return Matrix(T, Rows, N).create(new_mat);
        }

        pub fn get_colvec(self: Self, col_index: usize) [Rows]T {
            var column_vector: [Rows]T = undefined;
            for (0..Rows) |i| {
                column_vector[i] = self.mat[i][col_index];
            }
            return column_vector;
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

        /// The transpose would e.g. yield a mapping from 3x2 to 2x3.
        /// Rule: (AB)ᵀ = BᵀAᵀ. 
        /// This transposition algorithm perform either an inplace-algorithm 
        /// transposition, by flipping over its main diagonal. 
        pub fn transpose(self: *Self) Matrix(T, Cols, Rows) {
            const is_squared: bool = (Rows == Cols); 
            if (is_squared) {
                // Run specific inplace-algorithm below: 
                for (0..Cols - 1) |j| {
                    inner: for (1..Rows) |i| {
                        if (i == j) continue :inner; 
                        const temp_ij: T = self.mat[i][j]; 
                        // std.debug.print("Swap {d} with {d}\n", .{temp_ij, self.*.mat[j][i]}); 
                        self.mat[i][j] = self.mat[j][i];
                        self.mat[j][i] = temp_ij; 
                    }
                }
                // std.debug.print("Transpose compare in-place: {any}\n", .{self.mat});
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
    feature_size,
    output_size,
    prev_size,
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

/// Specific Layer types, which dictate the behavior and logic
/// towards a specific layer type.
pub const LayerType = enum {
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
pub const InputShapeConvention = enum {
    /// Whenever `RowSampleOrdering`, we use row-wise convention (batch first).
    /// Where each row is one unique sample, and each column a feature. 
    /// This is also known as "row-major" ordering. 
    /// Row-major matrices mean having one batch item per row.
    /// In `RowSampleOrdering` the input matrix X is a (batch_size x feature_size), 
    /// the feature_size = n = inputs to the neural network. 
    RowSampleOrdering,
    /// During `FeatureFirst` each column represent a sample, and each row a feature.  
    /// Can also be desribed as "column-major" ordering. 
    ColumnFeatureOrdering,
};


/// General Layer type info such as dimension of the layer,
/// and if the layer use a specific `ActivationFunction` etc...
/// This also act as a placeholder for specific layer actions to perform.
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

    // pub fn layer_size(self: LayerInfo) usize {
    //     const size = switch (self) {
    //         .input => |val| val[1],
    //         .hidden => |val| val[1],
    //         .output => |val| val[1],

    //     return size[0];
    // }

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
        }
        else if (@as(DataShapeType, dim_tuple[1]) == shape_type) {
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


    /// Should get the row and column dimensions or shapes for the given layer type (input, hidden, output).
    /// It should also rearrange the dimension based on the convention used (row-major or column-major). 
    ///
    /// For Row-Major Convention: 
    ///     → input × weight = [BatchSize, FeatureSize] × [FeatureSize, LayerSize] => [BatchSize, LayerSize]
    /// For Column-Major Convention: 
    ///     → weight ×  input = [LayerSize, FeatureSize] × [FeatureSize, BatchSize] => [LayerSize, BatchSize]
    pub fn ComponentShapes(self: LayerInfo, comptime Convention: InputShapeConvention) LayerShapes {
        const dimension_types: LayerDimension = self.get_dimension(); 
        const batch_size = if (self.get_shape_of(.batch_size) != null) self.get_shape_of(.batch_size) else null; 
        const SizeOfLayer = if (self.layer_size() != null) self.get_shape_of(.layer_size).? else @compileError("You need to pass size of layer!"); 
        
        const other_type, const other_dim = dim_blk: {
            var shapes: ?struct{DataShapeType, usize} = null; 
            inline for (dimension_types) |dim_type| {
                const shape_type = @as(DataShapeType, dim_type); 
                if (shape_type != .batch_size and shape_type != .layer_size) {
                    const other_val: usize = self.get_shape_of(shape_type).?;
                    _ = other_val; 
                    //TODO: - The below switch is redundant replace with above! 
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
                // comptime var input_layer_shape: struct{usize, usize} = undefined; 
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
                    std.debug.print("Got the shapes: {any}\n", .{dimension_types});
                    @panic("Panics in output layer shape case!"); 
                }
            },
        }
        @compileError("Invalid layer shape configuration for " ++ @tagName(self));
        // @compileError("Something went wrong, look over how you define the shapes, when creating a new layer"); 
    }
};

test "dot-product SIMD instruction and feedforward logic" {
    std.debug.print("\nDot product SIMD and feedforward test logic!\n", .{});
    const BatchSize: usize = 1;
    const NumFeatures: usize = 2; 

    const dummy_input = [NumFeatures][BatchSize]f16{
        .{2.0},
        .{1.0},
    };
    
    const rowmajor_dummy_input = [BatchSize][NumFeatures]f16{
        .{2.0, 1.0},
    };

    //LayerDim{PreviousLayerSize, Current LayerSize}, where the Weight Matrix becomes LayerSize x PrevSize.
    const dummy_matrix = Matrix(f16, 2, 1).create(dummy_input);
    const dummy_matrix_rowmajor = Matrix(f16, 1, 2).create(rowmajor_dummy_input); 
    std.debug.print("Dummy Matrix (2 x 1): {any}\n", .{dummy_matrix.mat});

    const weight_mat = [3][2]f16{
        [_]f16{ 1.0, 4.0 },
        [_]f16{ 3.0, 1.0 },
        [_]f16{ 2.0, 2.0 },
    };

    // Row-Major Weight Matrix shape(NumFeatures, LayerSize). 
    const weight_mat_rowmajor = [2][3]f16{
        [_]f16{ 1.0, 2.0, 3.0 },
        [_]f16{ 4.0, 5.0, 6.0},
    };


    const expected_z_before_bias = [3][1]f16{
        .{6.0},
        .{7.0},
        .{6.0},
    };
    // With bias_relu
    const expected_z_with_bias = [3][1]f16{
        .{7.0},
        .{-3.0},
        .{9.0},
    };
    const expected_activation = [3][1]f16{
        .{7.0},
        .{-2.998e-1},
        .{9.0},
    };
    
    _ = expected_activation;
    _ = expected_z_with_bias;
    _ = expected_z_before_bias;



    const bias = [_]f16{ 1.0, 2.0, 3.0 };
    const bias_relu = [_]f16{ 1.0, -10.0, 3.0 };
    // const input_test 
    // if W(3, m) = W(3, 1)
    // To obtain a WX matrix of ()
    const PreviousLayerSize: usize = 2;
    _ = PreviousLayerSize;
    const CurrentLayerSize: usize = 3; // Layer has 3 number of neurons in layer


    const layer_default = LayerInfo{ .hidden = .{ LayerType.Linear, LayerDimension{LayerDataShapes{.layer_size = 3},LayerDataShapes{.feature_size = NumFeatures}, LayerDataShapes{.batch_size = BatchSize} }, ActivationFunction.Relu } };
    const layer_leaky = LayerInfo{ .hidden = .{ LayerType.Linear, LayerDimension{LayerDataShapes{.layer_size = 3}, LayerDataShapes{.batch_size = BatchSize}, LayerDataShapes{.feature_size = NumFeatures} }, ActivationFunction.LeakyRelu } };

    const HiddenLayer1 = Layer(f16, layer_default, InputShapeConvention.ColumnFeatureOrdering); // Expect (n, m) Input
    const HiddenLayerLeaky = Layer(f16, layer_leaky, InputShapeConvention.RowSampleOrdering); // Expect (m, n) Input

    var layer = HiddenLayer1.init(1);
    var layer_leakyrely = HiddenLayerLeaky.init(2);
    
    // Test case Input Matrix: 2 x 1:  
    layer.weight_matrix.? = Matrix(f16, CurrentLayerSize, NumFeatures).create(weight_mat); // 3 x 2 Weight Matrix.
    layer.bias_vector.? = bias; // Bias: 1 x 3. 
    
    layer_leakyrely.weight_matrix.? = Matrix(f16, NumFeatures, CurrentLayerSize).create(weight_mat_rowmajor);
    layer_leakyrely.bias_vector.? = bias_relu;

    // Expected: (3 x 2) * (2 x 1) → (3 x 1) + (1 x 3). 

    //Try feedforward for a hidden layer dotproduct on matrix, check dimension
    // z = W * x + b
    const params = HyperParameters{
        .input_size = 2,
        .input_shape = .ColumnFeatureOrdering, // Default to this? 
        .input_samples = 100,
        .num_features = 10,
        .optimizer = .Adam,
        .learning_rate = 0.001,
        .dropout_rate = 0.1,
        .epsilon = 0.01,
        .epochs = 100,
        .alpha = 0.1,
    };

    std.debug.print("The dummy Input Matrix Passed to Feedforward Column-Major test case: \n", .{});
    dummy_matrix.print_matrix("");

    // Feedforward test case 1 - ReLU + Column-Major Convention:
    var z_activation = layer.feedforward(dummy_matrix, &params); // Expected Output [7.0, 9.0, 9.0]
    const activation_arr = z_activation.flatten_array();
    _ = activation_arr; 
    const z = layer.cached_z.?.flatten_array();
    
    std.debug.print("Type of layer.cached_z.?.flatten_array: {any}\n", .{@TypeOf(z)});
    std.debug.print("Feedforward Ouput Matrix Before ReLU: \n", .{});
    layer.cached_z.?.print_matrix("");
    std.debug.print("Feedforward Ouput Matrix After ReLU: \n", .{});
    z_activation.print_matrix("");

    try std.testing.expect((z[0] == 7.0) and (z[1] == 9.0) and (z[2] == 9.0));
 
    // Feedforward test case 2 - Leaky ReLU + Row-Major Convention:
    std.debug.print("The dummy Input Matrix Passed to Feedforward Row-Major test case: \n", .{});

    var z_activation_alpha = layer_leakyrely.feedforward(dummy_matrix_rowmajor, &params);
    const z_leaky = layer_leakyrely.cached_z.?.flatten_array();
    // const activation_arr_leaky = z_activation_alpha.flatten_array();

    std.debug.print("Feedforward Ouput Matrix Before Leaky ReLU: \n", .{});
    layer_leakyrely.cached_z.?.print_matrix("");
    std.debug.print("Feedforward Ouput Matrix After Leaky ReLU: \n", .{});
    z_activation_alpha.print_matrix("");
    
    try std.testing.expect((z_leaky[0] == 7.0) and (z_leaky[1] == -1.0) and (z_leaky[2] == 15.0));
    // try std.testing.expect(activation_arr_leaky[1] == expected_activation[1][0]);

    // Pass by slice pointer reference for modification.
    const ActivationRelu = ActivationFunction.Relu;
    var z_relu = [_]f16{ 1.0, -10.0, 3.0 };
    const z_activation_out = ActivationRelu.execute_fn(f16, 3, z_relu[0..], false, null);
    std.debug.print("Bias test for negative ReLU value: {any}\n", .{z_relu});
    std.debug.print("After applying ReLU:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{ z_activation_out[0], z_activation_out[1], z_activation_out[2] });

    std.debug.print("\n**END OF TEST BLOCK***\n", .{});
    return error.SkipZigTest;
}

test "Matrix operation validation" {

    const matrix_d = [2][3]f16{
        .{ 5, 1, 2 },
        .{ 2, 2, 1 },
    };

    const matrix_c = [3][2]f16{
        .{ 1, 4 },
        .{ 2, 3 },
        .{ 3, 2 },
    };

    const TestMatrixC = Matrix(f16, 3, 2).create(matrix_c);
    const TestMatrixD = Matrix(f16, 2, 3).create(matrix_d);
    std.debug.print("Test Matrix C: {any}\nTest Matrix D: {any}\n", .{ TestMatrixC.mat, TestMatrixD.mat });

    // **Transpose of Matrix test case**
    const expected_type: [3][2]f16 = undefined;
    const transpose_d = TestMatrixD.transpose();
    std.debug.print("Transposing the matrix of type {any} yields: {any}\n", .{ @TypeOf(matrix_d), transpose_d });
    try std.testing.expect(@TypeOf(transpose_d.mat) == @TypeOf(expected_type));

    //-------------------------------------------------------------
    //**Dot product on Matrix C and D [MatMul] test case**
    std.debug.print("Type Info check: {any}\n", .{@typeInfo(@TypeOf(TestMatrixD)).@"struct".fields[2].defaultValue()});
    const TestMatrixMeta = Matrix(f16, 3, @typeInfo(@TypeOf(TestMatrixD)).@"struct".fields[2].defaultValue().?);
    std.debug.print("TestMatrixMeta: {any}\n", .{TestMatrixMeta});

    const expected_dim: [3][3]f16 = undefined;
    const dot_cd = TestMatrixC.matmul(TestMatrixD);
    std.debug.print("Matrix dot product (matmul) C*D yields type: {any}, and value: {any}\n", .{ @TypeOf(dot_cd.mat), dot_cd.mat });
    try std.testing.expect(@TypeOf(dot_cd.mat) == @TypeOf(expected_dim));

    //-------------------------------------------------------------
    //**Hadamard test case**
    const hadamard = try TestMatrixC.hadamard_product(TestMatrixC);
    std.debug.print("Hadamard Product of Matrix C ⊗ C yields:\n", .{});
    hadamard.print_matrix("");

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
        .input_size = 2,
        .input_shape = .ColumnFeatureOrdering,
        .input_samples = 100,
        .num_features = 10,
        .optimizer = .Adam,
        .learning_rate = 0.001,
        .dropout_rate = 0.1,
        .epsilon = 0.01,
        .epochs = 100,
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


    const dummy_input = [2][3]f16{
        .{ 1.0, 2.0, 3.0 },
        .{ 4.0, 5.0, 6.0 },
    };

    // const input_matrix = Matrix(f16, 2, 3).create(dummy_input);
    const input_matrix = Matrix(f16, FeatureSize, BatchSize).create(dummy_input);
    
    var h1 = Layer(f16, layer_info[1], ColumnConvention).init(1);
    var h2 = Layer(f16, layer_info[2], ColumnConvention).init(2);
    var output_layer = Layer(f16, layer_info[3], ColumnConvention).init(3);

    const output_matrix_h1 = h1.feedforward(input_matrix, &params); 
    
    const h1_w_dim0, const h1_w_dim1 = h1.weight_matrix.?.get_dimension();
    const h1_a_dim0, const h1_a_dim1 = h1.cached_activation.?.get_dimension();
    const h1_in_dim0, const h1_in_dim1 = h1.cached_input.?.get_dimension();

    std.debug.print("Input X to H1:\n", .{});
    h1.cached_input.?.print_matrix(""); 

    std.debug.print("Forwardpass through H1: W1 Dim({d},{d}), A^[L-1] Dim({d},{d}), A^[L]=σ(z1) Dim({d},{d})\n", .{ h1_w_dim0, h1_w_dim1, h1_in_dim0, h1_in_dim1, h1_a_dim0, h1_a_dim1 });
    
    h1.weight_matrix.?.print_matrix(""); 
    h1.cached_activation.?.print_matrix(""); 

    std.debug.print("↓==================================↓\n", .{});

    const output_matrix_h2 = h2.feedforward(output_matrix_h1, &params); // Expected Matrix(2, 3).
    const h2_w_dim0, const h2_w_dim1 = h2.weight_matrix.?.get_dimension();
    const h2_a_dim0, const h2_a_dim1 = h2.cached_activation.?.get_dimension();
    const h2_in_dim0, const h2_in_dim1 = h2.cached_input.?.get_dimension();

    std.debug.print("Input X to H2:\n", .{});
    h2.cached_input.?.print_matrix(""); 
    
    std.debug.print("Forwardpass through H2: W2 Dim({d},{d}), A^[L-1] Dim({d},{d}), A^[L]=σ(z2) Dim({d},{d})\n", .{ h2_w_dim0, h2_w_dim1, h2_in_dim0, h2_in_dim1, h2_a_dim0, h2_a_dim1 });
    
    h2.weight_matrix.?.print_matrix("");
    h2.cached_activation.?.print_matrix(""); 

    std.debug.print("↓==================================↓\n", .{});

    const probs = output_layer.feedforward(output_matrix_h2, &params);
    const output_input = output_layer.cached_input.?;
    _ = output_input;

    const out_a_dim0, const out_a_dim1 = probs.get_dimension();
    std.debug.print("Softmax Activation, A^[L]=σ(z3) Dim({d},{d}):\n", .{out_a_dim0, out_a_dim1 });
    probs.print_matrix("");
    std.debug.print("↓==================================↓\n", .{});

    //TODO: - Do I really need to pass `OutSize` and `BatchSize` here. In the NNModel, 
    //we pass the list of layer_info. From there we can check the output layer dimension value. 
    
    const LossObject = LossFunction(f16, LossType.CrossEntropy, 3, BatchSize, ColumnConvention);
    // const y_true = [_]f16{ 0.0, 1.0, 0.0 }; // as one-hot encoded vector.
    const y_true_batch = [3][3]f16{
        .{ 1.0, 0.0, 0.0},
        .{ 0.0, 1.0, 0.0},
        .{ 0.0, 0.0, 1.0},
    }; // as one-hot encoded vector.
    const y_matrix = Matrix(f16, 3, 3).create(y_true_batch); // Must match the Softmax output dimension.  
    std.debug.print("Y Matrix as One-Hot Encoding: \n", .{});
    y_matrix.print_matrix(""); 

    var batch_predictions: [BatchSize]f16 = undefined;  
    var batch_losses: @Vector(BatchSize, f16) = undefined;  
    const batch_scalar: f16 = 1.0 / @as(f16, BatchSize); 
    if (out_a_dim1 > 1){
        // When number of batches / columns are more than 1. Then we calcluate the column-wise loss 
        // for each of the batches. 
        for (0..BatchSize) |batch| {
            const batch_probs = probs.get_colvec(batch);
            batch_predictions = batch_probs; 
            const batch_losses_vec = LossObject.get(batch_probs[0..], y_true_batch[batch][0..], false);
            const losses_arr: [BatchSize]f16 = batch_losses_vec.?; 
            const argmax = LossObject.argmax(losses_arr[0..]);
            const batch_loss = losses_arr[argmax];
            batch_losses[batch] = batch_loss;  

            std.debug.print("Batch {d}, loss: {d}\n", .{batch, batch_loss}); 
            std.debug.print("Softmax probabilities: {any}\nCross entropy loss: {any}\n", .{batch_predictions, batch_losses });
        }

        const batch_sum = @reduce(.Add, batch_losses); 
        const batch_avg_loss = batch_scalar * batch_sum; 
        std.debug.print("Batch Loss Vector: {any}\n", .{batch_losses}); 
        std.debug.print("Average Batch Loss: {d}\n", .{batch_avg_loss});
    }


    // Test case - Feedforward with Row-Major Ordering: 
    const dummy_predicition = Matrix(f16, 3, 3).create([3][3]f16{
        .{0.7188, 0.81, 0.877},
        .{0.0828, 0.04846, 0.0271},
        .{0.1987, 0.1414, 0.0961},
    });

    _ = dummy_predicition; 
    
    const dummy_input_old = [2][3]f16{
        .{ 1.0, 2.0, 3.0 },
        .{ 4.0, 5.0, 6.0 },
    };
    _ = dummy_input_old; 

    const dummy_input_rowmajor = [3][2]f16{
        .{ 1.0, 4.0 },
        .{ 2.0, 5.0 },
        .{ 3.0, 6.0 }, 
    };

    const colmajor_input = h1.cached_input.?.transpose(); 
    const input_rowmajor = Matrix(f16, BatchSize, FeatureSize).create(dummy_input_rowmajor);

    //WARN: - Add logic for calculating the average depending on the batch size 1 / m. 

    // var input_layer = Layer(f16, layer_info[0], RowConvention).init(0); 
    var h1_rowmajor = Layer(f16, layer_info[1], RowConvention).init(1);
    var h2_rowmajor = Layer(f16, layer_info[2], RowConvention).init(2);
    var output_layer_rowmajor = Layer(f16, layer_info[3], RowConvention).init(3);

    // Test and assign the weights and biases of the ColumnFeatureOrdering test above and compare with RowSampleOrdering: 
    h1_rowmajor.weight_matrix = h1.weight_matrix.?.transpose();
    h1_rowmajor.bias_vector = h1.bias_vector; 
    h2_rowmajor.weight_matrix = h2.weight_matrix.?.transpose();
    h2_rowmajor.bias_vector = h2.bias_vector;  
    output_layer_rowmajor.weight_matrix.? = output_layer.weight_matrix.?.transpose(); 
    output_layer_rowmajor.bias_vector = output_layer.bias_vector; 

    std.debug.print("Input data: \n", .{}); 
    // input_rowmajor.print_matrix(""); 
    colmajor_input.print_matrix("");
    _ = input_rowmajor; 
    
    const output_h1 = h1_rowmajor.feedforward(colmajor_input, &params); 
    const output_h2 = h2_rowmajor.feedforward(output_h1, &params); 

    // const output_h2_colmajor = output_matrix_h2.transpose(); 
    const output_pred = output_layer_rowmajor.feedforward(output_h2, &params); 
    // const output_pred_test = output_layer_rowmajor.feedforward(output_h2_colmajor, &params); 

    std.debug.print("Row-Major Feedforward (H1 → H2 → Output Layer Prediction): \n", .{});
    output_h1.print_matrix("");
    output_h2.print_matrix("");
    output_pred.print_matrix(""); // As Softmax probabilities... 

    // Since this matrix is an identity matrix transposing won't change the dimension. 
    const y_transposed = Matrix(f16, 3, 3).create(y_true_batch).transpose(); // Must match the Softmax output dimension.  
    std.debug.print("Y Matrix as One-Hot Encoding: \n", .{});
    y_transposed.print_matrix(""); 
    
    std.debug.print("Comparing Column-Major & Row-Major feedforward output: \n", .{});
    probs.print_matrix("");  
    output_pred.print_matrix("");
    // output_pred_test.print_matrix("");



}
