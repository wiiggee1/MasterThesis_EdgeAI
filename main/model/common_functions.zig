const std = @import("std");
const math = std.math;

/// Activation function used in the neural network.
pub const ActivationFunction = enum {
    Sigmoid, 
    Relu,
    LeakyRelu,
    SoftMax,
    None,

    /// The `ReLU` activation function is defined as `ReLU = max(0, x)`.
    /// This pass a modifiable slice and a type parameter such as f16.
    pub fn relu(comptime T: type, mut_data: []T) void {
        for (mut_data) |*val| {
            const x = val.*;
            const relu_out: T = (x + @abs(x)) / @as(T, 2.0);
            val.* =  relu_out;
        }
        // @memcpy(noalias dest, noalias source)
    }
    
    /// The Leaky ReLU pass an additional `α` parameter for allowing small 
    /// positive gradient. This is because it could help against vanishing gradient,
    /// due to when the data x < 0. By adding a small `alpha` value we address this problem.
    /// The function is defined as: `f(x) = ((1 + α)/2)x + ((1 - α)/2)|x|`. 
    /// Or as: `f(x) = x if x > 0 or αx if x <= 0`. 
    pub fn leaky_relu(comptime T: type, mut_data: []T, alpha: T) void {
        const alpha_val: T = std.math.clamp(alpha, 0.01, 0.3);
        for (mut_data) |*val| {
            const x = val.*;
            const leaky_func: T = ((1 + alpha_val)/@as(T, 2.0)) * x + ((1 - alpha_val)/@as(T, 2.0)) * @abs(x);
            val.* = leaky_func;
        }
    }

    /// The sigmoid function is defined as: `σ(x) = 1 / (1 + exp(-x)) ←→ e^x / (1 + e^x)`.
    pub fn sigmoid(comptime T: type, mut_data: []T) void {
        for (mut_data) |*val| {
            const x = val.*;
            const sigmoid_func: T = 1.0 / (1.0 + @exp(-x)); 
            val.* = sigmoid_func;
        }
    }

    /// The softmax is defined as: σ(z)_i = exp(z_i) / Sum(exp(z_j))
    pub fn softmax(comptime T: type, z: []T) void {
        const n = z.len;
        var exp_arr: [n]T = undefined; 

        // Iteration of the K number of classes in the output layer. 
        for (z, 0..) |*val, i| {
            val.* = @exp(val.*); // z = [exp(z1), exp(z2), ... , exp(zk)]
            exp_arr[i] = @exp(val.*); // Just for testing, dont need both!  
        }
        const exp_vec: @Vector(n, T) = exp_arr;  
        const sum_scalar = @reduce(.Add, exp_vec); // Sum(exp(z_j)) part.  
        const sum_vec: @Vector(exp_vec.len, T) = @splat(sum_scalar);
        const softmax_vector = exp_vec / sum_vec; 
        const softmax_arr: [n]T = softmax_vector; 
        @memcpy(z, softmax_arr[0..z.len]);
    }

    /// To calculate the derivative of softmax we need to utilze the gradient. 
    /// Or the Jacobian matrix, by considering all the partial derivatives of 
    /// the softmax function.
    /// The Kronecker Delta function would return 1 if the row(i) index equal the col (j) index, 
    /// otherwise it'll return zero. Meaning when 1{i == j}, the case when it is not zero, 
    /// are the values on the diagonal of the Jacobian matrix. 
    pub fn softmax_derivative(comptime T: type, s: []T) void {
        const kronecker_delta = struct {
            pub fn call(row_index: usize, col_index: usize) T {
                if (row_index == col_index) @as(T, 1) else @as(T, 0);
            }
        }.call;
        
        const i: usize = undefined; // row index i 

        //TODO: - Calculate and insert into the jacobian row wise. 
        // By iterating the rows using a for loop. 
        for (s, 0..) |*sj, j| {
            _ = sj;
            const delta = kronecker_delta(i, j);
            _ = delta;
        }

        // kronecker_delta(row_index: usize, col_index: usize)
    }
};

pub const LossType = enum {
    /// Cross-Entropy Loss - measure the average number of bits needed to identify an event.
    CrossEntropy,
    /// "Negative Log-Likelihood" (NLL)
    NLL,

    /// "Mean-Squared-Error" (MSE)
    MSE,
    
    CosineSimilarity,
};

/// Loss function used in the neural network model.
/// Defined by: L(ŷᵢ, yᵢ) = loss function. 
pub fn LossFunction(comptime T: type, comptime loss_type: LossType) type {
    return struct {
        const Self = @This();

        /// The Cross Entropy loss function is defined as: 
        /// J() = -∑y*ln(yhat)
        fn cross_entropy(y_hat: T, y: T) T {
            return y - y_hat;
        }
        fn nll(y_hat: T, y: T) T {
            return y - y_hat;
        }
        fn cosine_similarity(y_hat: T, y: T) T {
            //loss = -sum(l2_norm(y) * l2_norm(y_hat))
            return y - y_hat;
        }
        /// The `n` represent output layer size (number of neurons). If we have 
        /// 10 output classes or labels n = 10. 
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
    var mut_array = [_]f16{1, 2, 1};
    const exp_vec = @Vector(3, f16){@exp(mut_array[0]), @exp(mut_array[1]), @exp(mut_array[2])};
    const exp_sum_scalar = @reduce(.Add, exp_vec); 
    const expected_softmax_vec = @Vector(3, f16){exp_vec[0]/exp_sum_scalar, exp_vec[1]/exp_sum_scalar, exp_vec[2]/exp_sum_scalar};

    std.debug.print("Exp z vector: {any}\nExp z vector sum: {d}\nExpected softmax vector: {any}\n", .{exp_vec, exp_sum_scalar, expected_softmax_vec});
   
    std.debug.print("Before mut_array: {any}\n", .{mut_array});
    ActivationFunction.softmax(f16, mut_array[0..]);
    std.debug.print("After applying softmax on mut_array: {any}\n", .{mut_array});

}

