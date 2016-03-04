typedef int (*compare)(char a, char b);

char *sort(char *numbers[], int size, compare cmp) {
	<Start of sort function>
	if(cmp(numbers[i], numbers[i+1])) {
		<action to take> 
	}
	<end sort function>
}
int comp(char a, char b) {
	return a < b;
}

int main(int argc, char *argv[]){
	sort(argv, argc, comp);
	return 0;
}
