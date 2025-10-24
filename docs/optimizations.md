### Optimization Profile 

When using different optimization profile, and comparing the size of the firmware binary. 
We got the following result:

| ReleaseFast | ReleaseSmall | ReleaseSafe |  Debug  |
    736kB        16.898kB       907.393kB   905.801kb

#### SIMD Instructions:


#### CLIC vs Loop Iterations:


#### Bottlenecks


#### Memory Optimizations:


### Change the Matrix to use slices instead of owned 2D arrays:

**Old Implementation**: 

```zig
pub fn Matrix(comptime T: type, comptime nrows: usize, comptime ncols: usize) type {
    return struct {
        const Rows = nrows;
        const Cols = ncols;
        pub const Capacity: usize = Rows * Cols;
        const Self = @This();
       
        mat: [Rows][Cols]T = undefined,
        rows: usize = Rows,
        cols: usize = Cols,
        mat_type: MatrixType = if (ncols == 1) MatrixType.ColumnVector else if (nrows == 1) MatrixType.RowVector else MatrixType.Default,

```

**New Implementation**:


