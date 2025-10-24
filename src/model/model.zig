//! The model.zig is the root source file (library) for the deep learning model.
//! ------------------------------------
//! How to load a trained model from binary file: 
//! ```zig 
//! const batch_size: usize = 1;
//! const timesteps: usize = 10; 
//! const input_features: usize = 1;
//! const Convention: InputShapeConvention = .RowSampleOrdering;
//! const NUM_LAYERS: usize = 4;
//!
//! const ModelBuilder = Builder(
//!     f32, 
//!     // .binary_blob, 
//!     "assets/model.bin",
//!     Convention,
//! );
//!
//! var model = ModelBuilder.build_model(batch_size, timesteps, NUM_LAYERS);
//! const M = @TypeOf(model); // the parsed model type
//! ```
const model = @This();
const std = @import("std");

pub const layers = @import("layers.zig");
pub const common = @import("common_functions.zig");
pub const model_builder = @import("model_builder.zig");
pub const optimizer = @import("optimizer.zig");
pub const builder = @import("builder.zig");

// pub const Layer = layers.Layer;
pub const LayerV2 = layers.LayerV2;
pub const LayerSettingsV2 = layers.LayerSettingsV2;
pub const print_fn = layers.print_fn;
pub const LayerInfo = layers.LayerInfo; 
pub const DataShapeType = layers.DataShapeType;
pub const InputShapeConvention = layers.InputShapeConvention;
pub const LayerType = layers.LayerType;
pub const LayerDimension = layers.LayerDimension; 
pub const InternalDimension = layers.InternalDimension;
pub const LayerDataShapes = layers.LayerDataShapes;
pub const Matrix = layers.Matrix;
pub const Builder = builder.Builder;
pub const ParsedModelGraph = builder.ParsedModelGraph;
pub const LoadedModel = builder.LoadedModel;

pub const LossFunction = common.LossFunction; 
pub const ActivationFunction = common.ActivationFunction; 
pub const LossType = common.LossType; 
pub const Evaluation = common.Evaluation;


