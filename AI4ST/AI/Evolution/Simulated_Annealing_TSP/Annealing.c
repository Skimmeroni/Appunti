#include "Annealing.h"

int NUMBER_OF_NODES;

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
	Adjacency_matrix M = NULL;
	FILE* fp = NULL;
	char row[1000];
	unsigned int i = 0, j = 0;

	M = (float**)malloc(NUMBER_OF_NODES * sizeof(float*));
	if (M == NULL) {
		perror("Error");
		return NULL;
	}

	for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
		M[i] = NULL;
		M[i] = (float*)malloc(NUMBER_OF_NODES * sizeof(float));
		if (M[i] == NULL) {
			perror("Error");
			return NULL;
		}
	}

	fp = fopen(filename, "r");

	while (fgets(row, sizeof(row), fp) != NULL) {
		j = 0;
		row[strlen(row) - 1] = '\0';
		char* token = strtok(row, ",");
		while (token != NULL) {
			M[i][j] = atof(token);
			if (M[i][j] == 0) {
				M[i][j] = INFINITY;
			}
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

float adj_matrix_at(Adjacency_matrix M, unsigned int a, unsigned int b) {
	return M[a][b];
}

void permutation_update_fitness(Permutation* P, Adjacency_matrix M)
{
	P->fitness = M[P->Values[0]][P->Values[NUMBER_OF_NODES - 1]];

	for (unsigned int i = 0; i < NUMBER_OF_NODES - 1; ++i) {
		P->fitness += M[P->Values[i]][P->Values[i + 1]];
	}
}

Permutation permutation_create(Adjacency_matrix M)
{
	Permutation P;

	P.Values = NULL;
	P.Values = (unsigned int*)malloc(NUMBER_OF_NODES * sizeof(unsigned int));
	if (P.Values != NULL) {
		for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
			P.Values[i] = i;
		}
		permutation_update_fitness(&P, M);
	} else {
		perror("Error");
	}

	return P;
}

void permutation_destroy(Permutation* P)
{
	free(P->Values);
	P->Values = NULL;
}

void permutation_copy(Permutation* target, Permutation* source)
{
	memcpy(target->Values, source->Values, NUMBER_OF_NODES * sizeof(unsigned int));
	target->fitness = source->fitness;
}

void permutation_print(Permutation* P)
{
	printf("Best solution found:\n");

	for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
		printf("%d", P->Values[i]);
		if (i + 1 < NUMBER_OF_NODES) {
			printf(", ");
		}
	}

	printf("\nWith a fitness of %f\n", P->fitness);
}

void permutation_shuffle(Permutation* P, Adjacency_matrix M)
{
	unsigned int a, b, c, d, j;
	unsigned int table[NUMBER_OF_NODES - 2];

	a = rand() % NUMBER_OF_NODES;
	b = (a + 1) % NUMBER_OF_NODES;

	j = 0;
	for (unsigned int i = 0; i < NUMBER_OF_NODES; i++) {
		if ((P->Values[i] != a) && (P->Values[i] != b)) {
			table[j] = P->Values[i];
			j++;
		}
	}

	c = table[rand() % (sizeof(table) / sizeof(*table))];
	d = (c + 1) % NUMBER_OF_NODES;
	d = (d == a || d == b) ? (c - 1) % NUMBER_OF_NODES : d;

	j = P->Values[b];
	P->Values[b] = P->Values[c];
	P->Values[c] = j;

	permutation_update_fitness(P, M);
}

bool tolerate_worse_solution(float delta, float k, float t)
{
	float threshold = (rand() % 1000000) * 0.000001;
	float exponent = -delta / (k * t);

	/*
	Below a certain threshold, exp throws ERANGE
	and e^x becomes hopelessly small anyways
	*/
	if (exponent > -8) {
		return (exp(exponent) > threshold);
	} else {
		return false;
	}
}

Permutation main_loop(Adjacency_matrix M)
{
	srand(time(NULL));

	Permutation current_perm, candidate_perm, best_perm;
	unsigned int attempt = 0;
	float temperature = INITIAL_TEMPERATURE;
	float lower_fitness_bound = INFINITY;
	float higher_fitness_bound = 0;

	current_perm = permutation_create(M);
	if (current_perm.Values == NULL) {
		goto EXIT;
	}
	candidate_perm = permutation_create(M);
	if (candidate_perm.Values == NULL) {
		goto EXIT;
	}
	best_perm = permutation_create(M);
	if (best_perm.Values == NULL) {
		goto EXIT;
	}

	permutation_copy(&best_perm, &current_perm);

	while (attempt < MAX_ITERATIONS) {
		float delta, k;

		permutation_copy(&candidate_perm, &current_perm);
		permutation_shuffle(&candidate_perm, M);

		lower_fitness_bound = fmin(candidate_perm.fitness, lower_fitness_bound);
		higher_fitness_bound = fmax(candidate_perm.fitness, higher_fitness_bound);

		delta = candidate_perm.fitness - current_perm.fitness;
		k = higher_fitness_bound - lower_fitness_bound;

		if (delta < 0 || (delta > 0 && tolerate_worse_solution(delta, k, temperature))) {
			permutation_copy(&current_perm, &candidate_perm);
		}

		if (current_perm.fitness < best_perm.fitness) {
			permutation_copy(&best_perm, &current_perm);
		}

		temperature *= ALPHA;
		++attempt;
	}

EXIT:
	adj_matrix_destroy(M);
	permutation_destroy(&current_perm);
	permutation_destroy(&candidate_perm);

	return best_perm;
}

int main(int argc, char** argv)
{
	if (argc != 2) {
		fprintf(stderr, "Wrong number of arguments given: ");
		fprintf(stderr, "expected 1, got %d\n", argc - 1);
		exit(1);
	}

	NUMBER_OF_NODES = count_number_of_nodes(argv[1]);
	if (NUMBER_OF_NODES < 0) {
		exit(1);
	}

	Adjacency_matrix M;

	M = adj_matrix_create_from_csv(argv[1]);
	if (M == NULL) {
		exit(1);
	}

	Permutation optimal_perm = main_loop(M);
	permutation_print(&optimal_perm);
	permutation_destroy(&optimal_perm);

	return errno;
}
