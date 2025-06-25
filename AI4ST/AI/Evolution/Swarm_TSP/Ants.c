#include "Ants.h"

int NUMBER_OF_NODES;

void swap(unsigned int *a, unsigned int *b) {
	unsigned int temp = *a;
	*a = *b;
	*b = temp;
}

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

Matrix matrix_create(unsigned int v)
{
	Matrix M = NULL;

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

	// memset?
	for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
		for (unsigned int j = 0; j < NUMBER_OF_NODES; ++j) {
			M[i][j] = v;
		}
	}

	return M;
}

void matrix_read_from_csv(Matrix M, char* filename)
{
	FILE* fp = NULL;
	char row[1000];
	unsigned int i = 0, j = 0;

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
}

void matrix_destroy(Matrix M)
{
	for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
		free(M[i]);
		M[i] = NULL;
	}

	free(M);
	M = NULL;
}

float matrix_at(Matrix M, unsigned int a, unsigned int b) {
	return M[a][b];
}

void matrix_update_pheromone_matrix(Matrix F, Permutation* P, unsigned int attempt)
{
	F[P->Values[0]][P->Values[NUMBER_OF_NODES - 1]] += P->fitness;
	for (unsigned int i = 0; i < NUMBER_OF_NODES - 1; ++i) {
		F[P->Values[i]][P->Values[i + 1]] += P->fitness;
	}

	if (attempt % PHEROMONE_DECAY == 0) {
		for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
			for (unsigned int j = 0; j < NUMBER_OF_NODES; ++j) {
				F[i][j] *= PHEROMONE_DECAY_RATE;
			}
		}
	}
}

void permutation_update_fitness(Permutation* P, Matrix M)
{
	P->fitness = M[P->Values[0]][P->Values[NUMBER_OF_NODES - 1]];

	for (unsigned int i = 0; i < NUMBER_OF_NODES - 1; ++i) {
		P->fitness += M[P->Values[i]][P->Values[i + 1]];
	}

	P->fitness = STEP_WIDTH * (1 / P->fitness);
}

Permutation permutation_create(Matrix M)
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

Permutation permutation_generate_new_candidate(Matrix M, Matrix F)
{
	unsigned int* buffer = NULL;
	unsigned int buffer_len = NUMBER_OF_NODES - 1;
	unsigned int pos = 0;
	unsigned int t = rand() % NUMBER_OF_NODES;
	Permutation P;

	P = permutation_create(M);
	if (P.Values == NULL) {
		return P;
	}

	buffer = (unsigned int*)malloc(NUMBER_OF_NODES * sizeof(unsigned int));
	if (buffer == NULL) {
		perror("Error");
		permutation_destroy(&P);
		return P;
	}

	P.Values[pos] = t;
	for (unsigned int i = 0; i < NUMBER_OF_NODES; ++i) {
		buffer[i] = i;
	}
	swap(&buffer[t], &buffer[buffer_len]);
	--buffer_len;

	while (buffer_len > 0) {
		float* probabilities = NULL;
		probabilities = (float*)malloc(buffer_len * sizeof(float));
		for (unsigned int i = 0; i < buffer_len; ++i) {
			float temp = 0;
			for (unsigned int j = 0; j < buffer_len; ++i) {
				temp += F[t][j];
			}
			probabilities[i] = F[t][i] / temp;
		}

		unsigned int new_t = 0;
		P.Values[pos] = new_t;
		swap(&buffer[t], &buffer[buffer_len]);
		--buffer_len;
		++pos;
		t = new_t;
		free(probabilities);
	}

	free(buffer);
	buffer = NULL;

	return P;
}

Permutation main_loop(Matrix M)
{
	srand(time(NULL));

	Permutation best_perm;
	unsigned int attempt = 0;
	Matrix F;

	best_perm = permutation_create(M);
	if (best_perm.Values == NULL) {
		goto EXIT;
	}

	F = matrix_create(rand());
	if (F == NULL) {
		goto EXIT;
	}

	while (attempt < MAX_ITERATIONS) {
		Permutation current_perm = permutation_generate_new_candidate(M, F);
		if (current_perm.Values == NULL) {
			goto EXIT;
		}

		if (current_perm.fitness > best_perm.fitness) {
			permutation_copy(&best_perm, &current_perm);
		}

		matrix_update_pheromone_matrix(F, &current_perm, attempt);
		++attempt;
		permutation_destroy(&current_perm);
	}

EXIT:
	matrix_destroy(F);

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

	Matrix M;

	M = matrix_create(0);
	if (M == NULL) {
		exit(1);
	}

	matrix_read_from_csv(M, argv[1]);

	Permutation optimal_perm = main_loop(M);
	permutation_print(&optimal_perm);
	permutation_destroy(&optimal_perm);
	matrix_destroy(M);

	return errno;
}
