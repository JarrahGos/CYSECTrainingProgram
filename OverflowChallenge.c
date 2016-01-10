#include <stdio.h>
#include <string.h>

int checkAuth(char* pass) {
	signed char* password = "blank";
	char pwBuffer[20];

	strcpy(pwBuffer, pass);
	if(*password == (char) 0xDEADBEEF) {
		return 1;
	}
	return 0;
}

int main(int argc, char* argv[]) {
	if(checkAuth(argv[1])) {
		printf("Access Granted");
	}
	else printf("Access Denied");
	return 0;
}
