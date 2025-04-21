//! Here contain code and functionality for loading a dataset to be used in your model. 
//! It consist of a generic `DataLoader` type, and an internal `Dataset` struct. 
//! The core purpose of this type, is to perform preprocessing, on the `Dataset`. 
//! The `Dataset` can read batch of data, and map array data to `Matrix` type data. 
//! ------------------------------------

const std = @import("std");
const layers = @import("layers.zig"); 
const Matrix = layers.Matrix; 
const InputShapeConvention = layers.InputShapeConvention; 

pub const AnomalyType = enum(u8) {
    err = 0b0000,
    traffic = 0b0001,
    exception = 0b0010,
    latency = 0b0011,
    information = 0b0100,
    resource = 0b0101,
};

pub fn DataLoader(comptime T: type, comptime NumSample: usize, comptime FeatureSize: usize, comptime NumClasses: usize, comptime Convention: InputShapeConvention) type {
    return struct {
        // Represent the raw data before cleaned and pre-processed. 
        input_data: [][]const u8,
        vocabulary: std.AutoHashMap(u16, []const T),
        const Self = @This();
        const DatasetMatrix = if (Convention == .RowSampleOrdering) Matrix(T, NumSample, FeatureSize) else Matrix(T, FeatureSize, NumSample); 

        pub const Metadata = struct {
            num_samples: usize = NumSample,
            /// input_dim = feature size for one sample. 
            input_dim: usize = FeatureSize, 
            /// Same as the number of unique output classes. E.g., One-hot encoding with 
            /// a column size of 2, have two unique classes. 
            output_dim: usize = NumClasses, 
            num_batches: ?usize = null,
        };

        /// Example format for the ground truth (true labels): 
        /// const true_labels = [_][2]f16{
        /// One-hot encoded target for 2 classes
        /// [2]f16{ 1.0, 0.0 }, // Class 0
        /// [2]f16{ 0.0, 1.0 }, // Class 1
        /// [2]f16{ 1.0, 0.0 }, // Class 0
        /// [2]f16{ 0.0, 1.0 }, // Class 1
        /// }; 
        pub const Dataset = struct {
            data: if (Convention == .RowSampleOrdering) [NumSample][FeatureSize]T else [FeatureSize][NumSample]T, 
            true_labels: if (Convention == .RowSampleOrdering) [NumSample][NumClasses]T else [NumClasses][NumSample]T, 
            iter_index: usize = 0, // Same as the next batch index.  
            batch_counter: usize = 0, 
            metadata: Metadata, 

            pub fn as_matrix(self: Dataset) DatasetMatrix {
                return DatasetMatrix.create(self.data); 
            }

            /// This will fetch the next batch from the internal dataset. 
            /// When it reaches the last batch, it will return null. 
            /// As an indicator that it is done processing the batch. 
            /// Hence will reset internal counter and indices to its initial values. 
            /// Recall that the size of the batch is the same as a sub-sample of the total number of samples. 
            pub fn next_batch(self: *Dataset, comptime SizeOfBatch: usize) 
                if (Convention == .RowSampleOrdering) ?struct{data: Matrix(T, SizeOfBatch, FeatureSize), y_true: Matrix(T, SizeOfBatch, NumClasses)}
                else ?struct{data: Matrix(T, FeatureSize, SizeOfBatch), y_true: Matrix(T, NumClasses, SizeOfBatch)}
            {

                // iter 0: 0 >= 2, iter 1: 1 >= 2, iter 2: 2 >= 2 → NULL.
                if (self.metadata.num_batches == null) {
                    self.metadata.num_batches = self.metadata.num_samples / SizeOfBatch;
                }   
                
                const num_batches = self.metadata.num_batches orelse {
                    return null;
                }; 

                // if (self.batch_counter % SizeOfBatch == 0) {
                if (self.iter_index >= num_batches - 1) {
                    self.iter_index = 0; 
                    // self.batch_counter = 0; 
                    return null;
                }

                const Dimension: struct{usize, usize} = if (Convention == .RowSampleOrdering) .{SizeOfBatch, FeatureSize} else .{FeatureSize, SizeOfBatch}; 
                const YDimension: struct{usize, usize} = if (Convention == .RowSampleOrdering) .{SizeOfBatch, NumClasses} else .{NumClasses, SizeOfBatch}; 

                var batch_sample = Matrix(T, Dimension[0], Dimension[1]){
                    .mat = undefined, 
                }; 
                var y_sample = Matrix(T, YDimension[0], YDimension[1]){
                    .mat = undefined, 
                }; 

                // E.g., batch_size = 2 then: iter: 0 → 0 * 2, iter: 1 → 1 * 2, iter: 2 → 2 * 2 = 4
                const batch_index: usize = self.iter_index * SizeOfBatch;  
                const stop_index: usize  = batch_index + SizeOfBatch; // Stop index: batch_index + SizeOfBatch, e.g., iter: 0 → 0 + 2, iter 1 → 2 + 2, iter 2 → 4 + 2. 
                // So [batch_index: stop_index] → iter 1: [0:2], iter 2: [2:4], iter 3: [4: 6] → OK.
                std.debug.assert(stop_index <= self.data.len);
                std.debug.assert(stop_index <= self.true_labels.len);

                // Batch Index: 0 → 2 ... = start_index
                // Iteration Index: 0 → 1 = Batch size = 2.
                // Expected slices: [0..2] → Index 0 and 1 ; [2..4] → Index 2 and 3.
                // std.debug.print("Iteration Index: {d}\n", .{self.iter_index});
                for (batch_index..stop_index) |i| {
                    // std.debug.print("Batch Index: {d}\n", .{batch_index});
                    // std.debug.print("Stop Index: {d}\n", .{stop_index});
                    // std.debug.print("Index: {d}\n", .{i});
                    batch_sample.mat[i] = self.data[i]; 
                    y_sample.mat[i] = self.true_labels[i];
                }
                self.iter_index += 1; 
                self.batch_counter += SizeOfBatch; 

                return .{.data = batch_sample, .y_true = y_sample};
            }

        };

        pub fn init(allocator: std.mem.Allocator, path: []const u8) !Self {
            const log_file = try std.fs.cwd().openFile(path, .{});
            defer log_file.close();

            const log_data = try log_file.readToEndAlloc(allocator, std.math.maxInt(usize));

            var log_list = std.ArrayList([]const u8).init(allocator);
            defer log_list.deinit();

            var sequence_iter = std.mem.splitScalar(u8, log_data, '\n');
            while (sequence_iter.next()) |line| {
                if (line.len != 0) {
                    try log_list.append(line);
                    std.debug.print("Line: {s}\n", .{line});
                }
            }
            const log_seq = try log_list.toOwnedSlice();

            return Self{
                .input_data = log_seq,
                .vocabulary = undefined,
            };
        }

        pub fn input_dimension(self: Self) struct { usize, usize } {
            const nrows = self.input_data[0].len;
            const ncols = self.input_data[0][0..].len;
            return .{ nrows, ncols };
        }

        fn deinit(self: Self) void {
            _ = self;
        }

        /// Here we would tokenize log sections such as: `date`, `severity`, `message`.
        fn tokenize(self: Self) !void {
            std.debug.print("Log Sequences: {}\n", .{self.input_data.len});
            for (self.input_data) |sequence| {
                if (sequence.len == 0) {
                    continue;
                }
                var tokens = std.mem.tokenizeAny(u8, sequence, " ");
                std.debug.print("tokens: {s}\n", .{tokens.buffer});

                // std.ascii.toLower(c: u8)
                while (tokens.next()) |token| {
                    std.debug.print("token: {s}\n", .{token});
                }
                // std.mem.trim(comptime T: type, slice: []const T, values_to_strip: []const T)
            }
        }

        /// Word embedding that reflect the importance of a word in a document,
        /// relative to a collection of documents (corpus).
        fn tf_idf_embedding(self: Self, token: []const u8) !void {
            _ = self;
            _ = token;
        }

        /// This should not return void but should return the preprocessed
        /// word embedding data as a matrix containing N number vector of words.
        pub fn get_embedding_matix() void {}

        /// Perform word embedding using techniques such as `Word2Vec`.
        /// Numerical encoding such that words similar are closer to each other,
        /// in a defined vector space.
        fn word_embedding() !void {}

        /// Involves parsing the log data, by calling e.g., `tokenize`.
        fn preprocess(self: Self) !void {
            // 1. Lowercasing + punctuation stripping
            // 2. Split each sequence log into substrings (words)
            // 3. Recombine substrings into tokens (ngrams)
            // 4. Indexing tokens (unique int value with each token)
            // 5. Transform each sequence log using the index into vector.
            try self.tokenize();
            try word_embedding();
        }
    };
}

