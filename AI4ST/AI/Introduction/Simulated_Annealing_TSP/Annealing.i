%module Annealing
%{
#include "Annealing.h"
%}

%include "Annealing.h"

%extend Permutation {
	unsigned int __getitem__(unsigned int index) {
		return $self->Values[index];
	}
}
