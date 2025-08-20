CC ?= gcc

#EXTRA_FLAGS = -g -ggdb -fsanitize=address,leak,undefined -fno-omit-frame-pointer
CFLAGS = -Wall -pedantic-errors -std=c99 -fPIC $(EXTRA_FLAGS)
LDFLAGS = -Wl $(EXTRA_FLAGS)

code: Tabu.o
	$(CC) $(CFLAGS) Tabu.o -lm -o Tabu

Tabu.o: Tabu.c Tabu.h
	$(CC) $(CFLAGS) -c Tabu.c -o Tabu.o

python: Tabu.o Tabu.i
	swig -python Tabu.i
	$(CC) $(shell pkgconf --cflags python3) -fPIC -c Tabu_wrap.c
	$(CC) -shared Tabu.o Tabu_wrap.o -lm -o _Tabu.so

clean:
	rm -f *.o *.so *_wrap.c Tabu.py Tabu
	rm -rf __pycache__

all: code python

.PHONY: clean all
