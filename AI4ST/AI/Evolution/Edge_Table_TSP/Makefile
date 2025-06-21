CXX ?= g++

#EXTRA_FLAGS = -g -ggdb -fsanitize=address,leak,undefined -fno-omit-frame-pointer
CXXFLAGS = -Wall -pedantic-errors -std=c++11 -fPIC $(EXTRA_FLAGS)
LDFLAGS = -Wl $(EXTRA_FLAGS)

code: Edge.o
	$(CXX) $(CXXFLAGS) Edge.o -lm -o Edge

Edge.o: Edge.cxx Edge.hxx
	$(CXX) $(CXXFLAGS) -c Edge.cxx -o Edge.o

python: Edge.o Edge.i
	swig -c++ -python Edge.i
	$(CXX) $(shell pkgconf --cflags python3) -fPIC -c Edge_wrap.cxx
	$(CXX) -shared Edge.o Edge_wrap.o -lm -o _Edge.so

clean:
	rm -f *.o *.so *_wrap.cxx Edge.py Edge
	rm -rf __pycache__

all: code python

.PHONY: clean all
