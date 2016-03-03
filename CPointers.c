int *fib(int iterations) {
	int *fibPtr;	
	*fibPtr = 0;
	fibPtr++;
	*fibPtr = 1;
	fibarr++;
	for(int i = 1; i <= iterations; i++, fibPtr++) {
			*fibPtr = *(fibPtr - 1) + *(fibPtr - 2);
	}
	return fibPtr - iterations;
}
