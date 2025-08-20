const std = @import("std");

const POPULATION_SIZE = 50;
const TOURNAMENT_SIZE = 5;
const ELITISM_SIZE = 3;
const MAXIMUM_ITERATIONS = 100;

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

        std.crypto.random.shuffle(usize, d);

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
        std.debug.print("\nFitness: {}\n", .{self.fitness});
    }

    pub fn cloneFrom(self: *Permutation, source: *const Permutation) void {
        @memcpy(self.data, source.data);
        self.fitness = source.fitness;
    }

    pub fn computeFitness(target: *const [] usize, matrix: *const Matrix) f32 {
        var f = matrix.get(target.*[0], target.*[target.len - 1]);

        for (0..target.len - 1) |i| {
            f += matrix.get(target.*[i], target.*[i + 1]);
        }

        return f;
    }
};

pub const Population = struct {
    members: []Permutation,
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator, matrix: *const Matrix) ! Population {
        const m = try allocator.alloc(Permutation, POPULATION_SIZE);

        for (0..POPULATION_SIZE) |i| {
            m[i] = try Permutation.init(allocator, matrix.dim, matrix);
        }

        return Population{.members = m, .allocator = allocator,};
    }

    pub fn deinit(self: *const Population) void {
        for (self.members) |member| {
            member.deinit();
        }
        self.allocator.free(self.members);
    }
};

pub fn isPermutationBetter(T: void, a: Permutation, b: Permutation) bool {
    _ = T;
	return a.fitness < b.fitness;
}

pub fn isPtrPermutationBetter(T: void, a: *Permutation, b: *Permutation) bool {
    _ = T;
	return a.fitness < b.fitness;
}

//permutationCrossover(Pi: *Permutation, P2: *Permutation, M: const *matrix);
//{
//}

pub fn tournamentSelection(P: *Population) usize {
    var tournament: [TOURNAMENT_SIZE]*Permutation = undefined;
    var indices: [TOURNAMENT_SIZE]usize = undefined;

    for (0..TOURNAMENT_SIZE) |i| {
        const t = std.crypto.random.uintLessThan(usize, POPULATION_SIZE);
        tournament[i] = &P.members[t];
        indices[i] = t;
    }

    const winner = std.sort.argMin(*Permutation, &tournament, {}, isPtrPermutationBetter).?; // Huh?
    return indices[winner];
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

    var adjMatrix = try Matrix.init(allocator, csv.dim, 0);
    defer adjMatrix.deinit();

    for (0..adjMatrix.dim) |i| {
        for (0..adjMatrix.dim) |j| {
            const f = try std.fmt.parseFloat(f32, csv.get(i, j));
            adjMatrix.set(i, j, f);
        }
    }

    csv.deinit();

    var thisPop = try Population.init(allocator, &adjMatrix);
    defer thisPop.deinit();

    const nextPop = try Population.init(allocator, &adjMatrix);
    defer nextPop.deinit();

    for (0..MAXIMUM_ITERATIONS) |_| {
        for (0..POPULATION_SIZE) |i| {
            const t = tournamentSelection(&thisPop);
            nextPop.members[i].cloneFrom(&thisPop.members[t]);
        }

        std.mem.sort(Permutation, nextPop.members, {}, isPermutationBetter);

        for (0..ELITISM_SIZE) |i| {
            thisPop.members[i].cloneFrom(&nextPop.members[i]);
        }

        std.crypto.random.shuffle(Permutation, nextPop.members);

        // for (ELITISM_SIZE..POPULATION_SIZE) |i| {
            // const a = std.crypto.random.uintLessThan(usize, POPULATION_SIZE);
            // const b = std.crypto.random.uintLessThan(usize, POPULATION_SIZE);
            // const t = populationCrossover[&nextPop[a], &nextPop[b], &adjMatrix];
            // @memcpy(thisPop.members[i].data, nextPop.members[t].data);
        // }

        std.crypto.random.shuffle(Permutation, thisPop.members);
    }

    const opt = std.sort.argMin(Permutation, thisPop.members, {}, isPermutationBetter).?; // Huh?
    thisPop.members[opt].print();
}
