segment .data
     message db 'Hello, world!', 0xa  ; Segmento de dados (.data)
     len equ $ - message;calcula o tamanho da string

segment .bss
    buffer resb 64  ; Segmento BSS (.bss) para armazenar dados não inicializados

segment .text
    global _start

_start:
    ; Chama a função write para imprimir a mensagem
    mov eax, 4          ; syscall número para sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, message    ; endereço da mensagem
    mov edx, len         ; comprimento da mensagem
    int 0x80            ; chamar kernel

    ; Chama a função exit para terminar o programa
    mov eax, 1          ; syscall número para sys_exit
    xor ebx, ebx        ; código de saída 0
    int 0x80            ; chamar kernel
