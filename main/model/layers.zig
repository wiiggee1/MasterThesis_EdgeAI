const std = @import("std");
const math = std.math;
const testing = std.testing;
const model = @import("model_builder.zig");
const common = @import("common_functions.zig");
const ActivationFunction = common.ActivationFunction;
const LossType = common.LossType;
const LossFunction = common.LossFunction;
const assert = std.debug.assert;

//NOTE: Do *const MyStruct if you don’t want it to be mutable

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
        const MatrixAlignment = @alignOf(T);
        
        // const MetaFields = std.meta.fields(comptime T: type)
        
        // const LayerSize: usize = if (layer_option != null) layer_option.?.get_dimension(1) else 0;
        // const InputSize: usize = if (layer_option != null) layer_option.?.get_dimension(0) else 0; 

        /// Prior layers output which is the input data to the current layer. 
        const InputSize = LayerObject.dim(0);
        
        /// Size of the layer in terms of number of neurons.
        const LayerSize = LayerObject.dim(1); 
        /// Size of the Weight Matrix. 
        const MatrixCapacity = LayerSize*InputSize; 

        // pub const Activation = LayerObject.
        
        /// Meta data and general Info about the Layer. This act as a placeholder, 
        /// for determining what actions to execute for this layer. 
        pub const Info = LayerObject;

        /// Weight matrix dimension is given by num nodes in layer l times l-1.
        /// Where `InputSize` represent prior layer size and `LayerSize` the current layer size.
        weight_matrix: [LayerSize][InputSize]T,

        /// Biases for a layer is represented by a M x 1 matrix or row vector.
        /// Where M represent the `LayerSize`. 
        bias_vector: [LayerSize]T,

        /// This should cache the input data given by saving the partial derivative of
        /// δz^[L]/δw^[L] = σ^[L-1](z) = input data from prior layer. 
        cached_input: [InputSize]T,

        /// δa^[L]/δz^[L] = σ'(z). This should be stored during the forward pass. 
        cached_z: [LayerSize]T, 

        /// This seed id, represent an index that points to a specific layer 
        /// in a collection. It also act as the seed for random initialization 
        /// of the weights and biases internally. 
        id_seed: usize,


        pub fn init(id: usize) Self {
            // if (MatrixCapacity > fixed_buf.len){
                // return error.ExceedingFixedBufferLength;
            // }

            std.debug.print("\t»»»Created a new {s} Layer:«««\n||---------------------------------------------||\n", .{@tagName(Info)});
            
            switch (Info) {
                .hidden => |info| {
                    std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Activation Function: {s}\n", .{ 
                        @tagName(info[0]), 
                        LayerSize, 
                        InputSize, 
                        @tagName(info[2])}
                    ); 
                },
                .input => |info| {
                    std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n", .{
                    @tagName(info[0]), 
                    LayerSize, 
                    InputSize}
                    ); 
                },
                .output => |info| {
                    std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Loss Function: {s}\n", .{ 
                    @tagName(info[0]), 
                    LayerSize, 
                    InputSize, 
                    @tagName(info[2])}
                    );
                }
            }

            std.debug.print("||---------------------------------------------||\n", .{});
            
            var self = Self{
                .weight_matrix = undefined,
                .bias_vector = undefined,
                .id_seed = id,
            };
            _ = try self.apply_zeroes();
            _ = try self.apply_weights();
            
            return self;
        }

        // pub const LayerNode = struct {
        //     weights: [LayerSize][InputSize]T,
        //     bias: [LayerSize]T,
        //     prev: ?*LayerNode = null,
        //     next: ?*LayerNode = null,
        // };


        /// Should differentiated based on the following: 
        /// - If the tensor/input type is "non-scalar", then we calculate the gradient.
        /// - Else if the input type is a "Scalar", then we apply normal chain rule.
        /// This function would calculate the gradient locally in a specific Layer. 
        /// With either respect to the `weight_matrix`, activation function or `bias_vector`.
        pub fn param_grad(self: Self) void {
            _ = self; 
        }

        /// Return the used activation function type in this layer. 
        pub fn activation(_: Self) ActivationFunction {
            if (@hasField(LayerObject, "hidden")){
                return LayerObject.get_activation(); 
            }
        }

        pub fn isOutputLayer() bool {
            return @hasField(LayerObject, "output");
        }

         pub fn isInputLayer() bool {
            return @hasField(LayerObject, "input");
        }

        /// The essence of backpropagation is knowing about the chain rule. 
        /// Given by: f(g(x)) = f’(g(x)) * g’(x) or (d/dx)f(g(x)) = (df/dg)*(dg/dx).
        /// This function would calculate the backward pass for the local hidden layer. 
        /// 1. δz = δy ⊗ σ'(z) [element-wise]
        /// 2. δW = xᵀ·δz
        /// 3. δb = sum(δz, axis=0)
        /// 4. δx = δz·Wᵀ
        /// 5. W = W - η·δW
        /// 6. b = b - η·δb
        pub fn backpropagation(self: Self, y_actual: []const T) void{
            const layerIsOutput = isOutputLayer();
            if (layerIsOutput) {
                const isSoftmax: bool = (self.activation() == ActivationFunction.SoftMax);
                const isCrossEntropy: bool = (LayerObject.loss_kind() == LossType.CrossEntropy);
                const simplifyDerivative: bool = isSoftmax and isCrossEntropy;
                const output_activation = self.activation().execute_fn(T, LayerSize, self.cached_z[0..], false, null);
                if (simplifyDerivative) {
                    const softmax_probs: @Vector(LayerSize, T) = output_activation; 
                    const y_vector: @Vector(LayerSize, T) = y_actual[0..].*;
                    const dl_dz = softmax_probs - y_vector; 
                    const dz_dw: @Vector(InputSize, T) = self.cached_input; 
                    // These two should be cached / saved. 
                    const dl_dw = dz_dw * dl_dz;
                    const dl_db = dl_dz; 


                    //TODO: - Need to cache / save the following: 
                    // 1. Backward Output: ∂L/∂Z^[L] = ∂L/∂a^[L] * ∂a^[L]/∂Z^[L] = a^[L] - y
                    // 1.2. For (1), we cache the ∂L/∂W^[L] and ∂L/∂b^[L].
                    // ------------------
                    // 2. Previous Layers backward: ∂L/∂a^[L-1] = ∂Z^[L]/∂a^[L-1] * ∂a^[L]/∂Z^[L] * ∂L/∂a^[L]
                    // 2.1. Were (2) is the same as: ∂Z/∂a^[L-1] * ∂L/∂Z^[L] <=> Wᵀ^[L] * (∂L/∂a^[L] * ∂a^[L]/∂Z^[L])
                    // 2.2. ∂L/∂W^[L-1] =  

                }
                //TODO: - Add backward loss, for general case and not simplification. 
                // Backward Output: ∂L/∂Z^[L] = ∂L/∂a^[L] * ∂a^[L]/∂Z^[L] = f'[last activation] * L'
                const activation_deriv: @Vector(LayerSize, T) = self.activation().execute_fn(T,  LayerSize, self.cached_z[0..], true, null);
                const loss_deriv = LossFunction(T, LayerObject.loss_kind(), LayerSize).get(output_activation[0..], y_actual, true);
                const dldz = loss_deriv * activation_deriv; // This is the element-wise product.  
                // const grad_matrix = 

                 
            }
            // INFO: - Summary (e.g., 3 hidden layers.) 
            // 1. Cache / Save: ∂L/∂W^[L], ∂L/∂b^[L], and ∂L/∂Z^[L]  [OUTPUT LAYER BACKWARD]
            // 2. First previous layer: · · Wᵀ[index+1] · ∂L/∂z
            
            //
            // W_trans = self.weight_mats[back_index+1].T        #we use the transpose of the weights in the current layer
            // d_activ = self.hidden_activation(self.netIns[back_index],derivative=True)  #δl=((wl+1)Tδl+1)⊙σ′(zl)
            // d_error = np.dot(delta, W_trans)
            // delta = d_error * d_activ   #this should be the hadamard product, 
            //
            // gradient_mat = np.dot(self.netOuts[back_index].T , delta)
            // bias_grad_mat = 1 * delta


        }

        fn backward_loss(self: Self, y_actual: []const T) void {
            // const last_index: usize = NumLayers - 1;
            // var jacobian_softmax: [OutputLayerSize][OutputLayerSize]T = undefined; 
            // var JacobianMatrix = self.get_layer(last_index).LayerMatrix(OutputLayerSize, OutputLayerSize);
            
            const s_probs = self.activation().execute_fn(T, LayerSize, self.cached_z[0..], false, null);

            // const da_dz = ActivationFunction.softmax_derivative(T, s_probs, OutputLayerSize);
            const dc_dz: @Vector(LayerSize, T) = LossFunction(T, LossType.CrossEntropy, LayerSize).get(s_probs[0..], y_actual, true); 

            
        }


        /// Computing for the specific layer: z = X*W + B and wrap inside
        /// an activation function.
        /// They pseudo logic is: z = (weight_matrix[i][0..]*x[0..]) + bias_vector[0..]
        pub fn feedforward(self: Self, prior_output: []const T, weights: ?[LayerSize][InputSize]T, bias: ?[LayerSize] T) [LayerSize]T {
            var z :[LayerSize]T = undefined;
          
            //NOTE: - Zig docs state: 
            // To extract a comptime-known length from a runtime-known offset,
            // first extract a new slice from the starting offset, then an array of
            // comptime-known length

            for (0..LayerSize) |i| {
                if (weights != null and bias != null){
                    const weight_row = weights.?;
                    const row_arr = weight_row[i][0..InputSize].*;
                    const row_slice: []const T = row_arr[0..];
                    z[i] = dotSIMD(InputSize, row_slice, prior_output); 
                }else {
                    z[i] = dotSIMD(InputSize, self.weight_matrix[i][0..], prior_output) + self.bias_vector[i]; 
                }
            }
            if (bias != null){
                const bias_vec: @Vector(LayerSize, T) = bias.?; 
                const z_vec: @Vector(LayerSize, T) = z[0..].*;
                z = z_vec + bias_vec;
            }
             
            return z;
        }

        fn get_dimension(self: Self) LayerDim{
            const input_len = self.layer_info.dim(0); 
            const hidden_len = self.layer_info.dim(1); 

            //NOTE: - f1(x ; W1, b1), f2(a1; W2, b2), yhat = f3(a2, W3, b3)
            // -------> W1 * x + b1 , W2 * a1 + b2, ... 
            return  LayerDim{input_len, hidden_len};
            
        }

        /// SIMD instruction utilization, calculating the dot product.
        /// The input should be represented as matrices of type: 
        /// A = []const @Vector(LayerSize, T), B = same type as A.
        /// The dot product would multiple rows from A with cols from B.
        inline fn dotSIMD(comptime vec_size: usize, vec_a: []const T, vec_b: []const T) T {
            // var product: FeatureVec = @splat(0.0);
            const VecSize: usize = comptime vec_size;
            const FeatureVector = @Vector(VecSize, T);
           
            // You can also assign from a slice with comptime-known length to a vector using .*
            const vec1: FeatureVector = vec_a[0..VecSize].*; // from slice to vec / array type by dereferencing. 
            const vec2: FeatureVector = vec_b[0..VecSize].*;
            const product: FeatureVector = vec1 * vec2; // Element-wise multiplication.  
            // std.debug.print("1. Element-wise mult: {any}\n", .{product});
            // std.debug.print("2. Transform vector to scalar value: {}\n", .{@reduce(.Add, product)});
            return @reduce(.Add, product); 
        }

        pub fn LayerMatrix(comptime nrows: usize, comptime ncols: usize) type {
            return struct {
                const Rows = nrows;
                const Cols = ncols;
                mat: [Rows][Cols]T, 

                pub fn flatten_array(data: *[nrows][ncols]T) [nrows*ncols]T {
                    var item_offset: usize = 0;
                    var array: [nrows*ncols]T = undefined; 
                    
                    for (0..nrows) |row_offset| {
                        const row_slice = data[row_offset][0..ncols];
                        @memcpy(array[item_offset..item_offset + ncols], row_slice);
                        // @memcpy(array[item_offset..item_offset+ncols], data[row_offset][0..]);
                        item_offset += ncols;
                    }
                    std.debug.print("flatten array before: {any} and after: {any}\n", .{data.*, array});
                }
                
                pub fn into_matrix(data: [nrows*ncols]T) [nrows][ncols]T {
                    var mat: [nrows][ncols]T = undefined; 
                    var data_offset: usize = 0; 
                    for (0..nrows) |row| {
                        mat[row] = data[data_offset..data_offset+ncols];
                        data_offset += ncols;
                    }
                    return mat;
                }

                pub fn transpose(self: @This()) [ncols][nrows]T {
                    // E.g., from 3x2 |--> 2x3
                    var mat_transpose: [ncols][nrows]T = undefined; 
                    for (0..Cols) |j| {
                        for (0..Rows) |i| {
                            const element_ji = self.mat[j][i]; // mat[0][i], mat[0][i+1], mat[0][i+2].  
                            mat_transpose[j][i] = element_ji; 
                        }
                    }
                    return mat_transpose;

                }
            };
        }


        fn apply_weights(self: *Self) !void{
            // const self: *Layer(T, InfoLayer) = @ptrCast(@alignCast(ctx_ptr));
            // const InputSize, const LayerSize = self.get_dimension();
            var rgen = std.Random.DefaultPrng.init(self.id_seed);
            const rand = rgen.random();
            
            var random_gen = std.Random.Pcg.init(rand.int(u32));
            const random = random_gen.random();
            // E.g., 3 x 2, with input size = 2 and layer size = 3. 
            for (0..LayerSize) |i| {
                const random_float = random.float(f32);
                self.bias_vector[i] = @as(f16, @floatCast(random_float)); 
                for (0..InputSize) |j| {
                    const val  = random.float(f32);
                    self.weight_matrix[i][j] = @as(f16, @floatCast(val));
                }
            }
        }

        fn apply_zeroes(self: *Self) !void{
            // const self: *Layer(T, InfoLayer) = @ptrCast(@alignCast(ctx_ptr));
            // const InputSize, const LayerSize = self.get_dimension();

            // @memset(&self.weight_matrix, 0);
            // @memset(&self.bias_vector, elem)
            self.weight_matrix = std.mem.zeroes([LayerSize][InputSize]T);
            self.bias_vector = std.mem.zeroes([LayerSize]T);
        }

        pub fn layer(self: *Self) LayerType {
            return LayerType.init(self);
        }
    };
}

