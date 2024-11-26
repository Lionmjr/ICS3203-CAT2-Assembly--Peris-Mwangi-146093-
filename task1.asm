section .data
    prompt db "Enter a number: ", 0
    positive db "POSITIVE", 0
    negative db "NEGATIVE", 0
    zero db "ZERO", 0

section .bss
    num resb 4               ; Reserve space for 4 bytes (user input)

section .text
    global _start

_start:
    ; Display the prompt
    mov edx, 15              ; Length of the string "Enter a number: "
    mov ecx, prompt          ; Address of the prompt
    mov ebx, 1               ; File descriptor (stdout)
    mov eax, 4               ; System call number for sys_write
    int 0x80                 ; Call kernel to display prompt

    ; Read user input
    mov edx, 4               ; Number of bytes to read
    mov ecx, num             ; Address to store the input
    mov ebx, 0               ; File descriptor (stdin)
    mov eax, 3               ; System call number for sys_read
    int 0x80                 ; Call kernel to read input

    ; Convert input (ASCII to integer) - assuming input is valid and a single digit
    movzx eax, byte [num]    ; Load the byte at num into eax, zero-extend it
    sub eax, '0'             ; Convert ASCII to integer ('0' -> 0, '1' -> 1, ..., '9' -> 9)

    ; Check if the number is positive, negative, or zero
    cmp eax, 0
    jg positive_label        ; Jump if greater (positive number)
    jl negative_label        ; Jump if less (negative number)

    ; If zero, display "ZERO"
    mov edx, 4               ; Length of "ZERO"
    mov ecx, zero            ; Address of "ZERO"
    mov ebx, 1               ; File descriptor (stdout)
    mov eax, 4               ; System call number for sys_write
    int 0x80
    jmp done                 ; Jump to done

positive_label:
    mov edx, 8               ; Length of "POSITIVE"
    mov ecx, positive        ; Address of "POSITIVE"
    mov ebx, 1               ; File descriptor (stdout)
    mov eax, 4               ; System call number for sys_write
    int 0x80
    jmp done

negative_label:
    mov edx, 8               ; Length of "NEGATIVE"
    mov ecx, negative        ; Address of "NEGATIVE"
    mov ebx, 1               ; File descriptor (stdout)
    mov eax, 4               ; System call number for sys_write
    int 0x80

done:
    ; Exit program
    mov eax, 1               ; System call number for sys_exit
    xor ebx, ebx             ; Return code 0
    int 0x80

