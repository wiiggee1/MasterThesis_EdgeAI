const std = @import("std");
const math = std.math;
const testing = std.testing;
const InputConvention = @import("layers.zig").InputShapeConvention; 
const layers = @import("layers.zig");
const Matrix = layers.Matrix; 
const print_fn = layers.print_fn;

pub const ActivationFuncTag = enum(u8){
    // Empty = 0,
    Sigmoid = 1,
    Relu = 2,
    LeakyRelu = 3,
    SoftMax = 4,

    pub fn fromInt(id: u8) ActivationFuncTag{
        return @enumFromInt(id);
    }
};

/// Activation function used in the neural network.
pub const ActivationFunction = union(ActivationFuncTag) {
    Sigmoid: void,
    Relu: void,
    LeakyRelu: f32,
    SoftMax: void,

    pub fn from(comptime tag: ActivationFuncTag, comptime alpha: ?f32) ActivationFunction{
        return comptime switch (tag) {
            .Sigmoid => ActivationFunction{.Sigmoid = {}},
            .Relu => ActivationFunction{.Relu = {}},
            .LeakyRelu => ActivationFunction{.LeakyRelu = alpha orelse 0.0},
            .SoftMax => ActivationFunction{.SoftMax = {}},
        };
    }

    /// This is the public API for executing any available activation function.
    /// It's executed over vectors, and can be either over row- or column-wise vectors. 
    pub fn execute_fn(self: ActivationFunction, comptime T: type, comptime LayerSize: usize, mut_data: []T, derive_flag: bool) [LayerSize]T {
        var activation_array: [LayerSize]T = mut_data[0..LayerSize].*;

        switch (self) {
            .Sigmoid => sigmoid(T, activation_array[0..], derive_flag),
            .Relu => relu(T, activation_array[0..], derive_flag),
            .LeakyRelu => |alpha| leaky_relu(T, activation_array[0..], alpha, derive_flag),
            .SoftMax => softmax(T, LayerSize, activation_array[0..]),
        }
        return activation_array;
    }

    /// The `ReLU` activation function is defined as `ReLU = max(0, x)`.
    /// This pass a modifiable slice and a type parameter such as f16.
    inline fn relu(comptime T: type, mut_data: []T, derive_flag: bool) void {
        for (mut_data) |*val| {
            const x = val.*;
            if (derive_flag == true) {
                const x_derive = if (x > 0) @as(T, 1) else 0;
                val.* = x_derive;
            } else {
                const relu_out: T = (x + @abs(x)) / @as(T, 2);
                val.* = relu_out;
            }
        }
    }

    /// The Leaky ReLU pass an additional `α` parameter for allowing small
    /// positive gradient. This is because it could help against vanishing gradient,
    /// due to when the data x < 0. By adding a small `alpha` value we address this problem.
    /// The function is defined as: `f(x) = ((1 + α)/2)x + ((1 - α)/2)|x|`.
    /// Or as: `f(x) = x if x > 0 or αx if x <= 0`.
    inline fn leaky_relu(comptime T: type, mut_data: []T, alpha: T, derive_flag: bool) void {
        // const alpha_val: T = std.math.clamp(alpha, 0.01, 0.3);
        // std.debug.print("Alpha value in leaky_relu: {d}\n", .{alpha_val});

        const derive = struct {
            pub fn call(val: T, alpha_value: T) T {
                return if (val > 0) @as(T, 1.0) else alpha_value;
            }
        }.call;

        for (mut_data) |*val| {
            if (derive_flag == true) {
                // const x_derive = derive(val.*, alpha_val);
                const x_derive = derive(val.*, alpha);
                val.* = x_derive;
            } else {
                const x = val.*;
                // const leaky_func: T = ((1 + alpha_val) / @as(T, 2.0)) * x + ((1 - alpha_val) / @as(T, 2.0)) * @abs(x);
                const leaky_func: T = ((1 + alpha) / @as(T, 2.0)) * x + ((1 - alpha) / @as(T, 2.0)) * @abs(x);
                // std.debug.print("Provided Leaky ReLu output: {any}\n", .{leaky_func});

                val.* = leaky_func;
            }
        }
    }

    /// The sigmoid function is defined as: `σ(x) = 1 / (1 + exp(-x)) ←→ e^x / (1 + e^x)`.
    inline fn sigmoid(comptime T: type, mut_data: []T, derive_flag: bool) void {
        for (mut_data) |*val| {
            const x = val.*;
            const sigmoid_func: T = 1.0 / (1.0 + @exp(-x));
            if (derive_flag == true) {
                val.* = sigmoid_func * (1.0 - sigmoid_func);
            } else {
                val.* = sigmoid_func;
            }
        }
    }

    /// The softmax is defined as: σ(z)_i = exp(z_i) / Sum(exp(z_j))
    inline fn softmax(comptime T: type, comptime N: usize, z: []T) void {
        var exp_vec: @Vector(N, T) = undefined;
        // var max_logit: T = 0.0;
        // const now = std.time.microTimestamp(); 
        const z_vec: @Vector(N, T) = z[0..N].*;
        const max_z = @reduce(.Max, z_vec);
        // const end = std.time.microTimestamp(); 

        // Iteration of the K number of classes in the output layer.
        for (z, 0..) |*val, i| {
            exp_vec[i] = @exp(val.* - max_z); // For stability reasons we sub max_logit.
        }

        const sum_scalar = @reduce(.Add, exp_vec); // Sum(exp(z_j)) part.
        const sum_vec: @Vector(N, T) = @splat(sum_scalar);
        const softmax_vector = exp_vec / sum_vec;

        const softmax_arr: [N]T = softmax_vector;
        @memcpy(z, softmax_arr[0..z.len]);
    }

    /// To calculate the derivative of softmax we need to utilze the gradient.
    /// Or the Jacobian matrix, by considering all the partial derivatives of
    /// the softmax function.
    /// The Kronecker Delta function would return 1 if the row(i) index equal the col (j) index,
    /// otherwise it'll return zero. Meaning when 1{i == j}, the case when it is not zero,
    /// are the values on the diagonal of the Jacobian matrix.
    /// -------------------------------------------------------
    /// Softmax derivative: ∂a^[L]/∂Z^[L] = a_i^[L](1 - a_i^[L]) if i = j, otherwise -a_i^[L] * a_j^[L].
    /// In other words:
    /// out[i][j] = p_i * (1 - p_i) , if i == j, else:
    /// out[i][j] = -p_i * p_j;
    pub fn softmax_derivative(comptime T: type, s: []const T, comptime RowLength: usize) [RowLength][RowLength]T {
        var jacobian_softmax: [RowLength][RowLength]T = undefined;

        const kronecker_delta = struct {
            pub fn call(row_index: usize, col_index: usize) T {
                if (row_index == col_index) @as(T, 1) else @as(T, 0);
            }
        }.call;

        for (0..RowLength) |i| {
            // Iterate columns in the provided `row_i` index.
            // Where `s` is a slice that points to the row elements in a matrix (Jacobian Matrix).
            var jacobian_row: [RowLength]T = undefined;
            for (s, 0..) |sj, j| {
                const delta = kronecker_delta(i, j);
                const element_ij = s[i] * (delta - sj);
                jacobian_row[j] = element_ij;
            }
            jacobian_softmax[i] = jacobian_row; // insert row-wise
        }
        return jacobian_softmax;
    }
};

