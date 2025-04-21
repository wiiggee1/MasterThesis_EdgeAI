const std = @import("std");
const assert = std.debug.assert;

const layer_types = @import("layers.zig");
const Layer = layer_types.Layer;
const LayerOptions = layer_types.LayerOptions;
const LayerTest = layer_types.LayerTest;
const LayerInfo = layer_types.LayerInfo;
const LayerType = layer_types.LayerType;
const LayerDim = layer_types.LayerDim;
const LayerSize = layer_types.LayerSize;
const LayerDimension = layer_types.LayerDimension;
const LayerDataShapes = layer_types.LayerDataShapes;
const Matrix = layer_types.Matrix;
const InputShapeConvention = layer_types.InputShapeConvention;

const loader = @import("dataloader.zig");
const DataLoader = loader.DataLoader; 

const common = @import("common_functions.zig");
const LossType = common.LossType;
const LossFunction = common.LossFunction;
const ActivationFunction = common.ActivationFunction;

const OptimizerType = @import("optimizer.zig").OptimizerType;

/// This act as the base model, for building a deep learning model.
/// The provided `LayerData` slice need to be mutable for modifying internal layer data. 
/// Hence, the life-time and ownership of the layers and its associated data, is handled 
/// in main → `NNModel`. 
pub fn NNModel(comptime T: type, comptime LayerData: []const type, comptime Convention: InputShapeConvention, comptime FixedBufferSize: usize) type {
    return struct {
        const Self = @This();

        /// Number of unique layers in the topology network.
        pub const NumLayers: usize = LayerData.len;

        /// Type of the input layer. E.g., size of layer etc...
        pub const InputLayer = Layer(T, LayerData[0].Info, Convention);  
        
        /// First dimensions should represent one sample data (row dimension).
        pub const InputDataShape = InputLayer.InputDimension; 

        pub const InputMatrix = Matrix(T, InputDataShape[0], InputDataShape[1]); 

        /// The `BatchSize` is the same as number of samples per forward pass.
        /// This value dictate the matrix dimensions for each layer activation output.
        pub const BatchSize: usize = InputLayer.Info.get_shape_of(.batch_size).?;
        pub const InputFeatures = InputLayer.Info.get_shape_of(.feature_size).?; 

        /// Index of the last layer in the computational graph network.
        pub const OutputLayerIndex: usize = LayerData.len - 1;

        const OutputLayer = Layer(T, LayerData[OutputLayerIndex].Info, Convention);
        const OutputLayerSize = OutputLayer.SizeOfLayer;
        const OutputLayerDimension = OutputLayer.OutputDimension;
        const OutputLossType: LossType = OutputLayer.Info.loss_kind().?;
        const OutputLayerMatrix = Matrix(T, OutputLayerDimension[0], OutputLayerDimension[1]); 
        const LossFn = LossFunction(T, OutputLossType, OutputLayerSize, BatchSize, Convention);

        pub const GradBufferSize: struct{usize, usize} = blk: {
            var wgrad_size: usize = 0; 
            var bgrad_size: usize = 0; 
            for (LayerData[1..NumLayers], 1..NumLayers) |CurrentLayer, i| {
                _ = CurrentLayer; 
                const WeightDimension = LayerData[i].WeightDimension; 
                const WeightCapacity: usize = WeightDimension[0] * WeightDimension[1]; 
                const BiasSize = LayerData[i].SizeOfLayer;
                wgrad_size += WeightCapacity;
                bgrad_size += BiasSize; 
            }
            // break :blk .{@sizeOf(T)*wgrad_size, @sizeOf(T)*bgrad_size}; 
            break :blk .{wgrad_size, bgrad_size}; 
        };
        
        /// When calculating the gradient of the loss with respect to z, we pre-calculate 
        /// the size of the upstream buffer. Upstream are the gradient of the loss + weight of the layer. 
        pub const UpstreamSizes: struct{usize, usize} = blk: {
            var largest_weight: usize = 0; 
            var largest_output: usize = 0; 
            for (LayerData[1..NumLayers], 1..NumLayers) |CurrentLayer, i| {
                _ = CurrentLayer; 
                const WeightDimension = LayerData[i].WeightDimension; 
                const WeightCapacity: usize = WeightDimension[0] * WeightDimension[1]; 
                const OutputDimension = LayerData[i].OutputDimension; 
                const OutputSize: usize = OutputDimension[0] * OutputDimension[1]; 
                if (i == 1) {
                    largest_weight = WeightCapacity;
                    largest_output = OutputSize; 
                }else {
                    if (WeightCapacity > largest_weight) {
                        largest_weight = WeightCapacity;
                    }
                    if (OutputSize > largest_output) {
                        largest_output = OutputSize;
                    }
                    continue; 
                }
            }
            break :blk .{largest_output, largest_weight}; 
        };

        const UpstreamBufferSize: usize = UpstreamSizes[0] * UpstreamSizes[1]; // Largest Output size * largest weight matrix. 

        /// This should work as a mutable tuple, for easy access to all the layers,
        /// in the neural network.
        layers: std.meta.Tuple(LayerData),

        hypr_params: HyperParameters,

        /// The `model_buffer`, is a FixedBufferAllocator, that manage the memory allocation 
        /// of the cached matrix data during feedforward and backward pass. This essentially 
        /// latch (reuse the same buffer) for the currently active upstream or lowstream layer data. 
        model_buffer: ModelBuffer(T, FixedBufferSize, NumLayers), 
            // var weight_grads = try self.model_buffer.create_buf(GradBufferSize[0]);
            // var bias_grads = try self.model_buffer.create_buf(GradBufferSize[1]);

        pub fn init(hyper_params: HyperParameters) Self {
            var self = Self{
                .layers = undefined,
                .hypr_params = hyper_params,
                .model_buffer = ModelBuffer(T, FixedBufferSize, NumLayers).init(), 
            };

            inline for (LayerData, 0..) |val, idx| {
                if (idx < LayerData.len) {
                    self.layers[idx] = val.init(idx);
                    // val.* = LayerData[idx].init();
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

        pub fn get_layer(self: *Self, comptime idx: usize) *Layer(T, LayerData[idx].Info, Convention) {
            return &self.layers[idx];
        }

        /// This would calculate the already known gradient of the output layer.
        /// This is also known, as the local error signal δ = ∂L/∂a • ∂L/∂a. 
        /// Where C = L = Cost or Loss function, and a = activation output. 
        /// δᴸ = ∇_z L(Ŷ, Y)
        /// For layers, L = N - 1, N - 2, ..., 1, δᴸ = (Wᵀ⁽ᴸ⁺¹⁾ δ⁽ᴸ⁺¹⁾)◦ g'(zᴸ)
        /// --------------------------------------------------------------
        /// Important note, is that when backpropagating through an activation function, we 
        /// apply the Hadamard product (element wise multiplication, ⊙), because f(z) is applied element-wise. 
        /// δ = ∂L/∂z = ∂L/∂a ⊙ f'(z) → Jacobian(Softmax). 
        /// probs = Jacobian(Softmax) = y_predict = ∇a, w.r.t, z.  
        fn backward_loss(self: *Self, y_predict: OutputLayerMatrix, y_actual: OutputLayerMatrix) !Matrix(T, LayerData[OutputLayerIndex].InputDimension[0], LayerData[OutputLayerIndex].InputDimension[1]) {
            const dl_dz = LossFn.get_grad(y_predict, y_actual); 
            const propagator_loss = try self.layers[OutputLayerIndex].loss_backward(dl_dz, &self.hypr_params);
            return propagator_loss;
        }
       
        /// This is just a wrapper for returning an already pre-allocated slice sequence, related to a specific layer. 
        fn layer_grads(self: *Self, comptime layer_index: usize) !struct {w: []T, b: []T} {
            const weight_size: usize = LayerData[layer_index].WeightDimension[0] * LayerData[layer_index].WeightDimension[1];
            const bias_size = LayerData[layer_index].SizeOfLayer;
            return .{
                .w = try self.model_buffer.grad_buf.add_block(.weight_grad, layer_index, weight_size),
                .b = try self.model_buffer.grad_buf.add_block(.bias_grad, layer_index, bias_size),
            };
        }

        fn print_grads(self: Self) void {
            inline for(1..NumLayers) |i| {
                const WeightGradMatrix = Matrix(T, LayerData[i].WeightDimension[0], LayerData[i].WeightDimension[1]); 
                // const wblock = self.model_buffer.grad_buf.get_block(.weight_grad, i);
                // std.debug.print("Layer grad block: {any}\n", .{self.model_buffer.grad_buf.w_offsets[i]});
                const wgrad_slice = self.model_buffer.grad_buf.get_block_slice(.weight_grad, i); // cast slice to array. 
                const block_size: usize = LayerData[i].WeightDimension[0] * LayerData[i].WeightDimension[1];
                const wgrad_arr: [block_size]T = wgrad_slice[0..block_size].*;
                  
                // const wgrad_arr = wgrad_slice[0..block_end].*; 
                const weight_grad: WeightGradMatrix = WeightGradMatrix.from_array(wgrad_arr, Convention); 
                std.debug.print("Layer: {d}\n", .{i});
                std.debug.print("Weight grad array: {any}\n", .{wgrad_arr}); 
                weight_grad.print_matrix("Weight grad");
            }
        }

        /// This would fetch the needed upstream data needed during backward propagation. 
        /// The upstream data is equal to the term: x = (dZ₃ · W₃ᵀ). 
        /// Which is needed to calculate: dZ₂ = (dZ₃ · W₃ᵀ) ⊙ f′(Z₂) ←→ dZ₂ = x ⊙ f′(Z₂).
        /// Remember the propagator dimension is current layer input dim or prior layer output dim. 
        /// So if layer_index = upstream_index (layer_index + 1): return type = Matrix(T, InputDimension[0], InputDimension[1]), 
        /// else: return type = Matrix(T, OutputDimension[0], OutputDimension[1]). 
        fn upstream_matrix(self: *Self, comptime layer_index: usize) Matrix(T, LayerData[layer_index].InputDimension[0], LayerData[layer_index].InputDimension[1]) { 
            const UpstreamLayer = LayerData[layer_index]; // WARN: - Make sure you use the correct dimension depending on the layer_index! 

            // const OutputDimension = UpstreamLayer.OutputDimension; 
            const InputDimension = UpstreamLayer.InputDimension; 
            const ReturnMatrix = Matrix(T, InputDimension[0], InputDimension[1]);
            const BUFSIZE: usize =  InputDimension[0] * InputDimension[1]; 
          
            const element_type = self.model_buffer.single_item.?.element_type; 
            if (element_type == .loss_upstream) {
                std.debug.assert((InputDimension[0] * InputDimension[1]) == self.model_buffer.single_item.?.len); 
            }

            const propagator_slice = self.model_buffer.get_item();
            const stop_index = propagator_slice.len;
            var buffer_array: [BUFSIZE]T = undefined; 
            @memcpy(&buffer_array, propagator_slice[0..stop_index]);

            // std.debug.print("slice items: {any}\nbuffer items: {any}\n", .{propagator_slice, buffer_array});
            const propagator_matrix = ReturnMatrix.from_array(buffer_array, Convention);
            return propagator_matrix; 
        }

        /// The prediction is the same as the feedforward pass.
        pub fn predict_y(self: *Self, input_data: *const InputMatrix) Matrix(T, OutputLayerDimension[0], OutputLayerDimension[1]){
            //WARN: - self.get_layer(i) → returns a runtime value!!! 

            //WARN: - The var output is redundant and not needed since we cache the values. 
            const output_matrix = blk: {
                // This is iterating over the types, not the Layer instances. 
                inline for (LayerData[1..NumLayers], 1..NumLayers) |CurrentLayer, i| {
                    // const prior_layer = self.layers[i - 1];
                    // `OutputMatrix` is a comptime constant field on the Layer type, not a runtime field. 
                    const OutputMatrixType = CurrentLayer.OutputMatrix; 
                    const InputMatrixType = CurrentLayer.InputMatrix; // Prior Output Matrix Shape.
                    var output: OutputMatrixType = undefined;

                    // When we propagate the first hidden layer we take the input data.
                    if (i == 1) {
                        // Z1 → H1 → [B][F] x [F][LayerSize] = [B][LS] → 
                        const first_activation: OutputMatrixType = self.layers[i].feedforward(input_data, &self.hypr_params);
                        output = first_activation; 
                    }else if (i > 1 and i != OutputLayerIndex) {
                        // Z2 → H2 → [B][H1] x [H1][LayerSize] = [B][LS] 
                        if (true) {
                            std.debug.print("Layer: {d} Feedforward - Expected Output Matrix: {any}\n", .{i, OutputMatrixType});


                            // std.debug.print("    \u{2022} Layer Type: {s}\n    \u{2022} Weight Matrix: {}x{}\n    \u{2022} Activation Function: {s}\n    \u{2022} Prior Layer Dimension: {}x{}, ({s} x {s})\n    \u{2022} Expected Output Dimension: {}x{}\n    \u{2022} Input Shape Convention: {s}\n", .{ @tagName(info[0]), WeightDimension[0], WeightDimension[1], @tagName(info[2]), InputDimension[0], InputDimension[1], prior_dim0, prior_dim1, OutputDimension[0], OutputDimension[1], @tagName(Convention)});

                            // std.debug.print("Layer: {d}, OutputMatrixType: {any}, InputMatrixType: {any}\n", .{i, OutputMatrixType, InputMatrixType});
                            // std.debug.print("Prior output: {any}\n", .{@TypeOf(output)});
                            // std.debug.print("Prior Layer type: {any}\n", .{prior_layer}); 
                            // @panic("");
                        }
                        // Here we obtain or get the address of pointer to the prior output or cached activation. 
                        const prior_output: *const InputMatrixType = &self.layers[i - 1].cached_activation.?; 
                        // const prior_output: *const InputMatrixType = &self.layers[i - 1].cached_activation.?; 
                        // const activation_output: OutputMatrixType = self.get_layer(i).feedforward(output, &self.hypr_params);
                        const activation_output: OutputMatrixType = self.layers[i].feedforward(prior_output, &self.hypr_params);
                        output = activation_output; 
                    }else {
                        // Softmax(Z3) → [H2][LayerSize] == [H2][Classes]
                        // const prior_output: *const InputMatrixType = &self.layers[i - 1].cached_activation.?; 
                        const prior_output: *const InputMatrixType = &self.layers[i - 1].cached_activation.?; 
                        const activation_output = self.layers[i].feedforward(prior_output, &self.hypr_params);
                        break :blk activation_output; 
                    } 
                }
            };
            output_matrix.print_matrix("Feedforward Prediction");
            return output_matrix;
        }

        /// This function would calculate the backward pass, by calculating the partial derivative 
        /// of the loss function with respect to the trainable parameters (weights and bias) for each layer.
        /// ----------------------------------------------------
        /// Remember(!): 
        ///     Weight gradient: ∇L = [∂L/∂w₁, ∂L/∂w₂ ... ∂L/∂w]. 
        ///         - Where: ∇_w⁽ᴸ⁾J(W,b) = δᴸaᵀ⁽ᴸ⁻¹⁾
        ///     Bias gradient: ∇L = [∂L/∂b₁, ∂L/∂b₂ ... ∂L/∂b]
        ///         - Where: ∇_b⁽ᴸ⁾J(W,b) = δᴸ 
        /// ----------------------------------------------------
        /// COL-MAJOR:
        /// dz₃ = a₃ - y
        /// dW₃ = dz₃ · a₂ᵀ
        /// --------
        /// dz₂ = (W₃ᵀ·dz₃) ∘ f′(z₂)
        /// dW₂ = dZ₂ · A₁ᵀ 
        /// --------
        /// dz₁ = (W₂ᵀ·dz₂) ∘ f′(z₁)
        /// dW₁ = dz₁ · xᵀ
        /// ROW-MAJOR:
        /// dZ₂ = (dZ₃ · W₃ᵀ) ⊙ f′(Z₂)
        /// dW₂ = A₁ᵀ · dZ₂
        /// db₂ = sum_rows(dZ₂)
        /// ------
        /// dZ₁ = (dZ₂ · W₂ᵀ) ⊙ f′(Z₁)
        /// dW₁ = Xᵀ · dZ₁
        /// db₁ = sum_rows(dZ₁)
        fn backward_pass(self: *Self, y_predict: *const OutputLayerMatrix, y_labels: *const OutputLayerMatrix) !void {
            comptime var layer_index: usize = NumLayers - 1; // Input Layer excluded, layer_index = 3 initially. 
            if (self.layers[layer_index].cached_activation == null) {
                return error.FeedforwardNotRunned;
            }
            // std.debug.print("Size of GradBuffer Weights: {d}\n", .{GradBufferSize[0]});
            // try self.model_buffer.new_buffer(.weight_grad, @sizeOf(T)*GradBufferSize[0]);
            // try self.model_buffer.new_buffer(.bias_grad, @sizeOf(T)*GradBufferSize[1]);
            defer self.model_buffer.deinit(); // This would free the upstream buffer. 

            // inline while (layer_index != 0) : (layer_index -= 1) {
            inline while (layer_index > 0) {
                const upstream_index: usize = layer_index + 1;

                if (comptime layer_index == OutputLayerIndex) {
                    // δ = ∂L/∂Z = Upstream gradient. 
                    // std.debug.print("Layer Index: {d}, Upstream Index: None - At Output Layer\n", .{layer_index});

                    const upstream_propagator = try self.backward_loss(y_predict.*, y_labels.*); 
                   
                    try self.model_buffer.store_item(.loss_upstream, upstream_propagator.flatten_array()[0..]);
                    layer_index -= 1; 
                    // std.debug.print("-----------------------------\n", .{});
                    continue; 
                } 
                
                // If the layer is not the output layer we fetch the upstream (parent) weight matrix, 
                // and fetch the prior loss gradient (∂L/∂Z₃ → ∂L/∂Z₂ → ∂L/∂Z₁). We also return 
                // a reserved amount of memory for the layer gradients. As mutable slices (buffers).  
                const upstream_mat = self.upstream_matrix(upstream_index);
                // const grads = try self.layer_grads(layer_index);

                if (true) {
                    // std.debug.print("Layer Index: {d}, Upstream Index: {d}\n", .{layer_index, layer_index});
                    // std.debug.print("Layer Output Dim: {any}, Upstream Layer: {any}\n", .{LayerData[layer_index].OutputDimension, LayerData[upstream_index].OutputDimension}); 
                }

                // @compileLog("Inside backward pass, upstream dldz: ", upstream.loss); 
                // @compileLog("Inside backward pass, upstream weight: ", upstream.weight.*);  
                // @compileLog("Inside backward pass, cached input: ", upstream.weight.*);  
                const upstream_propagator = try self.layers[layer_index].backward(upstream_mat, &self.hypr_params);  

                try self.model_buffer.store_item(.loss_upstream, upstream_propagator.flatten_array()[0..]);
                layer_index -= 1; 
                // std.debug.print("-----------------------------\n", .{});
            }
        }

        /// Saves model in JSON format.
        /// To save a model architecture, we need to break it down into tagged unions, enums 
        /// such as LayerInfo for each layer. Togheter with additional metadata such as 
        /// numerical size of components in the layer. 
        /// -------------------------------------
        /// 1. First we save each layer in a datastructure of Info.
        /// 2. Next we serialize into string (sequence of u8 bytes) - e.g. JSON format. 
        /// 3. Save trained models weights, biases, hyperparameters and optimizer state. 
        pub fn save_model(self: Self) void {
            _ = self;
        }

        /// Loading a model, would perform the following sequential steps:
        /// Received JSON payload (or custom message protocol) → Deserialize into Layer Objects 
        /// ... → Load trained parameter (weights and biases) to the associated Layer Object. 
        pub fn load_model(self: Self) void {
            _ = self; 
        }

        /// The train function, would run over the provided number of epochs. 
        /// Where one epoch means the model has seen the entire training dataset once, from start to finish.
        /// If batch size is defined, we divide the input data into sub-samples in each iteration. 
        /// Other terminology: 
        /// • Batch Size: Same as a sub-sample of the total number of samples.
        /// •
        /// •
        /// ---------------------
        /// param: `input_data` - Should Load the entire (or optional part of the full dataset for the embedded target) dataset. 
        /// pub fn train(self: *Self, dataset: *const InputMatrix, y_true: *const OutputLayerMatrix, optimizer: OptimizerType) !void{
        pub fn train(self: *Self, comptime NumSamples: usize,  dataset: *DataLoader(T, NumSamples, InputFeatures, OutputLayerSize, Convention).Dataset, optimizer: OptimizerType) !void{
            // DataLoader(comptime T: type, comptime NumSample: usize, comptime FeatureSize: usize, comptime NumClasses: usize, comptime Convention: InputShapeConvention)
            const Epochs = self.hypr_params.epochs; 
            const Alpha = self.hypr_params.alpha; 
            _ = Alpha;
            // std.debug.print("Number of epochs: {d}\n", .{Epochs});
            for (0..Epochs) |epoch| {
                // for (0..BatchSize) |batch_num| {
                if (true) {
                    // const batch = dataset.next_batch(BatchSize);
                    // std.debug.print("State of Dataset: {any}\n", .{dataset});
                    // std.debug.print("State of next batch: {any}\n", .{batch});
                    // @panic("In training loop before fetching batch!");
                }
                std.debug.print("\n---Training Iteration({d})---\n", .{epoch + 1});
                while (dataset.next_batch(BatchSize)) |batch| {
                    // Get feedforward prediction. 
                    const prediction = self.predict_y(&batch.data); // y_predict
                    const loss: T = LossFn.batch_loss(&prediction, &batch.y_true);
                    std.debug.print("Epoch {d}, Batch Loss: {d}\n", .{epoch + 1, loss});
                    try self.backward_pass(&prediction, &batch.y_true); 
                }
                std.debug.print("---End Of Training Iteration({d})---\n", .{epoch + 1});
                _ = optimizer;
            }
        }

    };
}

/// The `ModelBuffer` type, is utilizing a FixedBufferAllocator for targeting embedded hardware,
/// with limited resources. This would handle the cached values used and needed during forward 
/// and backward propagation. 
/// Parameter `BufferSize` is the total available capacity of the FixedBuffer. 
/// It should be at minimum of the layer with the largest memory footprint (Weight matrix, bias, etc...). 
pub fn ModelBuffer(comptime T: type, comptime BufferSize: usize, comptime NumLayers: usize) type {
    return struct {
        const DataType = @TypeOf(T);
        const SizeOfData = @sizeOf(T);
        const Self = @This();

        /// This is the static allocated fixed sized buffer. 
        static_buf: [BufferSize]u8 = undefined,
       
        /// The `cached_buf` is the temporary (slice) data buffer, that we fill → reset → fill → reset. 
        cached_buf: ?CachedBuffer = null, 
       
        /// This buffer represent gradients for the learnable parameters, that is cached during backpropagation.
        /// And freed after each training bach.
        grad_buf: GradientBuffer,

        /// Using `single_item` is for caching one item. E.g., if you want to store one array. 
        single_item: ?SingleItem,
        
        /// This FixedBufferAllocator is allocated on the stack, and has a fixed size defined by arg: `BufferSize`. 
        allocator: std.heap.FixedBufferAllocator, 
        // allocator: std.mem.Allocator, 

        const ElementTarget = enum {
            weight_grad,
            bias_grad,
            upstream,
            weight_upstream,
            loss_upstream,
            activation,
        };

        pub const SingleItem = struct {
            data: []T,
            len: usize,
            element_type: ElementTarget,
        };

        pub const GradientBuffer = struct {
            w: ?CachedBuffer, 
            b: ?CachedBuffer,
            /// The `w_offsets` keep track of the starting index for each block sequence in the cached data buffer. 
            w_offsets: [NumLayers]DataBlock = undefined,
            /// The `b_offsets` keep track of the starting index for each block sequence in the cached data buffer. 
            b_offsets: [NumLayers]DataBlock = undefined,

            pub fn init() GradientBuffer {
                return GradientBuffer{
                    .w = CachedBuffer{.data_buf = undefined},
                    .b = CachedBuffer{.data_buf = undefined},
                }; 
            }
        
            /// Adding a block means we return a reserved slice, of a specific element block range. 
            pub fn add_block(self: *GradientBuffer, comptime element: ElementTarget, comptime layer_index: usize, comptime data_len: usize) ![]T {
                const reserved_slice = blk: {
                    if (element == .weight_grad) {
                        const block = DataBlock{.start_index = self.w.?.next_index, .len = data_len};
                        std.debug.print("Block added: [{any}:{any}]\n", .{block.start_index, block.start_index + block.len});
                        self.w_offsets[layer_index] = block;
                        break :blk try self.w.?.block_slice(block); 
                    }else {
                        const block = DataBlock{.start_index = self.b.?.next_index, .len = data_len};
                        self.b_offsets[layer_index] = block;
                        break :blk try self.b.?.block_slice(block); 
                    } 
                };
                return reserved_slice; 
            }

            pub fn get_block(self: GradientBuffer, comptime element: ElementTarget, comptime layer_index: usize) DataBlock {
                const block: DataBlock = switch (element) {
                    .weight_grad => self.w_offsets[layer_index],
                    .bias_grad => self.b_offsets[layer_index], 
                    else => @compileError("Can only get gradient block for weights or biases for the layer!"),
                };
                return block; 
            }

            /// To extract a comptime-known length from a runtime-known offset,
            /// first extract a new slice from the starting offset, then an array of comptime-known length. 
            /// array = data[data_offset .. data_offset + data_len].*;
            /// array = data[data_offset..][0..data_len].*;
            pub fn get_block_slice(self: GradientBuffer, comptime element: ElementTarget, comptime layer_index: usize) []T {
                const block: DataBlock = self.get_block(element, layer_index);
                const grad_block = if (element == .weight_grad and self.w != null) 
                    self.w.?.data_buf[block.start_index..block.start_index + block.len]
                    // self.w.?.data_buf[block.start_index..][0..block.len]
                else 
                    self.b.?.data_buf[block.start_index..block.start_index + block.len];
                    // self.b.?.data_buf[block.start_index..][0..block.len];
                return grad_block;  
            }
        };
            
        /// The `DataBlock` should keep track of where in a buffer you are. 
        /// Where next read starts and ends in a slice (buffer) sequence of ElementTarget. 
        pub const DataBlock = struct {
            start_index: usize,
            len: usize,
        }; 

        /// Collect the different cached buffer types, such as layer gradient (weight, and bias grads).
        /// These buffer is only temporary during either a forward or backward propagation phase. 
        /// This would act like a circular queue or two-phased buffer, constraint by the `FixedBufferAllocator`. 
        pub const CachedBuffer = struct {
            data_buf: []T, 
            next_index: usize = 0,
            part1_len: usize = 0,
            part2_len: usize = 0,
       
            /// This would instead of using a two-phased data buffer. We instead take a slice of a contionous linear appending buffer. 
            /// By reserving the space needed for the block in the buffer. 
            /// Keeping track off the index offset is done via the `next_index` field. 
            pub fn block_slice(self: *CachedBuffer, block: DataBlock) ![]T {
                if (self.next_index + block.len > self.data_buf.len) {
                    return error.DataBufferIsFull; 
                }
               
                // @memcpy(self.data_buf[self.block.next_index..self.block.next_index + data.len], data);
                const slice = self.data_buf[block.start_index..block.start_index + block.len]; 
                // const slice = self.data_buf[self.next_index..self.next_index + block.len];
                self.next_index += block.len; 
                return slice; 
            }

            // Push new data into the buffer. 
            fn enqueue(self: *CachedBuffer, data: []const T) void {
                const TotalSize = self.part2_len + data.len; 
                std.debug.assert(TotalSize <= self.data_buf.len);
                
                if (self.part1_len == 0 and self.part2_len == 0) {
                    @memcpy(self.data_buf[0..data.len], data); 
                    self.part1_len = data.len; 
                    return; 
                }

                if (self.part1_len != 0 and self.part2_len == 0) {
                    @memcpy(self.data_buf[self.part1_len..self.part1_len + data.len], data); 
                    self.part2_len = data.len;       
                    return; 
                }

                // First copy over the part2 data into the part1 buffer location. 
                @memcpy(self.data_buf[0..self.part2_len], self.data_buf[self.part1_len..self.part1_len + self.part2_len]); 
                // @memcpy(self.data_buf[0..self.part2_len], self.data_buf[self.part1_len..self.part1_len+self.part2_len]); 

                @memcpy(self.data_buf[self.part2_len..self.part2_len + data.len], data); 
                self.part1_len = self.part2_len; 
                self.part2_len = data.len;       
            }

            fn dequeue(self: *CachedBuffer, comptime data_len: usize) [data_len]T {
                std.debug.assert(self.part1_len == data_len); 
                var data_array: [data_len]T = undefined;
                @memcpy(&data_array, self.data_buf[0..data_len]);
                return data_array;  
            }
        }; 

        pub fn init() Self {
            var self = Self{
                // .static_buf = undefined,
                .grad_buf = GradientBuffer.init(),
                .cached_buf = null,
                .single_item = null,
                .allocator = undefined,
            };
            // var fba = std.heap.FixedBufferAllocator.init(&self.static_buf);
            // self.allocator = fba.allocator(); 
            self.allocator = std.heap.FixedBufferAllocator.init(&self.static_buf);
            return self; 
        }

        fn initCachedMatrix(matrix_buffer: []T) void {
            @memset(matrix_buffer, 0.0); 
        }

        /// This method, would add a new buffer and allocate a scoped buffer owned by Self. 
        /// It would try to allocate memory for the shared local `data_buf`.
        pub fn new_buffer(self: *Self, comptime element: ElementTarget, comptime DataSize: usize) !void {
            // When allocating new temporary float data, we use the interface allocator aloc method. 
            // self.weight_matrix = Matrix(T, RowSize, ColumnSize).create(std.mem.zeroes([RowSize][ColumnSize]T));
            switch (element) {
                .weight_grad, => {
                    self.grad_buf.w = .{
                    .data_buf = try self.allocator.allocator().alloc(T, DataSize),
                    .next_index = 0, 
                    .part1_len = 0,
                    .part2_len = 0,
                    };
                    // self.grad_buf.w.?.data_buf = try self.allocator.allocator().alloc(T, wgrad_size);
                    // self.grad_buf.b.?.data_buf = try self.allocator.allocator().alloc(T, bgrad_size);
                },
                .bias_grad, => self.grad_buf.b = .{
                    .data_buf = try self.allocator.allocator().alloc(T, DataSize),
                    .next_index = 0, 
                    .part1_len = 0,
                    .part2_len = 0,
                },
                .upstream, => self.cached_buf.? = .{
                    .data_buf = try self.allocator.allocator().alloc(T, DataSize),
                    .next_index = 0, 
                    .part1_len = 0,
                    .part2_len = 0,
                },
                .loss_upstream, => self.cached_buf.? = .{
                    .data_buf = try self.allocator.allocator().alloc(T, DataSize),
                    .next_index = 0, 
                    .part1_len = 0,
                    .part2_len = 0,
                },
                .weight_upstream, => self.cached_buf.? = .{
                    .data_buf = try self.allocator.allocator().alloc(T, DataSize),
                    .next_index = 0, 
                    .part1_len = 0,
                    .part2_len = 0,
                },
                .activation, => self.cached_buf.? = .{
                    .data_buf = try self.allocator.allocator().alloc(T, DataSize),
                    .next_index = 0, 
                    .part1_len = 0,
                    .part2_len = 0,
                },
            }
        }

        /// Creating a new local buffer, is the same as the `cached_buf`. But is intended to be allocated locally within 
        /// a function scope, as its lifetime. While the `cached_buf` is scoped to the `NNModel` instance. If other parts 
        /// of need to consume the cached data. 
        pub fn create_buf(self: *Self, comptime LocalBufSize: usize) !CachedBuffer {
            return CachedBuffer{
                .data_buf = try self.allocator.allocator().alloc(T, LocalBufSize),
                .part1_len = 0,
                .part2_len = 0,
            };
        }

        pub fn free_buffer(self: *Self, cached_buffer: *CachedBuffer) void {
            cached_buffer.part1_len = 0;
            cached_buffer.part2_len = 0; 
            self.allocator.allocator().free(cached_buffer.*.data_buf);
        }

        // pub fn enqueue_buffer(self: *Self, data: []const T, comptime DataSize: usize) !void {
        //     const NewTotalSize = self.cached_buf.?.part2_len + data.len; 
        //     if (NewTotalSize > self.cached_buf.?.data_buf.len) {
        //         // Check if we can free and resize, based on the max size of the FixedBufferAllocator buffer.
        //         if (NewTotalSize > self.allocator.end_index) {
        //             return error.TotalSizeExceedTheFixedBufferEndIndex;
        //         }else {
        //             const part2_data = self.cached_buf.?.data_buf[self.cached_buf.?.part1_len..self.cached_buf.?.part1_len+self.cached_buf.?.part2_len].*; 
        //             const part2_len = self.cached_buf.?.part2_len; 
        //
        //             self.deinit();
        //             try self.new_buffer(DataSize); 
        //             self.cached_buf.enqueue(part2_data[0..part2_len]); // First enqueue old part2 as part1.
        //             self.cached_buf.enqueue(data); // Then enqueue new data as part2.
        //         }
        //     }else {
        //         self.cached_buf.?.enqueue(data);
        //     }
        // }

        pub fn dequeue_buffer(self: *Self, comptime data_len: usize) ![data_len]T {
            if (self.cached_buf.part1_len == 0){
                return error.NeedToEnqueueFirst; 
            }
            const array_data = self.cached_buf.dequeue(data_len);
            return array_data; 
        }

        /// Storing a new item will just override and free the memory of the old one. Before allocating new space 
        /// for the new item. 
        pub fn store_item(self: *Self, comptime element: ElementTarget, data: []const T) !void {
            if (self.single_item == null) {
                self.single_item = SingleItem{
                    .data = try self.allocator.allocator().alloc(T, data.len),
                    .len = 0,
                    .element_type = element,
                };

            }
            if (self.single_item.?.len > 0 and self.single_item != null) {
                self.allocator.allocator().free(self.single_item.?.data);
            }
            self.single_item.?.data = try self.allocator.allocator().alloc(T, data.len);
            self.single_item.?.element_type = element; 
            self.single_item.?.len = data.len; 

            @memcpy(self.single_item.?.data[0..data.len], data); 
        }

        pub fn get_item(self: *Self) []const T {
            return self.single_item.?.data[0..self.single_item.?.len];
        }

        /// This will free the local layer gradients, and should be called 
        /// whenever we need to reset the gradients. Such as after each training 
        /// iteration. 
        pub fn free_grad(self: *Self) void {
            if (self.grad_buf.w != null) self.allocator.allocator().free(self.grad_buf.w.?.data_buf);
            if (self.grad_buf.b != null) self.allocator.allocator().free(self.grad_buf.b.?.data_buf);
        }
        
        /// Frees locally allocated buffers. 
        pub fn free_cached_buf(self: *Self) void {
            if (self.cached_buf != null) self.allocator.allocator().free(self.cached_buf.?.data_buf); 
            if (self.single_item != null) self.allocator.allocator().free(self.single_item.?.data); 
        }

        pub fn deinit(self: *Self) void {
            self.free_cached_buf(); 
            self.free_grad(); 
            // self.allocator.reset();
        }

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
    input_shape: InputShapeConvention,
    optimizer: OptimizerType,
    learning_rate: f16,
    gamma: f16, 
    dropout_rate: f16,
    /// One epoch means the model has seen the entire training dataset once, from start to finish.
    epochs: usize, 
    epsilon: f16,
    alpha: f16,
};


test "ModelBuilderPredict" {
    // This act as our sequential layer model.
    const InputSize = 2; 
    const BatchSize = 3; 
    const FeatureSize = 2; 
    const H1_SIZE = 3; 
    const H2_SIZE = 2; 
    
    const layers = comptime [_]type{
        // Input X dimension → X(3, 2)
        Layer(f16, 
            LayerInfo{ .input = .{ 
                LayerType.Embedding, 
                LayerDimension{
                    LayerDataShapes{.layer_size = 2}, 
                    LayerDataShapes{.feature_size = InputSize}, 
                    LayerDataShapes{.batch_size = BatchSize }
                } 
            }}, 
            .RowSampleOrdering),
        // H1 → W(2, 3), Z = X*W → (3, 2) * (2, 3) → OUT SIZE = 3 x 3. 
        Layer(f16, 
            LayerInfo{ .hidden = .{ 
                LayerType.Linear, 
                LayerDimension{
                    LayerDataShapes{.layer_size = H1_SIZE}, 
                    LayerDataShapes{.prev_size = FeatureSize}, 
                    LayerDataShapes{.batch_size = BatchSize }
                }, 
                ActivationFunction.LeakyRelu 
            }}, 
            .RowSampleOrdering),
        // H2 → W(FeatureSize, LayerSize) → W(H1, H2) → W(3, 2), Z = X*W → (3 x 3) * (3 x 2) → H2_OUT = 3 x 2. 
        Layer(f16, 
            LayerInfo{ .hidden = .{ 
                LayerType.Linear, 
                LayerDimension{
                    LayerDataShapes{.layer_size = H2_SIZE}, 
                    LayerDataShapes{.prev_size = H1_SIZE}, 
                    LayerDataShapes{.batch_size = BatchSize }
                }, 
                ActivationFunction.LeakyRelu 
            }}, 
            .RowSampleOrdering),
        // OUTPUT LAYER → W(FeatureSize, LayerSize) → W(H2, LayerSize) → W(2, 3), S = X*W → (3 x 2) * (2, 3) → 3 x 3. 
        Layer(f16, 
            LayerInfo{ .output = .{ 
                LayerType.SoftMax, 
                LayerDimension{
                    LayerDataShapes{.layer_size = 3}, 
                    LayerDataShapes{.prev_size = H2_SIZE}, 
                    LayerDataShapes{.batch_size = BatchSize }
                }, 
                LossType.CrossEntropy 
            }}, 
            .RowSampleOrdering),
    };

    const params = HyperParameters{
        .input_size = 2,
        .input_shape = .RowSampleOrdering,
        // .input_samples = 100,
        // .num_features = 10,
        // .hidden_layers = 3,
        .optimizer = OptimizerType.Adam,
        .learning_rate = 0.001,
        .gamma = 0.1,
        .dropout_rate = 0.1,
        .epsilon = 0.01,
        .epochs = 100,
        .alpha = 0.01,
    };

    const FixedBufferSize: usize = 150; 
    // var buffer: [FixedBufferSize]u8 = undefined; 
    // var fba = std.heap.FixedBufferAllocator.init(&buffer); 
    // const allocator = fba.allocator(); 
    var net = NNModel(f16, layers[0..], .RowSampleOrdering, FixedBufferSize).init(params);

    const h1 = net.get_layer(1);
    const h2 = net.get_layer(2);
    const h3 = net.get_layer(3);

    std.debug.print("h1 type: {any}\n", .{@TypeOf(net.get_layer(1))});
    std.debug.print("h1 weights: {any}\nh2 weights: {any}\nh3 weights: {any}\n", .{ h1.weight_matrix, h2.weight_matrix, h3.weight_matrix });
    std.debug.print("h1 bias: {any}\nh2 bias: {any}\nh3 bias: {any}\n", .{ h1.bias_vector, h2.bias_vector, h3.bias_vector });
    
    const dummy_input_rowmajor = [3][2]f16{
        .{ 1.0, 4.0 },
        .{ 2.0, 5.0 },
        .{ 3.0, 6.0 }, 
    };
    const y_true_batch = [3][3]f16{
        .{ 1.0, 0.0, 0.0},
        .{ 0.0, 1.0, 0.0},
        .{ 0.0, 0.0, 1.0},
    }; // as one-hot encoded vector.
    // RowSampleOrdering → X(BatchSize, Features), W(Features, LayerSize), Z(BatchSize, LayerSize) = Input next layer
    
    const y_matrix = Matrix(f16, 3, 3).create(y_true_batch);

    const input_matrix = Matrix(f16, BatchSize, FeatureSize).create(dummy_input_rowmajor); 
    input_matrix.print_matrix("");

    const predictions = net.predict_y(&input_matrix);
    std.debug.print("Running predict_y logic we get the feedforward output matrix: \n", .{}); 
    predictions.print_matrix("");

    const LossObject = LossFunction(f16, LossType.CrossEntropy, 3, BatchSize, InputShapeConvention.RowSampleOrdering);
    const loss = LossObject.batch_loss(&predictions, &y_matrix);
    std.debug.print("Batch Loss: {d}\n", .{loss});
    try net.backward_pass(&predictions, &y_matrix);
    std.debug.print("Atempting to print weight grads below: \n", .{}); 
    // net.print_grads(); 

}

test "TrainingLogic" {
    // const NumSamples = 4; 
    const NumClasses = 2; // Two unique layers.
    const InputSize = 3; 
    const FeatureSize = 3; 
    const BatchSize = 2; 
    const H1_SIZE = 3; 
    const H2_SIZE = 2; 
    
    const layers = comptime [_]type{
        // Input X dimension → X(2, 3) → X(BatchSize, FeatureSize)
        Layer(f16, 
            LayerInfo{ .input = .{ 
                LayerType.Embedding, 
                LayerDimension{
                    LayerDataShapes{.layer_size = 2}, 
                    LayerDataShapes{.feature_size = InputSize}, 
                    LayerDataShapes{.batch_size = BatchSize }
                } 
            }}, 
            .RowSampleOrdering),
        // H1 → W(2, 3), Z = X*W → (2, 3) * (3, 3) → OUT SIZE = 2 x 3. 
        Layer(f16, 
            LayerInfo{ .hidden = .{ 
                LayerType.Linear, 
                LayerDimension{
                    LayerDataShapes{.layer_size = H1_SIZE}, 
                    LayerDataShapes{.prev_size = FeatureSize}, 
                    LayerDataShapes{.batch_size = BatchSize }
                }, 
                ActivationFunction.LeakyRelu 
            }}, 
            .RowSampleOrdering),
        // H2 → W(FeatureSize, LayerSize) → W(H1, H2) → W(3, 2), Z = X*W → (2 x 3) * (3 x 2) → H2_OUT = 2 x 2. 
        Layer(f16, 
            LayerInfo{ .hidden = .{ 
                LayerType.Linear, 
                LayerDimension{
                    LayerDataShapes{.layer_size = H2_SIZE}, 
                    LayerDataShapes{.prev_size = H1_SIZE}, 
                    LayerDataShapes{.batch_size = BatchSize }
                }, 
                ActivationFunction.LeakyRelu 
            }}, 
            .RowSampleOrdering),
        // OUTPUT LAYER → W(FeatureSize, LayerSize) → W(H2, LayerSize) → W(2, 2), S = X*W → (2 x 2) * (2, 2) → 2 x 2. 
        Layer(f16, 
            LayerInfo{ .output = .{ 
                LayerType.SoftMax, 
                LayerDimension{
                    LayerDataShapes{.layer_size = NumClasses}, 
                    LayerDataShapes{.prev_size = H2_SIZE}, 
                    LayerDataShapes{.batch_size = BatchSize }
                }, 
                LossType.CrossEntropy 
            }}, 
            .RowSampleOrdering),
    };

    const params = HyperParameters{
        .input_size = 2,
        .input_shape = .RowSampleOrdering,
        // .input_samples = 100,
        // .num_features = 10,
        .optimizer = OptimizerType.SGD,
        .learning_rate = 0.001,
        .gamma = 0.1,
        .dropout_rate = 0.1,
        .epsilon = 0.01,
        .epochs = 5,
        .alpha = 0.01,
    };

    const FixedBufferSize: usize = 150; 
    var net = NNModel(f16, layers[0..], .RowSampleOrdering, FixedBufferSize).init(params);

    // ***TRAINING TEST CASE***
    // Total samples = 4
    // Batch size = 2
    // Each input has 3 features
    // Each label is one-hot encoded for 2 classes
    const input_data = [_][3]f16{
        // 4 samples with 3 input features each
        [3]f16{ 0.1, 0.2, 0.3 },
        [3]f16{ 0.9, 0.8, 0.7 },
        [3]f16{ 0.4, 0.5, 0.6 },
        [3]f16{ 0.6, 0.5, 0.4 },
    };

    const true_labels = [_][2]f16{
        // One-hot encoded target for 2 classes
        [2]f16{ 1.0, 0.0 }, // Class 0
        [2]f16{ 0.0, 1.0 }, // Class 1
        [2]f16{ 1.0, 0.0 }, // Class 0
        [2]f16{ 0.0, 1.0 }, // Class 1
    }; 
    
    const NumSamples = 2; 
    const NumWordsPerSample = 3; 
    const WordEmbeddingSize = 3; 

    const input_logdata = [NumSamples][NumWordsPerSample][WordEmbeddingSize]f16{
        // 4 samples with 3 input features each
        [_][3]f16{
            [3]f16{ 0.1, 0.2, 0.3 },
            [3]f16{ 0.9, 0.8, 0.7 },
            [3]f16{ 0.4, 0.5, 0.6 },
            [3]f16{ 0.6, 0.5, 0.4 },
        }, 
        [_][3]f16{
            [3]f16{ 0.1, 0.2, 0.3 },
            [3]f16{ 0.9, 0.8, 0.7 },
            [3]f16{ 0.4, 0.5, 0.6 },
            [3]f16{ 0.6, 0.5, 0.4 },
        },
    };

    _ = input_logdata; 
         
    //TODO: - Fix logic to distinguish between number of samples vs batch size. 
    // Where batch size has to be even divisable with number of samples. 
    const num_samples: usize = input_data.len;
    const input_dim = 3; // input_dim = feature size for one sample. 
    const output_dim = 2; // One-hot encoded, for 2 classes. 
    // const batch_size = 2; // Same as a sub-sample of the total num_samples.
    // const num_batches = num_samples / batch_size;
    // const num_epochs = 5; // One epoch means the model has seen the entire training dataset once, from start to finish.

    var training_data = DataLoader(f16, num_samples, input_dim, output_dim, .RowSampleOrdering).Dataset{
        .data = input_data, 
        .true_labels = true_labels,
        .metadata = .{
            .num_samples = num_samples, // Default value = num_samples = NumSample.
            .input_dim = input_dim, // Default value = input_dim = FeatureSize.
            .output_dim = output_dim,
            .num_batches = null,
        }
    };
    // EXPECTED DIMS: 
    // Input X dimension → X(2, 3) → X(BatchSize, FeatureSize)
    // H1 → W(2, 3), Z = X*W → (2, 3) * (3, 3) → OUT SIZE = 2 x 3. 
    // H2 → W(FeatureSize, LayerSize) → W(H1, H2) → W(3, 2), Z = X*W → (2 x 3) * (3 x 2) → H2_OUT = 2 x 2. 
    // OUTPUT LAYER → W(FeatureSize, LayerSize) → W(H2, LayerSize) → W(2, 2), S = X*W → (2 x 2) * (2, 2) → 2 x 2. 
 
    try net.train(num_samples, &training_data, .SGD); 
}

test "MemoryFootprint" {
    const dummy_transposition_mat = [3][3]f16{
        .{ 1.0, 2.0, 3.0},
        .{ 4.0, 5.0, 6.0},
        .{ 7.0, 8.0, 9.0},
    };
    var dummy_transposition =  Matrix(f16, 3, 3).create(dummy_transposition_mat);

    dummy_transposition.print_matrix("");
    dummy_transposition.transpose().print_matrix("");
    dummy_transposition.memory_layout();

    return error.SkipZigTest; 
}



