const std = @import("std");
const NUMBER_OF_ITERATIONS = 5;
const LEARNING_RATE = 0.1;

pub const CSV = struct {
    data: [][][]const u8,
    dimension: usize,
    size: usize,
    allocator: std.mem.Allocator,

    pub fn parse(allocator: std.mem.Allocator, filename: []const u8) ! CSV {
        var file = try std.fs.cwd().openFile(filename, .{});
        defer file.close();

        var buffered = std.io.bufferedReader(file.reader());
        var reader = buffered.reader();

        var buffer: [1000]u8 = undefined;
        @memset(buffer[0..], 0);

        _ = try reader.readUntilDelimiterOrEof(&buffer, '\n');
        const dimension = 1 + std.mem.count(u8, &buffer, ",");

        try file.seekTo(0);
        buffered = std.io.bufferedReader(file.reader());
        reader = buffered.reader();

        var size: usize = 0;
        while (try reader.readUntilDelimiterOrEof(&buffer, '\n')) |_| {
            size += 1;
        }

        try file.seekTo(0);
        buffered = std.io.bufferedReader(file.reader());
        reader = buffered.reader();

        const d = try allocator.alloc([][] const u8, size);
        for (d) |*row| {
            row.* = try allocator.alloc([] const u8, dimension);
        }

        var row: usize = 0;
        while (try reader.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
            var it = std.mem.splitScalar(u8, line, ',');
            var column: usize = 0;

            while (it.next()) |x| {
                d[row][column] = try allocator.dupe(u8, x);
                column += 1;
            }

            row += 1;
        }

        return CSV{
            .data = d,
            .dimension = dimension,
            .size = size,
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *const CSV) void {
        for (self.data) |row| {
            for (row) |entry| {
                self.allocator.free(entry);
            }
            self.allocator.free(row);
        }
        self.allocator.free(self.data);
    }

    pub fn get(self: *const CSV, row: usize, column: usize) []const u8 {
        return self.data[row][column];
    }

    pub fn print(self: *const CSV) void {
        for (self.data) |row| {
            for (row) |s| {
                std.debug.print("{s} ", .{s});
            }
            std.debug.print("\n", .{});
        }
    }
};

pub const Matrix = struct {
    data: []f32,
    rows: usize,
    columns: usize,
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator, rows: usize, columns: usize, probe: f32) ! Matrix {
        const d = try allocator.alloc(f32, rows * columns);
        @memset(d[0..], probe);

        return Matrix{
            .data = d,
            .rows = rows,
            .columns = columns,
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *const Matrix) void {
        self.allocator.free(self.data);
    }

    pub fn get(self: *const Matrix, row: usize, column: usize) f32 {
        return self.data[row * self.columns + column];
    }

    pub fn entry(self: *const Matrix, row: usize) []f32 {
        return self.data[row * self.columns .. (row + 1) * self.columns];
    }    

    pub fn set(self: *Matrix, row: usize, column: usize, item: f32) void {
        self.data[row * self.columns + column] = item;
    }

    pub fn print(self: *const Matrix) void {
        for (0..self.rows) |r| {
            for (0..self.columns) |c| {
                std.debug.print("{} ", .{self.get(r, c)});
            }
            std.debug.print("\n", .{});
        }
    }
};

pub fn euclideanDistance(x: []f32, y: []f32) f32 {
    var result: f32 = 0;

    for (0..x.len) |i| {
        result += std.math.pow(f32, x[i] - y[i], 2);
    }

    result = std.math.sqrt(result);
    return result;
}

pub fn OnlineLVQ(clusteringResult: []usize, dataset: *Matrix, numberOfRV: usize) ! void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        _ = gpa.deinit();
    }

    var refVectors = try Matrix.init(allocator, numberOfRV, dataset.columns, 0);
    defer refVectors.deinit();

    var distsFromRV = try allocator.alloc(f32, numberOfRV);
    defer allocator.free(distsFromRV);

    @memset(distsFromRV[0..], 0);

    for (0..refVectors.rows) |rv| {
        const index = std.crypto.random.uintLessThan(usize, dataset.rows);
        @memcpy(refVectors.entry(rv), dataset.entry(index));
    }

    for (0..NUMBER_OF_ITERATIONS) |_| {
        for (0..dataset.rows) |i| {
            for (0..numberOfRV) |j| {
                distsFromRV[j] = euclideanDistance(refVectors.entry(j), dataset.entry(i));
            }
            const chosenCluster = std.sort.argMin(f32, distsFromRV, {}, std.sort.asc(f32)).?; // Huh?

            for (0..refVectors.columns) |j| {
                refVectors.entry(chosenCluster)[j] += LEARNING_RATE * (dataset.entry(i)[j] - refVectors.entry(chosenCluster)[j]);
            }
        }
    }

    for (0..dataset.rows) |i| {
        for (0..numberOfRV) |j| {
            distsFromRV[j] = euclideanDistance(refVectors.entry(j), dataset.entry(i));
        }
        const chosenCluster = std.sort.argMin(f32, distsFromRV, {}, std.sort.asc(f32)).?; // Huh?
        clusteringResult[i] = chosenCluster;
    }
}

test "Euclidean Distance" {
    const allocator = std.testing.allocator;

    const a = try allocator.alloc(f32, 4);
    const b = try allocator.alloc(f32, 4);
    const c = try allocator.alloc(f32, 4);
    const d = try allocator.alloc(f32, 4);

    defer allocator.free(a);
    defer allocator.free(b);
    defer allocator.free(c);
    defer allocator.free(d);

    a[0] = 5.1;
    a[1] = 3.5;
    a[2] = 1.4;
    a[3] = 0.2;

    b[0] = 4.9;
    b[1] = 3.0;
    b[2] = 1.4;
    b[3] = 0.2;

    c[0] = 4.7;
    c[1] = 3.2;
    c[2] = 1.3;
    c[3] = 0.2;

    d[0] = 4.6;
    d[1] = 3.1;
    d[2] = 1.5;
    d[3] = 0.2;

    try std.testing.expectEqual(0.53851640, euclideanDistance(a, b));
    try std.testing.expectEqual(0.50990200, euclideanDistance(a, c));
    try std.testing.expectEqual(0.33166263, euclideanDistance(b, d));
    try std.testing.expectEqual(0.24494903, euclideanDistance(c, d));
}

pub fn main() ! void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        _ = gpa.deinit();
    }

    if (std.os.argv.len != 2) {
        std.debug.print("Wrong number of arguments given: expected 1, got {d}\n", .{std.os.argv.len - 1});
        std.process.exit(1);
    }

    const csv = try CSV.parse(allocator, std.mem.span(std.os.argv[1]));

    var mat = try Matrix.init(allocator, csv.size, csv.dimension, 0);
    defer mat.deinit();

    for (0..mat.rows) |i| {
        for (0..mat.columns) |j| {
            const f = try std.fmt.parseFloat(f32, csv.get(i, j));
            mat.set(i, j, f);
        }
    }
    csv.deinit();

	const result = try allocator.alloc(usize, mat.rows);
	defer allocator.free(result);

	try OnlineLVQ(result, &mat, 2);
	std.debug.print("{any}\n", .{result});
}
