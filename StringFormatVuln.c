#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
	char userIn[1024];
	static int changeMe = 5;

	strcpy(userIn, argv[1]);
	printf("Correct:\t");
	printf("%s", userIn);
	
	printf("\nIncorrect:\t");
	printf(userIn);

	printf("Value of changeMe is %d. \
			it is at 0x%08x. \
			in hex it is 0x%08x",
			changeMe, &changeMe, changeMe);
	return 0;
}

