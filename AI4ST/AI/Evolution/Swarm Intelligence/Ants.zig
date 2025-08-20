const std = @import("std");

const NUMBER_OF_ITERATIONS = 1000;
const PHEROMONE_DECAY_RATE = 0.1;
const PHEROMONE_DECAY = 5;
const PHEROMONE_INITIAL_VALUE = 1.0;
const SCALE_FACTOR = 1.0;

pub const Permutation = struct {
    data: []usize,
    len: usize,
    fitness: f32,
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator, length: usize, matrix: *const Matrix) ! Permutation {
        const d = try allocator.alloc(usize, length);
        for (0..length) |i| {
            d[i] = i;
        }

        var p = Permutation{.data = d, .len = length, .fitness = 0, .allocator = allocator,};
        p.fitness = computeFitness(&d, matrix);

        return p;
    }

    pub fn deinit(self: *const Permutation) void {
        self.allocator.free(self.data);
    }

    pub fn print(self: *const Permutation) void {
        std.debug.print("Content: ", .{});
        for (0..self.len) |i| {
            std.debug.print("{} ", .{self.data[i]});
        }
        std.debug.print("\nFitness: {}\n", .{SCALE_FACTOR / self.fitness});
    }

    pub fn computeFitness(target: *const [] usize, matrix: *const Matrix) f32 {
        var f = matrix.get(target.*[0], target.*[target.len - 1]);

        for (0..target.len - 1) |i| {
            f += matrix.get(target.*[i], target.*[i + 1]);
        }

        f = SCALE_FACTOR / f;
        return f;
    }
};

pub const Matrix = struct {
    data: []f32,
    dim: usize,
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator, dimension: usize, probe: f32) ! Matrix {
        const d = try allocator.alloc(f32, dimension * dimension);
        @memset(d[0..], probe);

        return Matrix{
            .data = d,
            .dim = dimension,
            .allocator = allocator,
        };
    }

    pub fn deinit(self: *const Matrix) void {
        self.allocator.free(self.data);
    }

    pub fn get(self: *const Matrix, row: usize, column: usize) f32 {
        return self.data[row * self.dim + column];
    }

    pub fn set(self: *Matrix, row: usize, column: usize, item: f32) void {
        self.data[row * self.dim + column] = item;
    }

    pub fn scalarMul(self: *Matrix, scalar: f32) void {
        for (0..self.data.len) |i| {
            self.data[i] *= scalar;
        }
    }

    pub fn print(self: *const Matrix) void {
        for (0..self.dim) |r| {
            std.debug.print("{d}: ", .{r});
            for (0..self.dim) |c| {
                std.debug.print("{} ", .{self.get(r, c)});
            }
            std.debug.print("\n", .{});
        }
    }
};

pub const CSV = struct {
    data: [][][]const u8,
    dim: usize,
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

        const d = try allocator.alloc([][] const u8, dimension);
        for (d) |*row| {
            row.* = try allocator.alloc([] const u8, dimension);
        }

        var row: u8 = 0;
        while (try reader.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
            var it = std.mem.splitScalar(u8, line, ',');
            var column: u8 = 0;

            while (it.next()) |x| {
                d[row][column] = try allocator.dupe(u8, x);
                column += 1;
            }

            row += 1;
        }

        return CSV{
            .data = d,
            .dim = dimension,
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

pub fn generateNewSolution(allocator: std.mem.Allocator, m1: *const Matrix, m2: *const Matrix) ! Permutation {
    var buffer = std.ArrayList(usize).init(allocator);
    defer buffer.deinit();
    var bufferSize = m1.dim;
    for (0..bufferSize) |i| {
        try buffer.append(i);
    }

    var candidateData = try allocator.alloc(usize, bufferSize);

    var node: usize = std.crypto.random.uintLessThan(usize, bufferSize);
    candidateData[0] = buffer.items[node];
    _ = buffer.swapRemove(node);
    bufferSize -= 1;

    while (bufferSize > 0) {
        var probabilities = std.ArrayList(f32).init(allocator);
        defer probabilities.deinit();

        var wholeSpace: f32 = 0;
        for (buffer.items) |i| {
            wholeSpace += m2.get(node, i);
        }

        for (buffer.items) |i| {
            try probabilities.append(m2.get(node, i) / wholeSpace);
        }
        const newNode = buffer.items[std.crypto.random.weightedIndex(f32, probabilities.items)];

        candidateData[m1.dim - bufferSize] = newNode;
        _ = buffer.swapRemove(std.mem.indexOfScalar(usize, buffer.items, newNode).?); // Huh?
        node = newNode;
        bufferSize -= 1;
    }

    const f = Permutation.computeFitness(&candidateData, m1);
    const candidate = Permutation{.data = candidateData, .len = m1.dim, .fitness = f, .allocator = allocator,};
    return candidate;
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

    // A TSP instance can be converted into a CSV file using Python in the following way:

    // import tsplib95
    // import networkx
    // import numpy
    // problem = tsplib95.load([name of the instance].tsp)
    // graph = problem.get_graph()
    // distance_matrix = networkx.to_numpy_matrix(graph)
    // numpy.savetxt([name of the instance].csv, distance_matrix, delimiter = ',')

    // This is a temporary solution. The correct approach would be writing a proper .tsp parser. 

    const csv = try CSV.parse(allocator, std.mem.span(std.os.argv[1]));

    var adjMatrix = try Matrix.init(allocator, csv.dim, 0);
    defer adjMatrix.deinit();

    for (0..adjMatrix.dim) |i| {
        for (0..adjMatrix.dim) |j| {
            const f = try std.fmt.parseFloat(f32, csv.get(i, j));
            adjMatrix.set(i, j, f);
        }
    }

    csv.deinit();

    var phMatrix = try Matrix.init(allocator, adjMatrix.dim, PHEROMONE_INITIAL_VALUE);
    defer phMatrix.deinit();

    var optimum = try Permutation.init(allocator, adjMatrix.dim, &adjMatrix);
    defer optimum.deinit();

    for (0..NUMBER_OF_ITERATIONS) |iteration| {
        var candidate = try generateNewSolution(allocator, &adjMatrix, &phMatrix);
        defer candidate.deinit();

        var probe = phMatrix.get(candidate.data[0], candidate.data[candidate.len - 1]);
        phMatrix.set(candidate.data[0], candidate.data[candidate.len - 1], probe + candidate.fitness);

        for (0..candidate.len - 1) |i| {
            probe = phMatrix.get(candidate.data[i], candidate.data[i + 1]);
            phMatrix.set(candidate.data[i], candidate.data[i + 1], probe + candidate.fitness);
        }

        if (candidate.fitness > optimum.fitness) {
            std.mem.swap(Permutation, &optimum, &candidate);
        }

        if (iteration % PHEROMONE_DECAY == 0) {
            phMatrix.scalarMul(1 - PHEROMONE_DECAY_RATE);
        }
    }

    optimum.print();
}
