//! The root.zig is the root source file (library) for the deep learning model.
//! ------------------------------------
const std = @import("std");
const layers = @import("layers.zig");
const common = @import("common_functions.zig");
const model = @import("model_builder.zig");
const loader = @import("dataloader.zig");
pub const optimizer = @import("optimizer.zig");

/// How to create a sequential layer model: 
/// ```zig 
///
/// const InputSize = 2; 
/// const BatchSize = 3; 
/// const FeatureSize = 2; 
/// const H1_SIZE = 3; 
/// const H2_SIZE = 2; 
///
/// const layers = comptime [_]type{
///     // Input X dimension → X(3, 2)
///     Layer(f16, 
///         LayerInfo{ .input = .{ 
///             LayerType.Embedding, 
///             LayerDimension{
///                 LayerDataShapes{.layer_size = 2}, 
///                 LayerDataShapes{.feature_size = InputSize}, 
///                 LayerDataShapes{.batch_size = BatchSize }
///             } 
///         }}, 
///         .RowSampleOrdering),
///     // H1 → W(2, 3), Z = X*W → (3, 2) * (2, 3) → OUT SIZE = 3 x 3. 
///     Layer(f16, 
///         LayerInfo{ .hidden = .{ 
///             LayerType.Linear, 
///             LayerDimension{
///                 LayerDataShapes{.layer_size = H1_SIZE}, 
///                 LayerDataShapes{.prev_size = FeatureSize}, 
///                 LayerDataShapes{.batch_size = BatchSize }
///             }, 
///             ActivationFunction.LeakyRelu 
///         }}, 
///         .RowSampleOrdering),
///     // H2 → W(FeatureSize, LayerSize) → W(H1, H2) → W(3, 2), Z = X*W → (3 x 3) * (3 x 2) → H2_OUT = 3 x 2. 
///     Layer(f16, 
///         LayerInfo{ .hidden = .{ 
///             LayerType.Linear, 
///             LayerDimension{
///                 LayerDataShapes{.layer_size = H2_SIZE}, 
///                 LayerDataShapes{.prev_size = H1_SIZE}, 
///                 LayerDataShapes{.batch_size = BatchSize }
///             }, 
///             ActivationFunction.LeakyRelu 
///         }}, 
///         .RowSampleOrdering),
///     // OUTPUT LAYER → W(FeatureSize, LayerSize) → W(H2, LayerSize) → W(2, 3), S = X*W → (3 x 2) * (2, 3) → 3 x 3. 
///     Layer(f16, 
///         LayerInfo{ .output = .{ 
///             LayerType.SoftMax, 
///             LayerDimension{
///                 LayerDataShapes{.layer_size = 3}, 
///                 LayerDataShapes{.prev_size = H2_SIZE}, 
///                 LayerDataShapes{.batch_size = BatchSize }
///             }, 
///             LossType.CrossEntropy 
///         }}, 
///         .RowSampleOrdering),
/// };
///
/// const params = HyperParameters{
///     .input_size = 2,
///     .input_shape = .RowSampleOrdering,
///     .input_samples = 100,
///     .num_features = 10,
///     .optimizer = OptimizerType.Adam,
///     .learning_rate = 0.001,
///     .gamma = 0.1,
///     .dropout_rate = 0.1,
///     .epsilon = 0.01,
///     .epochs = 100,
///     .alpha = 0.01,
/// };
///
/// const FixedBufferSize: usize = 150; 
/// // var buffer: [FixedBufferSize]u8 = undefined; 
/// // var fba = std.heap.FixedBufferAllocator.init(&buffer); 
/// // const allocator = fba.allocator(); 
/// var net = NNModel(f16, layers[0..], .RowSampleOrdering, FixedBufferSize).init(params);
/// ```

pub const Layer = layers.Layer;
pub const LayerInfo = layers.LayerInfo; 
pub const DataShapeType = layers.DataShapeType;
pub const InputShapeConvention = layers.InputShapeConvention;
pub const LayerType = layers.LayerType;
pub const LayerDimension = layers.LayerDimension; 
pub const InternalDimension = layers.InternalDimension;
pub const LayerDataShapes = layers.LayerDataShapes;
pub const Matrix = layers.Matrix;
// pub usingnamespace @import("layers.zig"); 

pub const NNModel = model.NNModel;
pub const HyperParameters = model.HyperParameters;
pub const ModelBuffer = model.ModelBuffer; 
pub const DataManager = model.DataManager;

pub const DataLoader = loader.DataLoader; 

pub const LossFunction = common.LossFunction; 
pub const ActivationFunction = common.ActivationFunction; 
pub const LossType = common.LossType; 
pub const AnomalyType = common.AnomalyType; 



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
