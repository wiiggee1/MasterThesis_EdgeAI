const std = @import("std");
const math = std.math;
const testing = std.testing;
const model = @import("model_builder.zig");
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
pub fn Layer(comptime T: type, comptime LayerObject: LayerInfo) type {
    return struct {
        const Self = @This();

        /// Prior layers output which is the input data to the current layer.
        const PrevLayerSize = LayerObject.dim(0);
        const PrevLayerDim = .{ LayerObject.dim(0), LayerObject.dim(1) };
        const BatchSize = LayerObject.dim(1);
        // const layer_input = LayerInfo{.input = .{LayerType.Linear, LayerSize{2}, LayerDim{2, 1}}};

        /// Size of the layer in terms of number of neurons.
        const SizeOfLayer = LayerObject.layer_size();

        /// Size of the Weight Matrix.
        const MatrixCapacity = SizeOfLayer * PrevLayerSize;

        /// Meta data and general Info about the Layer. This act as a placeholder,
        /// for determining what actions to execute for this layer.
        pub const Info = LayerObject;

        /// Weight matrix dimension is given by num nodes in layer l times l-1.
        /// Where `InputSize` represent prior layer size and `LayerSize` the current layer size.
        // weight_matrix: [LayerSize][InputSize]T,
        weight_matrix: Matrix(T, SizeOfLayer, PrevLayerSize),

        /// Biases for a layer is represented by a M x 1 matrix or row vector.
        /// Where M represent the `LayerSize`.
        bias_vector: @Vector(SizeOfLayer, T),

        //WARN: - Should I store the cached data, as a slice and an associated data shape?
        // My thought is that it would take up to much memory space if we have three Matrices.

        /// This should cache the input data given by saving the partial derivative of
        /// δz^[L]/δw^[L] = σ^[L-1](z) = input data from prior layer.
        cached_input: ?Matrix(T, PrevLayerDim[0], PrevLayerDim[1]),

        /// δa^[L]/δz^[L] = σ'(z). This should be stored during the forward pass.
        cached_z: ?Matrix(T, SizeOfLayer, BatchSize),

        /// This is the saved σ(z), activation output of the layer.
        cached_activation: ?Matrix(T, SizeOfLayer, PrevLayerDim[1]),

        /// This seed id, represent an index that points to a specific layer
        /// in a collection. It also act as the seed for random initialization
        /// of the weights and biases internally.
        id_seed: usize,

        pub fn init(id: usize) Self {
            std.debug.print("\t»»»Created a new {s} Layer:«««\n||---------------------------------------------||\n", .{@tagName(Info)});

            switch (Info) {
                .hidden => |info| {
                    std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Activation Function: {s}\n", .{ @tagName(info[0]), SizeOfLayer, PrevLayerSize, @tagName(info[3]) });
                },
                .input => |info| {
                    std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n", .{ @tagName(info[0]), SizeOfLayer, PrevLayerSize });
                },
                .output => |info| {
                    std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Loss Function: {s}\n", .{ @tagName(info[0]), SizeOfLayer, PrevLayerSize, @tagName(info[3]) });
                },
            }

            std.debug.print("||---------------------------------------------||\n", .{});

            var self = Self{
                .weight_matrix = undefined,
                .bias_vector = undefined,
                .cached_input = null,
                .cached_z = null,
                .cached_activation = null,
                .id_seed = id,
            };

            if (!isInputLayer()) {
                std.debug.print("Is not an Input Layer type!\n", .{});
                _ = try self.apply_zeroes();
                _ = try self.apply_weights();
            }
            // _ = try self.apply_zeroes();
            // _ = try self.apply_weights();

            return self;
        }

        /// Should differentiated based on the following:
        /// - If the tensor/input type is "non-scalar", then we calculate the gradient.
        /// - Else if the input type is a "Scalar", then we apply normal chain rule.
        /// This function would calculate the gradient locally in a specific Layer.
        /// With either respect to the `weight_matrix`, activation function or `bias_vector`.
        pub fn param_grad(self: Self) void {
            //TODO: - gradient logic...
            _ = self;
            unreachable;
        }

        /// Return the used activation function type in this layer.
        pub fn activation(_: Self) ActivationFunction {
            const activation_type = switch (Info) {
                .input => null,
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

        /// The essence of backpropagation is knowing about the chain rule.
        /// Given by: f(g(x)) = f’(g(x)) * g’(x) or (d/dx)f(g(x)) = (df/dg)*(dg/dx).
        /// This function would calculate the backward pass for the local hidden layer.
        ///
        /// To check if backpropagation is correct, we check if the matrix dimension match.
        /// For instance,  dim(∂L/∂W^[L]) = dim(W^[L]), dim(∂L/∂A^[L]) = dim(A^[L]),
        /// and dim(∂L/∂b^[L]) = dim(b^[L]), etc...
        /// OBS(!):  ∂Z^[L]/∂W^[L] = a^[L-1]
        /// --------------------------------
        pub fn backward_grad(self: Self, y_actual: []const T) void {
            //INFO: - Need to cache / save the following:
            // 1. Backward Output: ∂L/∂Z^[L] = ∂L/∂a^[L] * ∂a^[L]/∂Z^[L] = a^[L] - y
            // 1.2. For (1), we cache the ∂L/∂W^[L] and ∂L/∂b^[L].
            // ------------------
            // 2. Previous Layers backward: ∂L/∂a^[L-1] = ∂Z^[L]/∂a^[L-1] * ∂a^[L]/∂Z^[L] * ∂L/∂a^[L]
            // 2.1. Were (2) is the same as: ∂Z/∂a^[L-1] * ∂L/∂Z^[L] <=> Wᵀ^[L] * (∂L/∂a^[L] * ∂a^[L]/∂Z^[L])

            const layerIsOutput = isOutputLayer();
            if (layerIsOutput) {
                const isSoftmax: bool = (self.activation() == ActivationFunction.SoftMax);
                const isCrossEntropy: bool = (LayerObject.loss_kind() == LossType.CrossEntropy);
                const simplifyDerivative: bool = isSoftmax and isCrossEntropy;
                const output_activation = self.activation().execute_fn(T, SizeOfLayer, self.cached_z[0..], false, null);
                if (simplifyDerivative) {
                    const softmax_probs: @Vector(SizeOfLayer, T) = output_activation;
                    const y_vector: @Vector(SizeOfLayer, T) = y_actual[0..].*;
                    const dl_dz = softmax_probs - y_vector;
                    const dz_dw: @Vector(PrevLayerSize, T) = self.cached_input;
                    // These two should be cached / saved.
                    const dl_dw = dl_dz * dz_dw;
                    const dl_db = dl_dz;
                    _ = dl_dw;
                    _ = dl_db;
                }
                //TODO: - Add backward loss, for general case and not simplification.
                // Backward Output: ∂L/∂Z^[L] = ∂L/∂a^[L] * ∂a^[L]/∂Z^[L] = f'[last activation] * L'
                const activation_deriv: @Vector(SizeOfLayer, T) = self.activation().execute_fn(T, SizeOfLayer, self.cached_z[0..], true, null);
                const loss_deriv = LossFunction(T, LayerObject.loss_kind(), SizeOfLayer).get(output_activation[0..], y_actual, true);

                // The dimension is the same as dim(A^[L]).
                const dldz = loss_deriv * activation_deriv; // This is the element-wise product.
                _ = dldz;
            }
        }

        fn update_params(_: *Self) void {
            //TODO: - Update the weights and bias using e.g., SGD:
            // W = W - η·∂L/∂W
            // b = b - η·∂L/∂b

        }

        fn backward_loss(self: Self, y_actual: []const T) void {
            // const last_index: usize = NumLayers - 1;
            // var jacobian_softmax: [OutputLayerSize][OutputLayerSize]T = undefined;
            // var JacobianMatrix = self.get_layer(last_index).LayerMatrix(OutputLayerSize, OutputLayerSize);
            // const s_probs = self.activation().execute_fn(T, LayerSize, self.cached_z[0..], false, null);
            // const da_dz = ActivationFunction.softmax_derivative(T, s_probs, OutputLayerSize);
            // const dc_dz: @Vector(LayerSize, T) = LossFunction(T, LossType.CrossEntropy, LayerSize).get(s_probs[0..], y_actual, true);
            _ = self;
            _ = y_actual;
        }

        /// Computing for the specific layer: z = X*W + B. The node computation should
        /// wrap inside an activation function.
        /// They pseudo logic is: z = (weight_matrix[i][0..]*x[0..]) + bias_vector[0..]
        /// Remember(!): The activation output of each layer has the shape (n^[L], m).
        /// Where "m" represent the batch size / or sample size.
        /// -------------------------------------
        pub fn feedforward(self: *Self, prior_output: Matrix(T, PrevLayerSize, BatchSize), hypr_param: ?T) Matrix(T, SizeOfLayer, BatchSize) {
            if (self.activation() == ActivationFunction.LeakyRelu and hypr_param == null) {
                std.debug.print("Alpha received: {any}\n", .{hypr_param});
                // @compileError("Error: When using LeakyRelu you need to pass an `alpha` value!");
            }

            //WARN: - Having to many matrices on the stack is inefficient. Needs optimization!

            // const weight_mat = LayerMatrix(LayerSize, InputSize).create(self.weight_matrix);
            var output_matrix: Matrix(T, SizeOfLayer, BatchSize) = self.weight_matrix.matmul(prior_output);
            self.cached_input = prior_output;

            // This would add the bias to the matrix depending on the matrix type.
            // E.g., if the matrix has column vector shape (N x 1), row vector shape (1 X N),
            // or multi row and column matrix shape (M x N).
            output_matrix.broadcasting(self.bias_vector);

            self.cached_z = output_matrix;
            self.apply_activation(&output_matrix, hypr_param);
            self.cached_activation = output_matrix;

            return self.cached_activation.?;
        }

        fn apply_activation(self: *Self, output_matrix: anytype, hypr_param: ?T) void {
            const M: usize = @typeInfo(@TypeOf(output_matrix.*)).@"struct".fields[1].defaultValue().?;
            const N: usize = @typeInfo(@TypeOf(output_matrix.*)).@"struct".fields[2].defaultValue().?;
            const ColVectorLength = M;
            const RowVectorLength = N;
            std.debug.print("Applying Activation mapping on the Matrix({d},{d}) [{s}]\n", .{ M, N, @tagName(output_matrix.mat_type) });

            if (self.cached_z == null) {
                std.debug.print("self.cached info: {any}, type: {any}\n", .{ self.cached_z, @TypeOf(self.cached_z) });
                // @compileError("Need to run / calculate z value, before applying activation function!");
            }

            //INFO: - M = Row size, N = Column size.
            switch (output_matrix.mat_type) {
                .ColumnVector => {
                    // When shape of matrix is (n x 1).
                    var column_vec = output_matrix.*.get_colvec(0); // Obtains the (1 x n) vector.
                    const activation_vec = self.activation().execute_fn(T, ColVectorLength, column_vec[0..], false, hypr_param);

                    inline for (0..M) |i| {
                        output_matrix.*.mat[i][0] = activation_vec[i]; // Assign the rows in the column vector.
                    }
                },
                .RowVector => {
                    // When shape of matrix is (1 x N).
                    var row_entries = output_matrix.*.mat[0];
                    output_matrix.*.mat[0] = self.activation().execute_fn(T, RowVectorLength, row_entries[0..], false, hypr_param);
                },
                .Default => {
                    // When shape of matrix is (M x N). E.g., 3 x 2.
                    // We apply activation function element-wise by iterating
                    // each row in the matrix.
                    inline for (0..M) |i| {
                        const row_vals = self.activation().execute_fn(T, RowVectorLength, output_matrix.*.mat[i][0..], false, hypr_param);

                        // const row_values = apply_act(output_matrix.*.mat[i]); // Vector of shape (1 x N)
                        output_matrix.*.mat[i] = row_vals;
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

            for (0..SizeOfLayer) |i| {
                const random_float = random.float(f32);
                self.bias_vector[i] = @as(f16, @floatCast(random_float));
                for (0..PrevLayerSize) |j| {
                    const val = random.float(f32);
                    self.weight_matrix.mat[i][j] = @as(f16, @floatCast(val));
                }
            }
        }

        fn apply_zeroes(self: *Self) !void {
            // const self: *Layer(T, InfoLayer) = @ptrCast(@alignCast(ctx_ptr));
            // @memset(&self.weight_matrix, 0);
            // @memset(&self.bias_vector, elem)
            // self.weight_matrix = std.mem.zeroes([LayerSize][InputSize]T);
            self.weight_matrix = Matrix(T, SizeOfLayer, PrevLayerSize).create(std.mem.zeroes([SizeOfLayer][PrevLayerSize]T));
            self.bias_vector = std.mem.zeroes([SizeOfLayer]T);
            // self.bias_vector = @splat(T);
        }
    };
}

pub fn Matrix(comptime T: type, comptime nrows: usize, comptime ncols: usize) type {
    return struct {
        const Rows = nrows;
        const Cols = ncols;
        const Self = @This();
        mat: [Rows][Cols]T,
        rows: usize = Rows,
        cols: usize = Cols,
        mat_type: MatrixType = if (ncols == 1) MatrixType.ColumnVector else if (nrows == 1) MatrixType.RowVector else MatrixType.Default,

        pub fn create(initial_values: [nrows][ncols]T) Self {
            return Self{
                .mat = initial_values,
                .rows = initial_values.len,
                .cols = initial_values[0].len,
            };
        }

        pub const MatrixType = enum {
            ColumnVector,
            RowVector,
            Default,
        };

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

        pub fn from_array(data: [Rows * Cols]T) Self {
            var new_mat: [Rows][Cols]T = undefined;
            var data_offset: usize = 0;
            for (0..Rows) |row| {
                new_mat[row] = data[data_offset .. data_offset + Cols];
                data_offset += Cols;
            }
            return create(new_mat);
        }

        /// Broadcasting: C_{i,j} = A_{i,j} + b_j.
        /// This mode should be run when `MatrixType` is MatrixType.Default.
        /// Important(!): In deep learning, addition of a matrix and a vector, called `broadcasting` is allowed.
        /// This would yield another matrix: C = A + b, where C_{i,j} = A_{i,j} + b. Where the vector (b) is added,
        /// to each row of the matrix.
        pub fn broadcasting(self: *Self, vec: @Vector(Rows, T)) void {
            // E.g., Matrix of shape (Rows, Cols), Matrix(M x 1), vec(1 x 3)
            var col_vector: @Vector(Rows, T) = undefined;
            const ColVectorLength = Rows;

            // when Matrix(M x 1), multiple rows, single column:
            if (self.mat_type == MatrixType.ColumnVector) {
                const row_vector: @Vector(ColVectorLength, T) = self.get_colvec(0); // Column vector mapped into a row vector representation.
                col_vector = row_vector + vec;
            }

            // If self.mat[i] = number columns in matrix == length of vec or bias vector.
            // E.g., Matrix(3, 2), and bias(1, 3) --> Add row-wise.
            // If Bias(3, 1) --> Add column-wise.

            label: inline for (0..Rows) |i| {
                if (self.mat[i].len == 1) {
                    self.mat[i][0] = col_vector[i];
                } else if (self.rows == 1) {
                    // When Matrix is Matrix(1 x N), single row only.
                    const row_vector: @Vector(Cols, T) = self.mat[i];
                    const result_vec = row_vector + vec;
                    self.mat[i] = result_vec;
                    break :label;
                } else {
                    // When Matrix is: Matrix(M x N), multiple rows.
                    const row_vector: @Vector(Cols, T) = self.mat[i];
                    const result_vec = row_vector + vec;
                    self.mat[i] = result_vec;
                }
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

        pub fn elementwise_operation(self: *Self, f: fn (T) T) void {
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

        /// Element-wise multiplication. The `Hadamard product` is valid for the size requirment,
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

            if (Cols != M) {
                @compileError("The matrix dimension do not match. Check that LHS matrix's col == RHS matrix's row.");
            }

            // From M x N to N x M transformation.
            var new_mat: [Rows][N]T = undefined;

            // Now we can utilze dot product over same size vectors.
            inline for (0..Rows) |i| {
                inline for (0..N) |n| {
                    const row_lhs = self.mat[i][0..]; //LHS[i][0..] = row_i over all transposed col vecs in other mat.
                    // const row_rhs = mat_transpose[n][0..];
                    const row_rhs = rhs_mat.get_colvec(n);
                    const dot_value = dotSIMD(Cols, row_lhs, row_rhs[0..]);
                    new_mat[i][n] = dot_value;
                }
            }
            return Matrix(T, Rows, N).create(new_mat);
        }

        fn get_colvec(self: Self, col_index: usize) [Rows]T {
            var column_vector: [Rows]T = undefined;
            for (0..Rows) |i| {
                column_vector[i] = self.mat[i][col_index];
            }
            return column_vector;
        }

        /// The transpose would e.g. yield a mapping from 3x2 to 2x3.
        pub fn transpose(self: Self) Matrix(T, Cols, Rows) {
            var mat_transpose: [Cols][Rows]T = undefined;
            for (0..Cols) |j| {
                for (0..Rows) |i| {
                    mat_transpose[j][i] = self.mat[i][j];
                }
            }
            return Matrix(T, Cols, Rows).create(mat_transpose);
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

pub const LayerOptions = struct {
    layer_type: LayerType = .Default,
    dim: LayerDim = undefined,
    activation_func: ?ActivationFunction = null,
    loss_func: ?LossType = null,

    pub fn get_dimension(self: @This(), comptime i: comptime_int) usize {
        return self.dim[i];
    }
};

/// General Layer type info such as dimension of the layer,
/// and if the layer use a specific `ActivationFunction` etc...
/// This also act as a placeholder for specific layer actions to perform.
pub const LayerInfo = union(enum) {
    input: struct { LayerType, LayerSize, LayerDim },
    hidden: struct { LayerType, LayerSize, LayerDim, ActivationFunction },
    output: struct { LayerType, LayerSize, LayerDim, LossType },

    pub fn get_type(self: LayerInfo) LayerType {
        const val = switch (self) {
            .hidden => |vals| vals[0],
            .input => |vals| vals[0],
            .output => |vals| vals[0],
        };
        return val;
    }

    pub fn layer_size(self: LayerInfo) usize {
        const size = switch (self) {
            .input => |val| val[1],
            .hidden => |val| val[1],
            .output => |val| val[1],
        };
        return size[0];
    }

    pub fn dim(self: LayerInfo, comptime i: comptime_int) usize {
        const val = switch (self) {
            .hidden => |vals| vals[2],
            .input => |vals| vals[2],
            .output => |vals| vals[2],
        };
        if (i > 1) @compileError("Index 1 and 2 is only valid. [Row: index 0, Col: index 1]");
        return val[i];
    }

    pub fn get_activation(self: LayerInfo) ?ActivationFunction {
        switch (self) {
            .hidden => |vals| return vals[3],
            .input => return null,
            .output => return null,
        }
    }

    pub fn loss_kind(self: LayerInfo) ?LossType {
        switch (self) {
            .hidden => return null,
            .input => return null,
            .output => |vals| return vals[3],
        }
    }
};

test "Testing LayerInfo initialization and logic" {
    std.debug.print("\nLayerInfo test logic case!\n", .{});

    const layer_info = LayerInfo{ .hidden = .{ LayerType.Linear, LayerSize{6}, LayerDim{ 4, 1 }, ActivationFunction.Relu } };

    var layer_type: LayerType = undefined;
    var layer_dim: LayerDim = undefined;
    var layer_activation: ActivationFunction = undefined;
    switch (layer_info) {
        .hidden => |info| {
            layer_type = info[0];
            layer_dim = info[2];
            layer_activation = info[3];
        },
        .input => |info| {
            layer_type = info[0];
            layer_dim = info[2];
            layer_activation = info[3];
        },
        .output => |info| {
            layer_type = info[0];
            layer_dim = info[2];
            layer_activation = info[3];
        },
    }
}

test "dot-product SIMD instruction and feedforward logic" {
    std.debug.print("\nDot product SIMD and feedforward test logic!\n", .{});
    const BatchSize: usize = 1;
    // const layer_input = LayerInfo{.input = .{LayerType.Linear, LayerSize{2}, LayerDim{2, 1}}};
    // var DummyLayer = Layer(f16, layer_input).init(0);

    const dummy_input = [2][1]f16{
        .{2.0},
        .{1.0},
    };

    //LayerDim{PreviousLayerSize, Current LayerSize}, where the Weight Matrix becomes LayerSize x PrevSize.
    const dummy_matrix = Matrix(f16, 2, 1).create(dummy_input);
    std.debug.print("Dummy Matrix (2 x 1): {any}\n", .{dummy_matrix.mat});

    // var dummy_input = [2]f16{2.0, 1.0};
    // [1.0, 4.0], [3.0, 1.0], [2.0, 2.0]
    const weight_mat = [3][2]f16{
        [_]f16{ 1.0, 4.0 },
        [_]f16{ 3.0, 1.0 },
        [_]f16{ 2.0, 2.0 },
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

    _ = expected_z_with_bias;
    _ = expected_z_before_bias;

    const bias = [_]f16{ 1.0, 2.0, 3.0 };
    const bias_relu = [_]f16{ 1.0, -10.0, 3.0 };
    const PreviousLayerSize: usize = 2;
    const CurrentLayerSize: usize = 3; // Layer has 3 number of neurons in layer

    const layer_default = LayerInfo{ .hidden = .{ LayerType.Linear, LayerSize{3}, LayerDim{ PreviousLayerSize, BatchSize }, ActivationFunction.Relu } };
    const layer_leaky = LayerInfo{ .hidden = .{ LayerType.Linear, LayerSize{3}, LayerDim{ PreviousLayerSize, BatchSize }, ActivationFunction.LeakyRelu } };

    const HiddenLayer1 = Layer(f16, layer_default);
    const HiddenLayerLeaky = Layer(f16, layer_leaky);

    var layer = HiddenLayer1.init(1);
    var layer_leakyrely = HiddenLayerLeaky.init(1);
    layer.weight_matrix = Matrix(f16, CurrentLayerSize, PreviousLayerSize).create(weight_mat);
    layer.bias_vector = bias;
    layer_leakyrely.weight_matrix = Matrix(f16, CurrentLayerSize, PreviousLayerSize).create(weight_mat);
    layer_leakyrely.bias_vector = bias_relu;

    //Try feedforward for a hidden layer dotproduct on matrix, check dimension
    // z = W * x + b
    const alpha: f16 = 0.1;
    var z_activation = layer.feedforward(dummy_matrix, null);
    var z_activation_alpha = layer_leakyrely.feedforward(dummy_matrix, alpha);
    const z = layer.cached_z.?.flatten_array();
    const z_leaky = layer_leakyrely.cached_z.?.flatten_array();

    std.debug.print("Type of layer.cached_z.?.flatten_array: {any}\n", .{@TypeOf(z)});
    std.debug.print("Feedforward output before ReLU:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{ z[0], z[1], z[2] });
    std.debug.print("Feedforward output before LeakyReLU:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{ z_leaky[0], z_leaky[1], z_leaky[2] });

    try std.testing.expect((z[0] == 7.0) and (z[1] == 9.0) and (z[2] == 9.0));
    try std.testing.expect((z_leaky[0] == 7.0) and (z_leaky[1] == -3.0) and (z_leaky[2] == 9.0));

    const activation_arr = z_activation.flatten_array();
    const activation_arr_leaky = z_activation_alpha.flatten_array();

    std.debug.print("Feedforward output after ReLU:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{ activation_arr[0], activation_arr[1], activation_arr[2] });
    std.debug.print("Feedforward output after LeakyReLU:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{ activation_arr_leaky[0], activation_arr_leaky[1], activation_arr_leaky[2] });

    try std.testing.expect(activation_arr_leaky[1] == expected_activation[1][0]);

    // Pass by slice pointer reference for modification.
    const ActivationRelu = ActivationFunction.Relu;
    var z_relu = [_]f16{ 1.0, -10.0, 3.0 };
    const z_activation_out = ActivationRelu.execute_fn(f16, 3, z_relu[0..], false, null);

    std.debug.print("After ReLU:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{ z_activation_out[0], z_activation_out[1], z_activation_out[2] });
}

test "Matrix operation validation" {
    // const BatchSize: usize = 1;
    const layer_test_c = LayerInfo{ .hidden = .{ LayerType.Linear, LayerSize{3}, LayerDim{ 3, 1 }, ActivationFunction.LeakyRelu } };
    const layer_test_d = LayerInfo{ .hidden = .{ LayerType.Linear, LayerSize{2}, LayerDim{ 3, 1 }, ActivationFunction.LeakyRelu } };

    const TestLayerC = Layer(f16, layer_test_c);
    const TestLayerD = Layer(f16, layer_test_d);
    _ = TestLayerC;
    _ = TestLayerD;

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
    std.debug.print("Hadamard Product of Matrix C ⊗ C yields:\n {any}\n{any}\n{any}", .{ hadamard.mat[0], hadamard.mat[1], hadamard.mat[2] });
}

test "Feedforward propagation dimension checks" {
    // const BatchSize: usize = 1;
    const BatchSize: usize = 2;

    const InputSize: usize = 2;

    const layer_info = [_]LayerInfo{
        LayerInfo{ .input = .{ LayerType.Embedding, LayerSize{2}, LayerDim{ InputSize, BatchSize } } },
        LayerInfo{ .hidden = .{ LayerType.Linear, LayerSize{3}, LayerDim{ InputSize, BatchSize }, ActivationFunction.Relu } },
        LayerInfo{ .hidden = .{ LayerType.Linear, LayerSize{3}, LayerDim{ 3, BatchSize }, ActivationFunction.Relu } },
        LayerInfo{ .output = .{ LayerType.SoftMax, LayerSize{3}, LayerDim{ 3, BatchSize }, LossType.CrossEntropy } },
    };
    const dummy_input_colvec = [2][1]f16{
        .{2.0},
        .{1.0},
    };
    _ = dummy_input_colvec;
    const dummy_input = [2][2]f16{
        .{ 2.0, 2.0 },
        .{ 1.0, 1.0 },
    };

    //LayerDim{PreviousLayerSize, Current LayerSize}, where the Weight Matrix becomes LayerSize x PrevSize.
    const input_matrix = Matrix(f16, 2, BatchSize).create(dummy_input);
    const alpha: ?f16 = 0.1;
    var h1 = Layer(f16, layer_info[1]).init(1);
    var h2 = Layer(f16, layer_info[2]).init(2);
    var output_layer = Layer(f16, layer_info[3]).init(3);

    // var output_matrix = Matrix(f16, 3, BatchSize).create([3][BatchSize]f16{
    //     .{0.0},
    //     .{0.0},
    //     .{0.0},
    // });

    // std.testing.expect()

    var output_matrix = h1.feedforward(input_matrix, alpha); // Expected Matrix(3, 1).
    const h1_w_dim0, const h1_w_dim1 = h1.weight_matrix.get_dimension(); // Expected Matrix(3, 2).
    const h1_a_dim0, const h1_a_dim1 = h1.cached_activation.?.get_dimension();
    const h1_in_dim0, const h1_in_dim1 = h1.cached_input.?.get_dimension();
    std.debug.print("Input X: {any}\n", .{h1.cached_input.?.mat});
    std.debug.print("Forwardpass through h1: {any}\nW1 Dim({d},{d}), A^[L-1] Dim({d},{d}), A^[L]=σ(z1) Dim({d},{d})\n", .{ output_matrix.mat, h1_w_dim0, h1_w_dim1, h1_in_dim0, h1_in_dim1, h1_a_dim0, h1_a_dim1 });

    std.debug.print("↓==================================↓\n", .{});

    output_matrix = h2.feedforward(output_matrix, alpha); // Expected Matrix(3, 1).
    const h2_w_dim0, const h2_w_dim1 = h2.weight_matrix.get_dimension(); // Expected Matrix(3, 3).
    const h2_a_dim0, const h2_a_dim1 = h2.cached_activation.?.get_dimension(); // Same as output_matrix as (3, 1).
    const h2_in_dim0, const h2_in_dim1 = h2.cached_input.?.get_dimension();
    std.debug.print("Forwardpass through h2: {any}\nW2 Dim({d},{d}), A^[L-1] Dim({d},{d}), A^[L]=σ(z2) Dim({d},{d})\n", .{ output_matrix.mat, h2_w_dim0, h2_w_dim1, h2_in_dim0, h2_in_dim1, h2_a_dim0, h2_a_dim1 });

    std.debug.print("↓==================================↓\n", .{});

    const probs = output_layer.feedforward(output_matrix, null);
    const output_input = output_layer.cached_input.?;
    _ = output_input;
    const output_z = output_layer.cached_z.?;
    const output_a_probs = output_layer.cached_activation.?;
    const out_a_dim0, const out_a_dim1 = output_matrix.get_dimension();
    std.debug.print("Forwardpass OUTPUT layer: {any}\nz3{any}\nSoftmax Activation: {any}\n, A^[L]=σ(z3) Dim({d},{d})\n", .{ probs.mat, output_z.mat, output_a_probs.mat, out_a_dim0, out_a_dim1 });

    std.debug.print("↓==================================↓\n", .{});

    const LossObject = LossFunction(f16, LossType.CrossEntropy, 3);
    const y_true = [_]f16{ 0.0, 1.0, 0.0 }; // as one-hot encoded vector.
    const predictions = probs.flatten_array();
    const loss_vec = LossObject.get(predictions[0..], y_true[0..], false);
    std.debug.print("Softmax probabilities: {any}\nCross entropy loss: {any}\n", .{ predictions, loss_vec });
}

test "Pointers in Zig and inspect memory of Layer type" {
    // Zig has two kinds of pointers:
    // - `Single-Item` - `*T`
    // - `Many-Item` - [*]T
    //
    // `*[N]T` - points to N items, same as single-item pointer to an array.
    // `[]T` - is a slice (a fat pointer, which contains a pointer of type [*]T and a length).
    //
    // Use `&x` to obtain a single-item pointer.

    // const N: usize = 4;
    // const M: usize = 6;
    //
    // // pub fn allocator(self: *FixedBufferAllocator) Allocator {
    // const flatten_array: [N*M]u8 = undefined;
    //
    // const layer_info = LayerInfo{.output = .{LayerType.Softmax, LayerDim{6, 6}, LossType.CosineSimilarity}};
    // const layer_info_default = LayerInfo{.hidden = .{LayerType.Linear, LayerDim{4, 6}, ActivationFunction.LeakyRelu}};
    //
    // const DefaultLayer = Layer(f16, layer_info_default);
    // const DefaultLayerOutput = Layer(f16, layer_info);
    //
    // const layer = DefaultLayer.init(1);
    // const layer_output = DefaultLayerOutput.init(2);
    //
    // const row = layer.weight_matrix[1];
    // const matrix_ptr = &layer.weight_matrix; // *[?][?]T
    // _ = row;
    //
    // const weight_row_type = @TypeOf(layer.weight_matrix[0]);
    // const num_rows = layer.weight_matrix[0..].len;
    // const total_weight_size = @sizeOf(weight_row_type) * num_rows;
    // const size = @bitSizeOf(DefaultLayer);

    // std.debug.print("Type of &layer.weight_matrix: {any}\n", .{@TypeOf(matrix_ptr)});
    // std.debug.print("Size of layer type: {}\n", .{size});
    // std.debug.print("Size of a row in bytes: {}\n", .{@sizeOf(@TypeOf(layer.weight_matrix[0]))});
    // std.debug.print("Length of row (= nr cols): {}\n", .{layer.weight_matrix[0].len});
    // std.debug.print("Length of col (= nr rows): {}\n", .{layer.weight_matrix[0][0..].len});
    //
    // std.debug.print("Size of the row type {}: {}\n", .{@TypeOf(layer.weight_matrix[0]), @sizeOf(@TypeOf(layer.weight_matrix[0]))});
    //
    // std.debug.print("Type of row: {any}\n", .{@TypeOf(layer.weight_matrix[0])});
    // std.debug.print("Size of element type T: {}, T = {any}\n", .{@sizeOf(@TypeOf(layer.weight_matrix[0][0])), @TypeOf(layer.weight_matrix[0][0])});
    // std.debug.print("Total Size of weight matrix: {}\n", .{total_weight_size});
    //
    // std.debug.print("Size of weight matrix type: {}\n", .{@sizeOf(@TypeOf(layer.weight_matrix))});
    //
    // std.debug.dumpHex(&flatten_array);
    // std.debug.print("Weight Matrix: {any}\n Bias Vector: {any}\n", .{layer.weight_matrix, layer.bias_vector});
    // std.debug.print("Weight Matrix (output): {any}\n Bias Vector: {any}\n", .{layer_output.weight_matrix, layer_output.bias_vector});
    //
}
