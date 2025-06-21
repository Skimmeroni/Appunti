#include "Edge.hxx"
#include <unordered_set>

std::ostream& operator<<(std::ostream& os, const Permutation& P)
{
	std::vector<unsigned int>::const_iterator start = P.Values.cbegin();
	std::vector<unsigned int>::const_iterator end = P.Values.cend();

	while (start != end) {
		os << *start;
		if (start + 1 != end) {
			os << ", ";
		}
		start++;
	}

	return os;
}

Permutation permutation_crossover(const Permutation& P1, const Permutation& P2, Matrix M)
{
	std::vector<std::vector<unsigned int>> E = std::vector<std::vector<unsigned int>>();
	Permutation result;

	auto by_neighborhood = [&E](unsigned int a, unsigned int b) {
		std::unordered_set<unsigned int> A(E[a].begin(), E[a].end());
		std::unordered_set<unsigned int> B(E[b].begin(), E[b].end());

		return A.size() < B.size();
	};

	E.resize(P1.size());

	for (unsigned int i = 0; i < E.size(); ++i) {
		unsigned int left = (i + E.size() - 1) % E.size();
		unsigned int right = (i + 1) % E.size();

		E[P1[i]].resize(4);
		E[P1[i]][0] = P1[left];
        E[P1[i]][1] = P1[right];

		E[P2[i]].resize(4);
        E[P2[i]][2] = P2[left];
        E[P2[i]][3] = P2[right];
	}

	for (unsigned int i = 0; i < E.size(); ++i) {
		std::sort(E[i].begin(), E[i].end(), by_neighborhood);
	}

	std::vector<unsigned int> Values;
	unsigned int choice = P1[0];

	Values.resize(E.size());
	Values[0] = choice;

	for (unsigned int i = 0; i < E.size(); ++i) {
		E[i].erase(std::remove(E[i].begin(), E[i].end(), choice), E[i].end());
	}

	for (unsigned int i = 1; i < E.size(); ++i) {
		std::vector<unsigned int>::const_iterator marked_found;
		std::vector<unsigned int> temp(E[choice]);
		std::sort(temp.begin(), temp.end(), [](unsigned int a, unsigned int b){return a < b;});

		marked_found = std::adjacent_find(temp.cbegin(), temp.cend());
		if (temp.size() == 0) {
			std::vector<std::vector<unsigned int>>::const_iterator not_zero = E.begin();
			while ((*not_zero).size() == 0) {
				++not_zero;
			}
			choice = (*not_zero)[0];
		} else if (marked_found != temp.end()) {
			choice = *marked_found;
		} else {
			choice = E[choice][0];
		}

		for (unsigned int j = 0; j < E.size(); ++j) {
			E[j].erase(std::remove(E[j].begin(), E[j].end(), choice), E[j].end());
		}

		Values[i] = choice;
	}

	result = Permutation(Values, M);
	return result;
}

Permutation tournament_selection(const Population& P)
{
	std::array<Permutation, TOURNAMENT_SIZE> Tournament;

	std::random_device rd;
	std::mt19937 twister(rd());
	std::uniform_int_distribution<> distribution(0, POPULATION_SIZE - 1);

	auto by_fitness = [](const Permutation& a, const Permutation& b){return a.fitness() < b.fitness();};

	for (unsigned int j = 0; j < TOURNAMENT_SIZE; ++j) {
		Tournament[j] = P[distribution(twister)];
	}

	Permutation winner = *std::min_element(Tournament.cbegin(), Tournament.cend(), by_fitness);

	return winner;
}

Permutation main_loop(const Matrix& M)
{
	auto by_fitness = [](const Permutation& a, const Permutation& b){return a.fitness() < b.fitness();};

	std::random_device rd;
	std::mt19937 twister(rd());
	std::uniform_int_distribution<> distribution(0, POPULATION_SIZE - 1);

	unsigned int iteration;
	Permutation best_individual;
	Population current_population;
	Population new_population;

	for (unsigned int i = 0; i < POPULATION_SIZE; ++i) {
		current_population[i] = Permutation(M);
	}
	new_population = current_population;

	for (iteration = 0; iteration < MAXIMUM_ITERATIONS; ++iteration) {
		#ifndef _WIN32
		std::cout << "\rCurrent iteration: " << iteration + 1 << "/" << MAXIMUM_ITERATIONS << std::flush;
		#endif

		for (unsigned int i = 0; i < POPULATION_SIZE; ++i) {
			new_population[i] = tournament_selection(current_population);
		}

		std::sort(new_population.begin(), new_population.end(), by_fitness);
		for (unsigned int i = 0; i < ELITISM_SIZE; ++i) {
			current_population[i] = new_population[i];
		}

		for (unsigned int i = ELITISM_SIZE; i < POPULATION_SIZE; ++i) {
			const Permutation& P1 = new_population[distribution(twister)];
			const Permutation& P2 = new_population[distribution(twister)];
			current_population[i] = permutation_crossover(P1, P2, M);
		}
		std::shuffle(current_population.begin(), current_population.end(), twister);
	}

	std::cout << std::endl;

	best_individual = *std::min_element(current_population.cbegin(), current_population.cend(), by_fitness);
	return best_individual;
}

int main(int argc, char**argv)
{
	if (argc != 2) {
		std::cerr << "Wrong number of arguments given: " << std::endl;
		std::cerr << "expected 2, got " << argc - 1 << std::endl;
        exit(1);
    }
	Permutation optimal_solution;
	Matrix M = Matrix(std::string(argv[1]));

	optimal_solution = main_loop(M);
	std::cout << "Best solution found:" << std::endl;
	std::cout << optimal_solution << std::endl;
	std::cout << "With a fitness of " << optimal_solution.fitness() << std::endl;

	/*
	To solve with bruteforce approach:

	Matrix M = Matrix(std::string(argv[1]));

	std::vector<unsigned int> nums;
	nums.resize(M.size());
	for (unsigned int i = 0; i < M.size(); ++i) {
		nums[i] = i;
	}

	Permutation opt = Permutation(nums, M);

    do {
		Permutation current = Permutation(nums, M);
		if (current.fitness() < opt.fitness()) {
			opt = current;
		}
    } while (std::next_permutation(nums.begin(), nums.end()));

	std::cout << opt << std::endl;
	*/

	return 0;
}
