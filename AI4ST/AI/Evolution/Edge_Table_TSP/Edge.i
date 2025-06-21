%module Edge

%{
#include "Edge.hxx"
%}

%include "std_string.i"
%include "Edge.hxx"
%extend Permutation {
	unsigned int __getitem__(unsigned int index) {
		return (*$self)[index];
	}
}
%extend Matrix {
	float __getitem__(unsigned int a, unsigned int b) {
		return (*$self)[a][b];
	}
}