pub fn Evaluation(comptime T: type, comptime TimeW: usize) type{
    return struct {

        pub const MetricScores = struct {
            mse: T,
            cos_similarity: T,
            cos_distance: T,
            anomaly_score: T,
        };

        pub fn mse_window(x: *const Matrix(T, TimeW, 1), y: *const Matrix(T, TimeW, 1)) T{
            comptime {
                if(@typeInfo(T) != .float){
                    @compileError("Expected a floating point type!");
                }
            }

            var accumulated_val: T = 0;
            inline for (0..TimeW) |t| {
                const err = y.mat[t][0] - x.mat[t][0];
                accumulated_val += err * err;
            }
            const denominator: T = @as(T, @floatFromInt(TimeW));
            return accumulated_val / denominator;
        }

        // pub fn mean(x: *const Matrix(T, TimeW, 1))

        /// (A * B) / (||A|| * ||B||)
        /// Where ||A|| = magnitude of A = sqrt(x1^2 + x2^2 + ... xn^2) = sqrt(x * x)
        pub fn cosine_similarity_score(x: *const Matrix(T, TimeW, 1), y: *const Matrix(T, TimeW, 1)) T{
            comptime {
                if(@typeInfo(T) != .float){
                    @compileError("Expected a floating point type!");
                }
            }

            var dot_xy: T = 0; // x * y → dot product
            var sum_x: T = 0; // x * x → dot product 
            var sum_y: T = 0; // y * y → dot product

            inline for(0..TimeW) |t|{
                sum_x += x.mat[t][0] * x.mat[t][0]; 
                sum_y += y.mat[t][0] * y.mat[t][0];
                dot_xy += x.mat[t][0] * y.mat[t][0];
            }
            const bits = @typeInfo(T).float.bits;
            const eps: T = if (bits <= 16) @as(T, 1e-3)
                else if (bits <= 32) @as(T, 1e-8)
                else @as(T, 1e-12);

            const euclidean_norm_x: T = @sqrt(sum_x); // ||X||
            const euclidean_norm_y: T = @sqrt(sum_y); // ||Y||
            const magnitude_xy: T = (euclidean_norm_x * euclidean_norm_y) + eps;
            
            return (dot_xy) / (magnitude_xy);
        }

        /// The weighted anomaly score, is a weighted score by combining several 
        /// different metrics. E.g., anom_score = 0.7 * MSE + 0.3 * (1 − cosine_similarity)
        pub fn weighted_score(mse: T, cosine_dist: T) T{
            return (0.7 * mse) + (0.3 * cosine_dist);
        }

        pub fn is_anomaly(score_val: f32, thr: f32, num_trigger: *usize, comptime exceed_amount: usize) bool {
            if (score_val > thr) {
                num_trigger.* += 1;
            } else {
                num_trigger.* = 0;
            }
            return num_trigger.* >= exceed_amount;
        }

        pub fn evaluation(x: *const Matrix(T, TimeW, 1), y: *const Matrix(T, TimeW, 1)) MetricScores{
            const err = mse_window(x, y);
            const cosine_sim_score = cosine_similarity_score(x, y);
            const cosine_distance = @as(T, 1) - cosine_sim_score;
            const anomaly_score = weighted_score(err, cosine_distance);

            const z_score = struct {
                pub fn standardization(score: T, mean: T, stdd: T) T {
                    return (score - mean) / stdd; 
                }
            }.standardization;
            _ = z_score;
            
            // std.debug.print("Evaluation Metrics:\n\tMSE: {d}\n\tCosine Similarity Score: {d}\n\tCosine Distance: {d}\n\tWeighted Anomaly Score: {d}\n", .{
            //     err,
            //     cosine_sim_score,
            //     cosine_distance,
            //     anomaly_score,
            // });

            return MetricScores{
                .mse = err,
                .cos_similarity = cosine_sim_score,
                .cos_distance = cosine_distance,
                .anomaly_score = anomaly_score,
            };
        }
    }; 
}

