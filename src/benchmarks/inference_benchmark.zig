const std = @import("std");

pub const VectorOperations = struct{
    pub const Operation = enum {
        Add,
        Mul,
        Sub,
    };

    pub fn vec_op(comptime T: type, comptime Cols: usize, op: Operation, arr1: [Cols]T, arr2: [Cols]T) @Vector(Cols, T){
        var row_vector: @Vector(Cols, T) = arr1;
        const other_vector: @Vector(Cols, T) = arr2;
        switch (op) {
            .Add => row_vector += other_vector, // row_vector = row_vector + other_vector.
            .Mul => row_vector *= other_vector,
            .Sub => row_vector -= other_vector, 
        }
        return row_vector;
    }

};

pub fn dummy_test() void{
    const result_vec = VectorOperations.vec_op(u32, 4, .Mul, [_]u32{1, 2, 3, 4}, [_]u32{5, 6, 7, 8});
    std.log.warn("Vector Operation Multiplication Test: {}\n", .{result_vec});
}

pub fn vec_mul() void{
    const result_vec = VectorOperations.vec_op(u32, 4, .Mul, [_]u32{1, 2, 3, 4}, [_]u32{5, 6, 7, 8});
    std.log.warn("Vector Operation Multiplication Test: {}\n", .{result_vec});
}
