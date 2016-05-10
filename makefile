CFLAGS= -g -O2 -Wall -Wextra -Isrc -std=gnu99
all: 
	make source
	make object
source: *.c
	gcc $(CFLAGS) -c *.c
object: *.o 
	gcc -o project *.o
