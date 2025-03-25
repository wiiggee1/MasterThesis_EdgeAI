const std = @import("std");
const assert = std.debug.assert;

pub const OptimizerType = enum {
    Adam,
    SGD,
};
