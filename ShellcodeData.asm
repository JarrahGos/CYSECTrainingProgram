call 	get_ptr			;call to addressing function
db		"This is data"	;Create a string. 

get_ptr:
	pop rcx				;Pop address of string to rcx
