#ifndef TABU_H_
#define TABU_H_

#define MAXIMUM_ITERATIONS 250
#define POPULATION_SIZE 150
#define TABU_SIZE 50

#include <errno.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <stdbool.h>

typedef enum {mutation, shuffling} Operator;
typedef struct {
	unsigned int* Colors;
	unsigned int fitness;
} Solution;
typedef Solution* Population;
typedef Solution** Tabu_list;
typedef bool** Adjacency_matrix;

extern int NUMBER_OF_NODES;
extern unsigned int NUMBER_OF_COLORS;
extern float MUTATION_PROBABILITY;

int count_number_of_nodes(char* filename);
Adjacency_matrix adj_matrix_create_from_csv(char* filename);
void adj_matrix_destroy(Adjacency_matrix M);
bool adj_matrix_at(Adjacency_matrix M, unsigned int a, unsigned int b);
void solution_update_fitness(Solution* s, Adjacency_matrix M);
Solution solution_create();
void solution_destroy(Solution* s);
void solution_copy(Solution* target, Solution* source);
void solution_print(Solution* s);
void solution_mutate(Solution* s, Adjacency_matrix M);
Solution solution_find_fittest(Population P);
void tabu_list_destroy(Tabu_list T);
Tabu_list tabu_list_create(Adjacency_matrix M);
void tabu_list_push(Solution* s1, Solution* s2, Tabu_list T);
bool tabu_list_is_in(Solution* current, Solution* new, Tabu_list T);
void population_destroy(Population P);
Population population_create(Solution* primer);
Solution main_loop(Adjacency_matrix M);

#endif
