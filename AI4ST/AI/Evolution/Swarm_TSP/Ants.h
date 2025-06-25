#ifndef ANTS_H_
#define ANTS_H_

#define MAX_ITERATIONS 1000
#define STEP_WIDTH 1
#define PHEROMONE_DECAY 5
#define PHEROMONE_DECAY_RATE 0.95

#include <errno.h>
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef struct {
	unsigned int* Values;
	float fitness;
} Permutation;
typedef float** Matrix;

extern int NUMBER_OF_NODES;

int count_number_of_nodes(char*);
Matrix matrix_create(unsigned int);
void matrix_read_from_csv(Matrix, char*);
void matrix_destroy(Matrix);
float matrix_at(Matrix, unsigned int, unsigned int);
void matrix_update_pheromone_matrix(Matrix, Permutation*, unsigned int);
void permutation_update_fitness(Permutation*, Matrix);
Permutation permutation_create(Matrix);
void permutation_destroy(Permutation*);
void permutation_copy(Permutation*, Permutation*);
void permutation_print(Permutation*);
Permutation permutation_generate_new_candidate(Matrix, Matrix);
Permutation main_loop(Matrix);

#endif
