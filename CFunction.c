int fib(int iterations) {
	int fibon = 1;
	int last = 0;
	int next;
	for(int i = 1; i <= iterations; i++) {
		next = fibon + last;
		last = fibon;
	}
	return fibon;
}
