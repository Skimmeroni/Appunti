#include "Tabu.h"

int NUMBER_OF_NODES;
unsigned int NUMBER_OF_COLORS;
float MUTATION_PROBABILITY;

int count_number_of_nodes(char* filename)
{
	FILE* fp = NULL;
	char row[1000];
	unsigned int n = 0;

	fp = fopen(filename, "r");
	if (fp == NULL) {
		perror(filename);
		return -1;
	}

	while (fgets(row, sizeof(row), fp) != NULL) {
		++n;
	}

	fclose(fp);

	return n;
}

Adjacency_matrix adj_matrix_create_from_csv(char* filename)
{
	FILE* fp;
	char row[1000];
	unsigned int i = 0, j = 0;

	Adjacency_matrix M = NULL;
	M = (bool**)malloc(NUMBER_OF_NODES * sizeof(bool*));
	if (M == NULL) {
		perror("Error");
		return M;
	}

	for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
		M[i] = NULL;
		M[i] = (bool*)malloc(NUMBER_OF_NODES * sizeof(bool));
		if (M[i] == NULL) {
			perror("Error");
			return M;
		}
	}

	fp = fopen(filename, "r");

	while (fgets(row, sizeof(row), fp) != NULL) {
		j = 0;
		row[strlen(row) - 1] = '\0';
		char* token = strtok(row, ",");
		while (token != NULL) {
			M[i][j] = atoi(token);
			token = strtok(NULL, ",");
			++j;
		}
		++i;
	}

	fclose(fp);
	return M;
}

void adj_matrix_destroy(Adjacency_matrix M)
{
	for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
		free(M[i]);
		M[i] = NULL;
	}

	free(M);
	M = NULL;
}

bool adj_matrix_at(Adjacency_matrix M, unsigned int a, unsigned int b) {
	return M[a][b];
}

void solution_update_fitness(Solution* s, Adjacency_matrix M)
{
	s->fitness = 0;

	for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
		for (unsigned int j = 0; j < NUMBER_OF_NODES; ++j) {
			s->fitness += (M[i][j] && s->Colors[i] == s->Colors[j]);
		}
	}
}

Solution solution_create()
{
	Solution s;

	s.Colors = NULL;
	s.Colors = (unsigned int*)malloc(NUMBER_OF_NODES * sizeof(unsigned int));

	if (s.Colors == NULL) {
		perror("Error");
	}

	return s;
}

void solution_destroy(Solution* s)
{
	free(s->Colors);
	s->Colors = NULL;
}

void solution_copy(Solution* target, Solution* source)
{
	memcpy(target->Colors, source->Colors, NUMBER_OF_NODES * sizeof(unsigned int));
	target->fitness = source->fitness;
}

void solution_print(Solution* s)
{
	if (s->fitness == 0) {
		printf("Possible optimal solution:\n");

		for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
			printf("%d", s->Colors[i]);
			if (i + 1 < NUMBER_OF_NODES) {
				printf(", ");
			}
		}

		putc('\n', stdout);
	} else {
		printf("No solution could be found!\n");
		printf("Either the parameters are poorly tuned or this is an impossible configuration\n");
	}
}

void solution_mutate(Solution* s, Adjacency_matrix M)
{
	Operator op = rand() % 2;

	if (op) {
		for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
			float threshold = (rand() % 1000000) * 0.000001;
			if (threshold <= MUTATION_PROBABILITY) {
				s->Colors[i] = rand() % NUMBER_OF_COLORS;
			}
		}
	} else {
		unsigned int j;
		for (unsigned int i = NUMBER_OF_NODES - 1; i > 0; --i) {
			j = rand() % (i + 1);
			unsigned int t = s->Colors[i];
			s->Colors[i] = s->Colors[j];
			s->Colors[j] = t;
		}
	}

	solution_update_fitness(s, M);
}

Solution solution_find_fittest(Population P)
{
	Solution s = solution_create();
	if (s.Colors == NULL) {
		perror("Error");
		return s;
	}

	unsigned int index = 0;

	for (unsigned int i = 0; i < POPULATION_SIZE; ++i) {
		if (P[i].fitness < P[index].fitness) {
			index = i;
		}
	}

	solution_copy(&s, &P[index]);
	return s;
}

void tabu_list_destroy(Tabu_list T)
{
	for (unsigned int i = 0; i < TABU_SIZE; ++i) {
		solution_destroy(&T[i][0]);
		solution_destroy(&T[i][1]);
		free(T[i]);
		T[i] = NULL;
	}

	free(T);
	T = NULL;
}