pub const LossType = enum {
    /// Cross-Entropy Loss - measure the average number of bits needed to identify an event.
    CrossEntropy,
    /// "Negative Log-Likelihood" (NLL)
    NLL,
    /// "Mean-Squared-Error" (MSE)
    MSE,
    /// "Cosine Similarity"
    CosineSimilarity,
};

/// Loss function used in the neural network model.
/// Defined by: L(ŷᵢ, yᵢ) = loss function.
/// `OutSize` is the same as number of classes in the output layer.
/// When `BatchSize` is greater than 1, we compute the average loss, of shape (1, BatchSize). 
pub fn LossFunction(comptime T: type, comptime loss_type: LossType, comptime OutSize: usize, comptime BatchSize: usize, comptime Convention: InputConvention) type {
    return struct {
        const Self = @This();
        const OutputVector = @Vector(OutSize, T);
        const OutputMatrix = if (Convention == .RowSampleOrdering) Matrix(T, BatchSize, OutSize) else Matrix(T, OutSize, BatchSize);
        const OutputMatrixDim = if (Convention == .RowSampleOrdering) .{BatchSize, OutSize} else .{OutSize,  BatchSize};
        const Batches = BatchSize; 
        const BatchLoss = if (BatchSize > 1) OutputVector else T; 
        
        // Below is the public common functions that wraps the private loss function types.

        pub fn sum(target_vector: []const T) T {
            const vec: @Vector(OutSize, T) = target_vector[0..].*;
            return @as(T, @reduce(.Add, vec));
        }

        pub fn argmax(target_vector: []const T) usize {
            const index_max = std.mem.indexOfMax(T, target_vector);
            return index_max;
        }


        pub fn get(predict_vec: []const T, y_actual: []const T, derive_flag: bool) ?T {
            std.debug.assert(y_actual.len == predict_vec.len); 
            switch (loss_type) {
                .CrossEntropy => {
                    // if (BatchSize > 1) batch_loss(batch_matrix: OutputMatrix, y_matrix: OutputMatrix)
                    return cross_entropy(predict_vec, y_actual, derive_flag);
                },
                .NLL => return null,
                .MSE => return null,
                .CosineSimilarity => return null,
            }
        }

        /// Recall that gradient is applied over the sample. 
        /// So if we have a batch size > 1, we accumulate (or average) gradients over all  
        /// samples in the batch. 
        pub fn get_grad(predict_mat: OutputMatrix, y_matrix: OutputMatrix) OutputMatrix {
            var derive_mat: OutputMatrix = Matrix(T, OutputMatrixDim[0], OutputMatrixDim[1]){
                .mat_type = .Default,
                .mat = undefined, 
                .rows = OutputMatrixDim[0],
                .cols = OutputMatrixDim[1],
            }; 
            // Call row or col-wise, CrossEntropy derivative here as: 
            // derive_vec[i] = predict_vec[i] - y_vec[i]; 
            //TODO: - Need to distinguish between BatchSize and SampleSize. 
            for (0..BatchSize) |batch| {
                // Sample wise grad calculation:
                const pred_vec = if (Convention == .ColumnFeatureOrdering) 
                    predict_mat.get_colvec(batch)
                else 
                    predict_mat.mat[batch]; 
               
                const y_vec = if (Convention == .ColumnFeatureOrdering)
                    y_matrix.get_colvec(batch)
                else 
                    y_matrix.mat[batch];

                const grad = crossentropy_derive(pred_vec[0..], y_vec[0..]);

                if (Convention == .ColumnFeatureOrdering) {
                    derive_mat.set_colvec(batch, grad); 
                }else {
                    // Row-Major, row-wise operations.
                    // @memcpy(&derive_mat.mat[batch], grad);
                    derive_mat.mat[batch] = grad; 
                }
            }
            // derive_mat.print_matrix("Derive Matrix");
            return derive_mat; 
        }

        //TODO: - show the actual predicted label via decoding the one-hot class to its actual label. E.g., enum (Anomaly type) → One Hot.

        /// This should based on the matrix or row vector of predicted probability value,
        /// return the argmax index for the element with the largest probability. 
        pub fn get_prediction_label(batch_matrix: *const OutputMatrix, y_matrix: *const OutputMatrix) void {
            _ = batch_matrix; 
            _ = y_matrix; 
        }
        
        pub fn average_batchloss(batch_losses: @Vector(BatchSize, T)) T{
            const scalar_multiplier: T = 1.0 / @as(T, BatchSize);
            const batch_sum = @as(T, @reduce(.Add, batch_losses));
            const batch_avg_loss: T = scalar_multiplier * batch_sum; 
            return batch_avg_loss; 
        }

        /// When number of batches are more than 1. Then we calcluate the column-wise loss 
        /// for each of the batches, if Column-Major convention. Or row-wise loss if Row-Major convention. 
        /// //TODO: - Need to distinguish between BatchSize and SampleSize. 
        ///         Where a log sample = 2D array = Matrix(T, SampleSize, EmbeddingSize). 
        pub fn batch_loss(batch_matrix: *const OutputMatrix, y_matrix: *const OutputMatrix) T {
            // var losses_arr: [OutSize]T = undefined; 
            var losses_arr: @Vector(BatchSize, T) = undefined; 
            if (BatchSize > 1){
                // When number of batches / columns are more than 1. Then we calcluate the column-wise loss 
                // for each of the batches. 
                for (0..BatchSize) |batch| {
                    const y_batch = if (Convention == .ColumnFeatureOrdering)
                        y_matrix.*.get_colvec(batch)
                    else 
                        y_matrix.*.mat[batch];
                
                    const batch_probs = if (Convention == .ColumnFeatureOrdering) 
                        batch_matrix.*.get_colvec(batch)
                    else 
                        batch_matrix.*.mat[batch]; 
                
                    const sample_loss = get(batch_probs[0..], y_batch[0..], false);
                    losses_arr[batch] = sample_loss.?; 
                }
            }
            return average_batchloss(losses_arr);
        }

        /// The error should be able to return different output types depending on different cases. 
        /// For instance, when `BatchSize` is less than one, we either return a `scalar` or `vector`
        /// loss value(s). E.g., the mean loss is a scalar value.  
        pub const LossOutputType = union(enum){
            scalar: T, 
            vector: OutputVector,
        }; 

        /// The Cross Entropy loss function is defined as:
        /// J() = -∑y*ln(yhat) or L(a^[L], y).
        /// The `target_vec` represent the dependent variable vector.
        /// E.g., the partial derivative of: ∂L/∂a^[L], means that the dependent variable
        /// is a^[L].
        /// If we have a batch size > 1, we divide the accumulated loss by the number of batches. 
        /// The actual true values of the Y Vector / Matrix, Y is represented as a One-Hot Vector,
        /// that could either be 0 or 1. Meaning if we take the argmax(Y) = Index of 1, then scalar 
        /// multiply with the -log(prediction[argmax_index]). 
        fn cross_entropy(target_vec: []const T, y_actual: []const T, derive_flag: bool) T {
            const loss = struct {
                pub fn log_sum(probability_vec: []const T, y_vec: []const T) T {
                    // var loss_vec: OutputVector = undefined;
                    const idx = argmax(y_vec); 
                    const loss_scalar: T = -@log(probability_vec[idx]);
                   
                    // for (0..probability_vec.len) |i| {
                    //     const loss: T = -(y_vec[i] * @log(probability_vec[i]));
                    //     loss_vec[i] = loss;
                    // }

                    // return loss_vec;
                    // Compute the mean loss across batches...
                    return loss_scalar; 
                }
            }.log_sum;
            _ = derive_flag; 

            return loss(target_vec, y_actual);
        }

        ///The partial derivative: ∂L(s,y)/∂Z^[L] = ∂L/∂a^[L] * ∂a^[L]/∂Z^[L] = a^[L] - y
        pub fn crossentropy_derive(target_vec: []const T, y_actual: []const T) OutputVector {
            const partial_derivative = struct {
                pub fn derive(pred_vec: []const T, y_vec: []const T) OutputVector {
                    var derive_vec: OutputVector = undefined;
                    for (0..pred_vec.len) |i| {
                        // const derivative_val: T = -(y_vec[i] / var_vec[i]);
                        const derivative_val: T = pred_vec[i] - y_vec[i];
                        derive_vec[i] = derivative_val;
                    }
                    return derive_vec;
                    // return @reduce(.Add, derive_vec);
                }
            }.derive;
            return partial_derivative(target_vec, y_actual); 
        }

        /// This would return the acumulated or total loss.
        /// In other words, it will return the sum of the loss vector for all the classes.
        fn ce_loss(target_vec: []const T, y_actual: []const T, derive_flag: bool) T {
            const losses: OutputVector = cross_entropy(target_vec, y_actual, derive_flag);
            return @reduce(.Add, losses);
        }

        //TODO: - Not implemented.
        fn nll(y_hat: T, y: T) T {
            return y - y_hat;
        }

        //TODO: - Not implemented.
        fn cosine_similarity(y_hat: T, y: T) T {
            //loss = -sum(l2_norm(y) * l2_norm(y_hat))
            return y - y_hat;
        }

        fn mse(yhat: T, y: T, n: ?T) T {
            const err: T = y - yhat;
            if (n != null) {
                return @divExact(1.0, n.?) * std.math.pow(T, err, 2);
            }

            return @divExact(1.0, 2.0) * std.math.pow(T, err, 2);
        }

        fn calculate_loss(self: Self, yhat: T, y: T) T {
            _ = self;
            switch (loss_type) {
                .CrossEntropy => {
                    return cross_entropy(yhat, y);
                },
                .NLL => {
                    return nll(yhat, y);
                },
                // .MSE => return mse(yhat, y),
                .CosineSimilarity => {
                    return cosine_similarity(yhat, y);
                },
            }
        }
    };
}