pub const LayerDim = struct{usize, usize};

pub const DefaultLayerParams = union(enum){
    alpha: f16,
    epsilon: f16
};

/// Specific Layer types, which dictate the behavior and logic 
/// towards a specific layer type. 
pub const LayerType = enum {
    Norm,
    BatchNorm,
    Linear,
    Dense,
    Softmax,
    Embedding,
    Dropout,
    MultiHeadAttention,
    Transformer,
    Default,
};

pub const LayerTypeSettings = union(LayerType) {
    Norm: DefaultLayerParams,
    BatchNorm: DefaultLayerParams,
    Linear: DefaultLayerParams,
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

    pub fn get_dimension(self: @This(), comptime i: comptime_int) usize{
        return self.dim[i];
    }

};


/// General Layer type info such as dimension of the layer, 
/// and if the layer use a specific `ActivationFunction` etc...
/// This also act as a placeholder for specific layer actions to perform. 
pub const LayerInfo = union(enum){
    input: struct{LayerType, LayerDim}, 
    hidden: struct{LayerType, LayerDim, ActivationFunction},
    output: struct{LayerType, LayerDim, LossType},

    pub fn get_type(self: LayerInfo) LayerType {
        const val = switch (self) { 
            .hidden => |vals| vals[0],
            .input => |vals| vals[0],
            .output => |vals| vals[0],
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

    pub fn into_option(self: LayerInfo) LayerOptions {
        var layer_type: LayerType = undefined; 
        var layer_dim: LayerDim = undefined; 
        var layer_activation: ?ActivationFunction = null;
        var layer_loss: ?LossType = null; 
        
        switch (self) { 
            .hidden => |info| {
            layer_type = info[0];
            layer_dim = info[1];
            layer_activation = info[2];
            },
            .input => |info| {
                layer_type = info[0];
                layer_dim = info[1];
                layer_activation = info[2];
            },
            .output => |info| {
                layer_type = info[0];
                layer_dim = info[1];
                layer_loss = info[2];
            } 
        }

        return LayerOptions{.layer_type = layer_type, .dim = layer_dim, .activation_func = layer_activation, .loss_func = layer_loss};
    }

};


test "Testing LayerInfo initialization and logic" {
    std.debug.print("\nLayerInfo test logic case!\n", .{});
    
    // const Options = LayerOptions{.T = f16, .dim = .{2,3}, .layer_type = .Linear, .activation_func = .LeakyRelu, .loss_func = null};
    // const OptionsOther = LayerOptions{.T = f16, .dim = .{2,3}, .layer_type = .Embedding, .activation_func = null, .loss_func = null};

    // const LayerOne = LayerTest(Options);
    // const LayerTwo = LayerTest(OptionsOther);
    // std.debug.print("LayerOne type: {any}, LayerTwo type: {any}\n", .{@TypeOf(LayerOne), @TypeOf(LayerTwo)});

    const layer_info = LayerInfo{.hidden = .{LayerType.Linear, LayerDim{4, 6}, ActivationFunction.Relu}};
 
    var layer_type: LayerType = undefined; 
    var layer_dim: LayerDim = undefined; 
    var layer_activation: ActivationFunction = undefined; 
    switch (layer_info) {
        .hidden => |info| {
            layer_type = info[0];
            layer_dim = info[1];
            layer_activation = info[2];

        },
        .input => |info| {
            layer_type = info[0];
            layer_dim = info[1];
            layer_activation = info[2];
        },
        .output => |info| {
            layer_type = info[0];
            layer_dim = info[1];
            layer_activation = info[2];
        }
    }
}

test "dot-product SIMD instruction and feedforward logic" {
    std.debug.print("\nDot product SIMD and feedforward test logic!\n", .{});
 
    var dummy_input = [2]f16{2.0, 1.0};
    // [1.0, 4.0], [3.0, 1.0], [2.0, 2.0]
    const weight_mat = [3][2]f16{
       [_]f16{1.0, 4.0},
       [_]f16{3.0, 1.0},
       [_]f16{2.0, 2.0},
    };
    const bias = [_]f16{1.0, 2.0, 3.0};
    const bias_relu = [_]f16{1.0, -10.0, 3.0};

    const layer_default = LayerInfo{.hidden = .{LayerType.Linear, LayerDim{2, 3}, ActivationFunction.LeakyRelu}};

    const HiddenLayer1 = Layer(f16, layer_default);
    
    // const weightz = HiddenLayer1.WeightMatrix(3, 2).flatten_array(&weight_mat);
    // std.debug.print("WeightMatrix to 1D array: {any}", .{weightz});
   
    const layer = HiddenLayer1.init(1);
    // const layer = HiddenLayer1.init(.{.hidden = .{LayerType.Linear, LayerDim{2, 3}, ActivationFunction.Relu}}); 

    // Try dotSIMD logic first:
    const vec_a = [_]f16{1.0, 2.0, 3.0};
    const vec_b = [_]f16{1.0, 2.0, 3.0};
    const dot_out = HiddenLayer1.dotSIMD(3, &vec_a, &vec_b);
    std.debug.print("dotSIMD for {any} and {any}, gave: {d}\n\n", .{vec_a, vec_b, dot_out});
    try std.testing.expect(dot_out == 14.0);


    //Try feedforward for a hidden layer dotproduct on matrix, check dimension
    // z = W * x + b
    const z = layer.feedforward(&dummy_input, weight_mat, bias);
    std.debug.print("Feedforward output:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{z[0], z[1], z[2]}); 
    try std.testing.expect((z[0] == 7.0) and (z[1] == 9.0) and (z[2] == 9.0));

    var z_activation = layer.feedforward(&dummy_input, weight_mat, bias_relu);
    std.debug.print("Feedforward output before ReLU:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{z_activation[0], z_activation[1], z_activation[2]});

    // Pass by slice pointer reference for modification. 
    const ActivationRelu = ActivationFunction.Relu;
    ActivationRelu.execute_fn(f16, 3, z_activation[0..], false, null); 
    std.debug.print("After ReLU:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{z_activation[0], z_activation[1], z_activation[2]}); 


    //Validation test with random weights:
    const z_test = layer.feedforward(&dummy_input, null, null); 
    std.debug.print("X input as {d}x1: {any}\n", .{dummy_input.len, dummy_input});
    std.debug.print("Weight Matrix dim: {}x{}\nWeight Matrix data: {any}\n", .{layer.weight_matrix[0..].len, layer.weight_matrix[0][0..].len, layer.weight_matrix});
    std.debug.print("Bias vector as {d}x1: {any}\n", .{layer.bias_vector.len, layer.bias_vector});
    std.debug.print("Feedforward output on {s}:\n\u{2308}{d}\u{2309}\n|{d}|\n\u{230B}{d}\u{230A}\n", .{@typeName(HiddenLayer1), z_test[0], z_test[1], z_test[2]}); 
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