Tabu_list tabu_list_create(Adjacency_matrix M)
{
	Tabu_list T = NULL;
	T = (Solution**)malloc(TABU_SIZE * sizeof(Solution*));
	if (T == NULL) {
		perror("Error");
		return T;
	}

	Solution primer = solution_create();
	if (primer.Colors == NULL) {
		perror("Error");
		return T;
	}
	memset(primer.Colors, 0, NUMBER_OF_NODES * sizeof(unsigned int));
	solution_update_fitness(&primer, M);

	for (unsigned int i = 0; i < TABU_SIZE; ++i) {
		T[i] = NULL;
		T[i] = (Solution*)malloc(2 * sizeof(Solution));
		if (T[i] == NULL) {
			perror("Error");
			return T;
		}

		T[i][0] = solution_create();
		if (T[i][0].Colors == NULL) {
			perror("Error");
			return T;
		}
		solution_copy(&T[i][0], &primer);

		T[i][1] = solution_create();
		if (T[i][1].Colors == NULL) {
			perror("Error");
			return T;
		}
		solution_copy(&T[i][1], &primer);
	}

	solution_destroy(&primer);

	return T;
}

void tabu_list_push(Solution* s1, Solution* s2, Tabu_list T)
{
	for (unsigned int i = TABU_SIZE - 1; i > 0; --i) {
		solution_copy(&T[i][0], &T[i - 1][0]);
		solution_copy(&T[i][1], &T[i - 1][0]);
	}

	solution_copy(&T[0][0], s1);
	solution_copy(&T[0][1], s2);
}

bool tabu_list_is_in(Solution* current, Solution* new, Tabu_list T)
{
	for (unsigned int i = 0; i < TABU_SIZE; ++i) {
		bool first_match = !(bool)(memcmp(T[i][0].Colors, current->Colors, NUMBER_OF_NODES * sizeof(unsigned int)));
		bool second_match = !(bool)(memcmp(T[i][1].Colors, new->Colors, NUMBER_OF_NODES * sizeof(unsigned int)));
		if (first_match && second_match) {
			return true;
		}
	}

	return false;
}

void population_destroy(Population P)
{
	for (unsigned int i = 0; i < POPULATION_SIZE; ++i) {
		solution_destroy(&P[i]);
	}

	free(P);
	P = NULL;
}

Population population_create(Solution* primer)
{
	Population P = NULL;
 	P = (Solution*)malloc(POPULATION_SIZE * sizeof(Solution));
	if (P == NULL) {
		perror("Error");
		return P;
	}

	for (unsigned int i = 0; i < POPULATION_SIZE; ++i) {
		P[i] = solution_create();
		if (P[i].Colors == NULL) {
			perror("Error");
			return P;
		}
		solution_copy(&P[i], primer);
	}

	return P;
}

Solution main_loop(Adjacency_matrix M)
{
	srand(time(NULL));

	Solution current_solution, best_solution;
	Population P;
	Tabu_list T;
	unsigned int iteration = 0;

	current_solution = solution_create();
	if (current_solution.Colors == NULL) {
		goto EXIT;
	}

	for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
		current_solution.Colors[i] = rand() % NUMBER_OF_COLORS;
	}
	solution_update_fitness(&current_solution, M);

	best_solution = solution_create();
	if (best_solution.Colors == NULL) {
		goto EXIT;
	}

	solution_copy(&best_solution, &current_solution);

	T = tabu_list_create(M);
	if (T == NULL) {
		goto EXIT;
	}

	P = population_create(&current_solution);
	if (P == NULL) {
		goto EXIT;
	}

	while (iteration < MAXIMUM_ITERATIONS && best_solution.fitness > 0) {
		unsigned int catches = 0;
		Solution attempted_solution = solution_create();
		if (attempted_solution.Colors == NULL) {
			goto EXIT;
		}

		while (catches < POPULATION_SIZE) {
			solution_copy(&attempted_solution, &current_solution);
			solution_mutate(&attempted_solution, M);
			if (!tabu_list_is_in(&current_solution, &attempted_solution, T) ||
			    attempted_solution.fitness < best_solution.fitness) {
				solution_copy(&P[catches], &attempted_solution);
				catches++;
			}
		}

		solution_destroy(&attempted_solution);
		attempted_solution = solution_find_fittest(P);
		if (attempted_solution.Colors == NULL) {
			goto EXIT;
		}
		if (attempted_solution.fitness < best_solution.fitness) {
			solution_copy(&best_solution, &attempted_solution);
		}
		tabu_list_push(&current_solution, &attempted_solution, T);

		solution_copy(&current_solution, &attempted_solution);
		solution_destroy(&attempted_solution);
		++iteration;
	}

EXIT:
	solution_destroy(&current_solution);
	adj_matrix_destroy(M);
	population_destroy(P);
	tabu_list_destroy(T);

	return best_solution;
}

int main(int argc, char** argv)
{
	Adjacency_matrix M;

	if (argc != 3) {
		fprintf(stderr, "Wrong number of arguments given: ");
		fprintf(stderr, "expected 2, got %d\n", argc - 1);
		exit(1);
	}

	NUMBER_OF_NODES = count_number_of_nodes(argv[1]);
	if (NUMBER_OF_NODES < 0) {
		exit(1);
	}
	NUMBER_OF_COLORS = atoi(argv[2]);
	MUTATION_PROBABILITY = 1 / (float)(NUMBER_OF_NODES);

	M = adj_matrix_create_from_csv(argv[1]);
	if (M == NULL) {
		exit(1);
	}

	Solution optimal_solution = main_loop(M);
	solution_print(&optimal_solution);
	solution_destroy(&optimal_solution);

	return errno;
}
