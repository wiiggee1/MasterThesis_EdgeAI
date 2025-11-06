//! The model.zig is the root source file (library) for the deep learning model.
//! ------------------------------------
//! How to load a trained model from binary file: 
//! ```zig 
//! const BATCH: usize = 1;
//! const TIMEWINDOW: usize = 25; 
//! const INPUT_FEATURES: usize = 1;
//! const NUM_LAYERS: usize = 4;
//!
//! const ParsedModel = Model.LoadedModel(f32, .{
//!       .batch = BATCH,
//!       .timewindow = TIMEWINDOW,
//!       .layer_count = NUM_LAYERS,
//!       .convention = .RowSampleOrdering,
//!       .path = "assets/model.bin",
//! }),
//!
//! var nn = ParsedModel.init();
//! ```
const model = @This();
const std = @import("std");


pub const layers = @import("layers.zig");
pub const common = @import("common_functions.zig");
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

pub const MatmulFn = layers.MatmulFn;
