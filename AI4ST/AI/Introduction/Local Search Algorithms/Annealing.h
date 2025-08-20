#ifndef ANNEALING_H_
#define ANNEALING_H_

#define MAX_ITERATIONS 1000
#define INITIAL_TEMPERATURE 300
#define ALPHA 0.95

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
typedef float** Adjacency_matrix;

extern int NUMBER_OF_NODES;

int count_number_of_nodes(char* filename);
Adjacency_matrix adj_matrix_create_from_csv(char* filename);
void adj_matrix_destroy(Adjacency_matrix M);
float adj_matrix_at(Adjacency_matrix M, unsigned int a, unsigned int b);
void permutation_update_fitness(Permutation* P, Adjacency_matrix M);
Permutation permutation_create(Adjacency_matrix M);
void permutation_destroy(Permutation* P);
void permutation_copy(Permutation* target, Permutation* source);
void permutation_print(Permutation* P);
void permutation_shuffle(Permutation* P, Adjacency_matrix M);
bool tolerate_worse_solution(float delta, float k, float t);
Permutation main_loop(Adjacency_matrix M);

#endif
