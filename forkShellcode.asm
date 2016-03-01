push byte 0x02	; fork SYSCALL. 
pop rax
int 0x80

test rax, rax	; check whether child or parent. 
jz child

; Actions for the parent process. 
; clean up. 
push <Return Address>
ret

child:
	<See Attacking Remote Targets in Shellcode>
