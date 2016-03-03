#include <stdio.h>
#include <stdlib.h>

struct Names {
	char *first;
	char *last;
	int *number;
};
int main(int argc, char *argv[]) {
	struct Names *one = malloc(sizeof(struct Names));
	if(one == NULL) return 1;
	one->first = "First Name";
	one->last = "Last Name";
	one->number = 2;

	printf("One is a struct of %d names. The first is %s, the last is %s", 
			one->number, one->first, one->last);
	free(one->first);
	free(one);
	return 0;
}
