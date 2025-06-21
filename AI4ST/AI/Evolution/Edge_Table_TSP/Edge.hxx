#ifndef EDGE_HXX_
#define EDGE_HXX_

#include <array>
#include <algorithm>
#include <fstream>
#include <iostream>
#include <sstream>
#include <random>
#include <vector>

const unsigned int POPULATION_SIZE = 250;
const unsigned int TOURNAMENT_SIZE = 10;
const unsigned int ELITISM_SIZE = 5;
const unsigned int MAXIMUM_ITERATIONS = 1000;

class Matrix
{
	private:	
	std::vector<std::vector<float>> Content;

	class SingleRow {
		friend class Matrix;

		private:
		const std::vector<float>& row;

		public:
		SingleRow(const std::vector<float>& row) : row(row) {}

		const float& operator[](unsigned int col_index) const {
			return row[col_index];
		}
	};

	public:
	Matrix()
	{
		this->Content = {};
	}

	explicit Matrix(const std::string& filename)
	{
		std::string line;
		std::ifstream file;

		try {
			file.open(filename);
		} catch(const std::ifstream::failure& e) {
			std::cerr << e.what() << std::endl;
			throw;
		}

		while (std::getline(file, line)) {
			std::vector<float> row;
			std::stringstream ss(line);
			std::string cell;

			while (std::getline(ss, cell, ',')) {
				try {
					float v = std::stof(cell);
					if (v == 0) {
						v = INFINITY;
					}
					row.push_back(v);
				} catch (const std::invalid_argument& e) {
					std::cerr << e.what() << std::endl;
					throw;
				}
			}

			this->Content.push_back(row);
		}

		file.close();
		this->Content.shrink_to_fit();
	}

	~Matrix(void) {}

	Matrix(const Matrix& other)
	{
		this->Content = other.Content;
	}

	const unsigned int size() const {
		return this->Content.size();
	}

	void swap(Matrix& other)
	{
		std::swap(this->Content, other.Content);
	}

	Matrix& operator=(const Matrix& other)
	{
		if (this != &other) {
			Matrix tmp(other);
			this->swap(tmp);
		}

		return *this;
	}

	const SingleRow operator[](unsigned int row_index) const {
		return SingleRow(this->Content[row_index]);
	}
};

class Permutation
{
	friend std::ostream& operator<<(std::ostream& os, const Permutation& P);

	private:
	std::vector<unsigned int> Values;
	float f;

	void update_fitness(const Matrix& M)
	{
		float temp = M[this->Values[0]][this->Values[M.size() - 1]];

		for (unsigned int i = 0; i < M.size() - 1; ++i) {
			temp += M[this->Values[i]][this->Values[i + 1]];
		}

		this->f = temp;
	}

	public:
	Permutation()
	{
		this->Values = {};
		this->f = 0;
	}

	explicit Permutation(const Matrix& M)
	{
		this->Values.resize(M.size());

		for (unsigned int i = 0; i < M.size(); ++i) {
			this->Values[i] = i;
		}

		std::random_device rd;
		std::mt19937 twister(rd());

		std::shuffle(this->Values.begin(), this->Values.end(), twister);
		update_fitness(M);
	}

	Permutation(const std::vector<unsigned int>& Values, const Matrix& M)
	{
		this->Values = Values;
		update_fitness(M);
	}

	~Permutation(void) {}

	Permutation(const Permutation& other)
	{
		this->Values = other.Values;
		this->f = other.f;
	}

	void swap(Permutation& other)
	{
		std::swap(this->Values, other.Values);
		std::swap(this->f, other.f);
	}

	Permutation& operator=(const Permutation& other)
	{
		if (this != &other) {
			Permutation tmp(other);
			this->swap(tmp);
		}

		return *this;
	}

	const unsigned int& operator[](unsigned int index) const {
		return this->Values[index];
	}

	const unsigned int size() const {
		return this->Values.size();
	}

	const float fitness() const {
		return this->f;
	}

	const bool is_consistent() const {
		std::vector<unsigned int> c(this->Values);
		std::sort(c.begin(), c.end(), [](const unsigned int& a, const unsigned int& b){return a < b;});
		std::vector<unsigned int> v;
		v.resize(c.size());
		for (unsigned int i = 0; i < c.size(); ++i) {
			v[i] = i;
		}
		bool yes = true;
		for (unsigned int i = 0; i < c.size(); ++i) {
			if (c[i] != v[i]) yes = false;
		}
		return yes;
	}
};

typedef std::array<Permutation, POPULATION_SIZE> Population;

std::ostream& operator<<(std::ostream& os, const Permutation& P);
Permutation permutation_crossover(const Permutation& P1, const Permutation& P2, Matrix M);
Permutation tournament_selection(const Population& P);
Permutation main_loop(const Matrix& M);

#endif
