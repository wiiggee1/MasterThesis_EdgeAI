const std = @import("std");
const layers = @import("layers.zig");
const common = @import("common_functions.zig");
const model = @import("model_builder.zig");
const optimizer = @import("optimizer.zig");

test "data manager reading data, tokenize logic and add_layer" {
    const alloc = std.testing.allocator;
    const manager = try model.DataManager(u8).init(alloc, "log_data/log_warn.txt");
    try manager.tokenize();

    const params = model.HyperParameters{
        .input_size = 200,
        .hidden_layers = 3,
        .optimizer = undefined, 
        .learning_rate = 0.001,
        .step_size = 0.0005,
        .epochs = 100,
    };
    var nn = model.NNModel(f16, 4).init(params);
    try nn.add_layer(4, 4, alloc);
    
}
