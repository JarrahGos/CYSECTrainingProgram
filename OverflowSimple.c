#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[])
{
	int change = 3;
	char first[8], second[8];
			
	//put "first" into first buffer
	strcpy(first, "first");
	// put "second" into second buffer
	strcpy(second, "second");
	printf("[PREOVERFLOW] first at %p, containing 
			%s\n", first, first);
	printf("[PREOVERFLOW] second at %p, containing 
			%s\n", second, second);
	printf("[ACTION] copying %d bytes into second", 
			strlen(argv[1]));
	strcpy(second, argv[1]);

	printf("[POSTOVERFLOW] first now contains 
			%s\n", first);
	printf("[POSTOVERFLOW] second now contains 
			%s\n", second);
	printf("[POSTOVERFLOW] change is at %p 
			containing %d or 0x08%x\n",
			&change, change, change);
	return 0;
}					
