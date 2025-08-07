const std = @import("std");
const assert = std.debug.assert;
const HyperParameter = @import("model_builder.zig").HyperParameters; 

pub const OptimizerType = enum {
    Adam,
    SGD,
};

// The momentum term proportional to the previous gradients will accumulate 
// and accelerate the optimization in that direction.
// Where the `gamma` hyperparameter is the momentum decay, vₜ₋₁ the previous momentum vector. 
//--------------------
// Formula: vₜ = gamma * vₜ₋₁ + learning_rate * gradient. 
// Updating the trainable param is the same: θ = θ - vₜ. 
pub fn momentum(hypr_param: *HyperParameter, prev_momentum: anytype, grad_mat: anytype) void {
    //scaled_weight_grad.scalar_multiplication(hypr_param.*.learning_rate); // Part: η·∂L/∂W
    const past_momentum_decay = hypr_param.*.gamma * prev_momentum; 
    const momentum_val = past_momentum_decay + grad_mat.scalar_multiplication(hypr_param.*.learning_rate); 
    _ = momentum_val; 
}

/// Adam is an adaptive optimzer that dynamically update the weights and biases. 
/// This optimzer takes the following hyperparameter: 
/// • Step size or learning rate. 
/// • ß1 - Decay rate for momentum (common value is 0.9)
/// • ß2 - Decay rate for squared gradients (common value is 0.999)
/// • ϵ- Small value to prevent division by zero (common value is approx. 1e-8).
/// The original authors of the transformer model used the values: 
/// β1 = 0.9, β2 = 0.98 and ϵ = 10−9.
pub fn adam(hypr_param: *HyperParameter) void {
    _ = hypr_param; 
}