test "Activation Function logic validation" {
    const N: usize = 3;
    var mut_array = [_]f16{ 1.3, 3.2, 0.8 }; // logits where the target is the highest valued probability
    std.debug.print("Z logits: {any}\n", .{mut_array});
    const exp_vec = @Vector(N, f16){ @exp(mut_array[0]), @exp(mut_array[1]), @exp(mut_array[2]) };
    const exp_sum_scalar = @reduce(.Add, exp_vec);
    const expected_softmax_vec = @Vector(N, f16){ exp_vec[0] / exp_sum_scalar, exp_vec[1] / exp_sum_scalar, exp_vec[2] / exp_sum_scalar };

    std.debug.print("Exp z vector: {any}\nExp z vector sum: {d}\nExpected softmax vector: {any}\n", .{ exp_vec, exp_sum_scalar, expected_softmax_vec });

    std.debug.print("Before mut_array as pure logits: {any}\n", .{mut_array});
    // const ActivationSoftmax = ActivationFunction.SoftMax;
    // const activation_out = ActivationSoftmax.execute_fn(f16, N, mut_array[0..], false, null);

    const softmax_out: [N]f16 = mut_array[0..].*;
    const LossObject = LossFunction(f16, LossType.CrossEntropy, N, 1, InputConvention.ColumnFeatureOrdering);
    const y_true = [_]f16{ 0.0, 1.0, 0.0 }; // as one-hot encoded vector.
    const loss_vec = LossObject.cross_entropy(softmax_out[0..], y_true[0..], false);
    std.debug.print("Cross entropy: {any}\n", .{loss_vec});
    // std.math.approxEqAbs(comptime T: type, x: T, y: T, tolerance: T)

}

