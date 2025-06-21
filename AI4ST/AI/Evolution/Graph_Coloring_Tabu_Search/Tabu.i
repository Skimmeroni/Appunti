%module Tabu
%{
#include "Tabu.h"
%}

%include "Tabu.h"

%extend Solution {
	unsigned int __getitem__(unsigned int index) {
		return $self->Colors[index];
	}
}
