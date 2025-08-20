CC ?= gcc

#EXTRA_FLAGS = -g -ggdb -fsanitize=address,leak,undefined -fno-omit-frame-pointer
CFLAGS = -Wall -pedantic-errors -std=c99 -fPIC $(EXTRA_FLAGS)
LDFLAGS = -Wl $(EXTRA_FLAGS)

code: Annealing.o
	$(CC) $(CFLAGS) Annealing.o -lm -o Annealing

Annealing.o: Annealing.c Annealing.h
	$(CC) $(CFLAGS) -c Annealing.c -o Annealing.o

python: Annealing.o Annealing.i
	swig -python Annealing.i
	$(CC) $(shell pkgconf --cflags python3) -fPIC -c Annealing_wrap.c
	$(CC) -shared Annealing.o Annealing_wrap.o -lm -o _Annealing.so

clean:
	rm -f *.o *.so *_wrap.c Annealing.py Annealing
	rm -rf __pycache__

all: code python

.PHONY: clean all