test "LossTest" {

    // General Information: 
    //
    // Row-Major Ordering: 
    //  → Y_TRUE = (BatchSize x NumberOfClasses) ←→ (BatchSize x OutputLayerSize)
    //  → LOSS_OUTPUT = (BatchSize, 1) → Reduced to a scalar loss value → 1 / BatchSize. 
    //
    // Column-Major Ordering: 
    //  → Y_TRUE = (NumberOfClasses, BatchSize) ←→ (OutputLayerSize, BatchSize)
    //  → LOSS_OUTPUT = (1, BatchSize) → Reduced to a scalar loss value → 1 / BatchSize. 

    // const BatchSize: usize = 3;
    // const InputSize: usize = 2;
    // const FeatureSize: usize = 2; 

    // const LossObject = LossFunction(f16, LossType.CrossEntropy, 3, BatchSize, InputConvention.ColumnFeatureOrdering);
    // const y_true = [_]f16{ 0.0, 1.0, 0.0 }; // as one-hot encoded vector.
    // const y_true_batch = [3][3]f16{
    //     .{ 1.0, 0.0, 0.0},
    //     .{ 0.0, 1.0, 0.0},
    //     .{ 0.0, 0.0, 1.0},
    // }; // as one-hot encoded vector.

    // const y_matrix = Matrix(f16, 3, 3).create(y_true_batch); // Must match the Softmax output dimension.  
    // std.debug.print("Y Matrix as One-Hot Encoding: \n", .{});
    // y_matrix.print_matrix("", .debug_print); 
    
    // const dummy_probs = Matrix(f16, 3, 3).create([3][3]f16{
    //     .{0.7188, 0.81, 0.877},
    //     .{0.0828, 0.04846, 0.0271},
    //     .{0.1987, 0.1414, 0.0961},
    // });

    // var batch_predictions: [BatchSize]f16 = undefined;  
    // var batch_losses: @Vector(BatchSize, f16) = undefined;  
    // const batch_scalar: f16 = 1.0 / @as(f16, BatchSize); 
    // if (BatchSize > 1){
    //     for (0..BatchSize) |batch| {
            // const batch_probs = dummy_probs.get_colvec(batch);
            // batch_predictions = batch_probs; 
            // const batch_losses_vec = LossObject.get(batch_probs[0..], y_true_batch[batch][0..], false);
            // const losses_arr: [BatchSize]f16 = batch_losses_vec.?; 
            // const argmax = LossObject.argmax(losses_arr[0..]);
            // const batch_loss = losses_arr[argmax];
            // batch_losses[batch] = batch_loss;  
            //
            // std.debug.print("Batch {d}, loss: {d}\n", .{batch, batch_loss}); 
            // std.debug.print("Softmax probabilities: {any}\nCross entropy loss: {any}\n", .{batch_predictions, batch_losses });
        // }

        // const batch_sum = @reduce(.Add, batch_losses); 
        // const batch_avg_loss = batch_scalar * batch_sum; 
        // std.debug.print("Batch Loss Vector: {any}\n", .{batch_losses}); 
        // std.debug.print("Average Batch Loss: {d}\n", .{batch_avg_loss});
    // }
}
