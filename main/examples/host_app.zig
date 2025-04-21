const std = @import("std");
const nn = @import("nn_model");

const Layer = nn.Layer;
const NNModel = nn.NNModel;
const DataLoader = nn.DataLoader; 
const LayerInfo = nn.LayerInfo; 
const LayerType = nn.LayerType; 
const LayerDimension = nn.LayerDimension; 
const LayerDataShapes = nn.LayerDataShapes; 
const ActivationFunction = nn.ActivationFunction; 
const LossType = nn.LossType; 
const HyperParameters = nn.HyperParameters;
const Matrix = nn.Matrix;
const ModelBuffer = nn.ModelBuffer;
const OptimizerType = nn.optimizer.OptimizerType; 


pub fn main() !void {
    // Run Neural Network Model on the host PC here: 
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
        .optimizer = OptimizerType.SGD,
        .learning_rate = 0.001,
        .gamma = 0.1,
        .dropout_rate = 0.1,
        .epsilon = 0.01,
        .epochs = 5,
        .alpha = 0.01,
    };

    const NumSamples = 2; 
    const NumWordsPerSample = 3;
    const WordEmbeddingSize = 3; 
    const FixedBufferSize: usize = 150; 
    var net = NNModel(f16, layers[0..], .RowSampleOrdering, FixedBufferSize).init(params);

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
    
    const true_labels = [_][2]f16{
        // One-hot encoded target for 2 classes
        [2]f16{ 1.0, 0.0 }, // Class 0
        [2]f16{ 0.0, 1.0 }, // Class 1
        [2]f16{ 1.0, 0.0 }, // Class 0
        [2]f16{ 0.0, 1.0 }, // Class 1
    }; 
         
    const num_samples: usize = input_logdata.len;
    const input_dim = 3; // input_dim = feature size for one sample. 
    const output_dim = 2; // One-hot encoded, for 2 classes. 
    // const batch_size = 2; // Same as a sub-sample of the total num_samples.
    // const num_batches = num_samples / batch_size;
    // const num_epochs = 5; // One epoch means the model has seen the entire training dataset once, from start to finish.

    var training_data = DataLoader(f16, num_samples, input_dim, output_dim, .RowSampleOrdering).Dataset{
        .data = input_logdata, 
        .true_labels = true_labels,
        .metadata = .{
            .num_samples = num_samples, // Default value = num_samples = NumSample.
            .input_dim = input_dim, // Default value = input_dim = FeatureSize.
            .output_dim = output_dim,
            .num_batches = null,
        }
    };
 
    try net.train(num_samples, &training_data, .SGD); 


}
