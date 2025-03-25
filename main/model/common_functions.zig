const std = @import("std");
const math = std.math;
const testing = std.testing;

/// Activation function used in the neural network.
pub const ActivationFunction = enum {
    Sigmoid,
    Relu,
    LeakyRelu,
    SoftMax,

    pub fn execute_fn(self: ActivationFunction, comptime T: type, comptime LayerSize: usize, mut_data: []T, derive_flag: bool, alpha: ?T) [LayerSize]T {
        var activation_array: [LayerSize]T = mut_data[0..LayerSize].*;

        switch (self) {
            .Sigmoid => sigmoid(T, activation_array[0..], derive_flag),
            .Relu => relu(T, activation_array[0..], derive_flag),
            .LeakyRelu => leaky_relu(T, activation_array[0..], alpha.?, derive_flag),
            .SoftMax => softmax(T, LayerSize, activation_array[0..]),
        }
        return activation_array;
    }

    /// The `ReLU` activation function is defined as `ReLU = max(0, x)`.
    /// This pass a modifiable slice and a type parameter such as f16.
    fn relu(comptime T: type, mut_data: []T, derive_flag: bool) void {
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
    fn leaky_relu(comptime T: type, mut_data: []T, alpha: T, derive_flag: bool) void {
        const alpha_val: T = std.math.clamp(alpha, 0.01, 0.3);
        std.debug.print("Provided Leaky ReLu alpha value: {any}\n", .{alpha_val});
        const derive = struct {
            pub fn call(val: T, alpha_value: T) T {
                return if (val > 0) @as(T, 1.0) else alpha_value;
            }
        }.call;

        for (mut_data) |*val| {
            if (derive_flag == true) {
                const x_derive = derive(val.*, alpha_val);
                val.* = x_derive;
            } else {
                const x = val.*;
                const leaky_func: T = ((1 + alpha_val) / @as(T, 2.0)) * x + ((1 - alpha_val) / @as(T, 2.0)) * @abs(x);
                std.debug.print("Provided Leaky ReLu output: {any}\n", .{leaky_func});

                val.* = leaky_func;
            }
        }
    }

    /// The sigmoid function is defined as: `σ(x) = 1 / (1 + exp(-x)) ←→ e^x / (1 + e^x)`.
    fn sigmoid(comptime T: type, mut_data: []T, derive_flag: bool) void {
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
    fn softmax(comptime T: type, comptime N: usize, z: []T) void {
        var exp_vec: @Vector(N, T) = undefined;
        var max_logit: T = 0.0;

        for (z) |logit| {
            if (logit > max_logit) max_logit = logit;
        }

        // Iteration of the K number of classes in the output layer.
        for (z, 0..) |*val, i| {
            exp_vec[i] = @exp(val.* - max_logit); // For stability reasons we sub max_logit.
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
pub fn LossFunction(comptime T: type, comptime loss_type: LossType, comptime OutSize: usize) type {
    return struct {
        const Self = @This();
        const OutputVector = @Vector(OutSize, T);

        // Below is the public common functions that wraps the private loss function types.

        pub fn sum(target_vector: []const T) T {
            const vec: @Vector(OutSize, T) = target_vector[0..].*;
            return @as(T, @reduce(.Add, vec));
        }

        pub fn argmax(target_vector: []const T) usize {
            const index_max = std.mem.indexOfMax(T, target_vector);
            return index_max;
        }

        pub fn get(predict_vec: []const T, y_actual: []const T, derive_flag: bool) ?OutputVector {
            switch (loss_type) {
                .CrossEntropy => return cross_entropy(predict_vec, y_actual, derive_flag),
                .NLL => return null,
                .MSE => return null,
                .CosineSimilarity => return null,
            }
        }

        /// The Cross Entropy loss function is defined as:
        /// J() = -∑y*ln(yhat) or L(a^[L], y).
        /// The `target_vec` represent the dependent variable vector.
        /// E.g., the partial derivative of: ∂L/∂a^[L], means that the dependent variable
        /// is a^[L].
        fn cross_entropy(target_vec: []const T, y_actual: []const T, derive_flag: bool) OutputVector {
            const loss = struct {
                pub fn log_sum(probability_vec: []const T, y_vec: []const T) OutputVector {
                    var loss_vec: OutputVector = undefined;
                    for (0..probability_vec.len) |i| {
                        const loss: T = -(y_vec[i] * @log(probability_vec[i]));
                        loss_vec[i] = loss;
                    }
                    return loss_vec;
                    // return @reduce(.Add, loss_vec);
                }
            }.log_sum;

            //The partial derivative: ∂L(s,y)/∂Z^[L] = ∂L/∂a^[L] * ∂a^[L]/∂Z^[L] = a^[L] - y
            const partial_derivative = struct {
                pub fn derive(var_vec: []const T, y_vec: []const T) OutputVector {
                    var derive_vec: OutputVector = undefined;
                    for (0..var_vec.len) |i| {
                        // const derivative_val: T = -(y_vec[i] / var_vec[i]);
                        const derivative_val: T = var_vec[i] - y_vec[i];
                        derive_vec[i] = derivative_val;
                    }
                    return derive_vec;
                    // return @reduce(.Add, derive_vec);
                }
            }.derive;

            if (derive_flag == true) {
                return partial_derivative(target_vec, y_actual);
            }
            return loss(target_vec, y_actual);
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

        //TODO: - Not done.
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
                .CosineSimilarity => {
                    return cosine_similarity(yhat, y);
                },
            }
        }
    };
}

pub const AnomalyType = enum(u8) {
    err = 0b0000,
    traffic = 0b0001,
    exception = 0b0010,
    latency = 0b0011,
    information = 0b0100,
    resource = 0b0101,
};

test "Activation Function logic validation" {
    const N: usize = 3;
    var mut_array = [_]f16{ 1.3, 3.2, 0.8 }; // logits where the target is the highest valued probability
    std.debug.print("Z logits: {any}\n", .{mut_array});
    const exp_vec = @Vector(N, f16){ @exp(mut_array[0]), @exp(mut_array[1]), @exp(mut_array[2]) };
    const exp_sum_scalar = @reduce(.Add, exp_vec);
    const expected_softmax_vec = @Vector(N, f16){ exp_vec[0] / exp_sum_scalar, exp_vec[1] / exp_sum_scalar, exp_vec[2] / exp_sum_scalar };

    std.debug.print("Exp z vector: {any}\nExp z vector sum: {d}\nExpected softmax vector: {any}\n", .{ exp_vec, exp_sum_scalar, expected_softmax_vec });

    std.debug.print("Before mut_array as pure logits: {any}\n", .{mut_array});
    const ActivationSoftmax = ActivationFunction.SoftMax;
    const activation_out = ActivationSoftmax.execute_fn(f16, N, mut_array[0..], false, null);
    std.debug.print("After applying softmax on mut_array as output probabilites: {any}\n", .{activation_out});

    const softmax_out: [N]f16 = mut_array[0..].*;
    const LossObject = LossFunction(f16, LossType.CrossEntropy, N);
    const y_true = [_]f16{ 0.0, 1.0, 0.0 }; // as one-hot encoded vector.
    const loss_vec = LossObject.cross_entropy(softmax_out[0..], y_true[0..], false);
    std.debug.print("Cross entropy: {any}\n", .{loss_vec});
    // std.math.approxEqAbs(comptime T: type, x: T, y: T, tolerance: T)

}
