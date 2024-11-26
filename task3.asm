section .data
    prompt db "Enter a number: ", 0
    result_msg db "Factorial: ", 0
    newline db 10, 0

section .bss
    num resb 8               ; Space for user input (64-bit integer)
    result resq 1            ; Space for the factorial result

section .text
    global _start

_start:
    ; Display the prompt
    mov rdx, 16              ; Length of the prompt string
    mov rsi, prompt          ; Address of the prompt
    mov rdi, 1               ; File descriptor (stdout)
    mov rax, 1               ; System call for sys_write
    syscall

    ; Read user input
    mov rdx, 8               ; Maximum bytes to read
    mov rsi, num             ; Address to store input
    mov rdi, 0               ; File descriptor (stdin)
    mov rax, 0               ; System call for sys_read
    syscall

    ; Convert input from ASCII to integer
    mov rsi, num             ; Address of input
    call atoi                ; Convert ASCII to integer in rax

    ; Compute factorial
    mov rdi, rax             ; Move input number to rdi
    call factorial           ; Call the factorial subroutine
    mov [result], rax        ; Store result in memory

    ; Display the result
    mov rdx, 10              ; Length of "Factorial: "
    mov rsi, result_msg      ; Address of result message
    mov rdi, 1               ; File descriptor (stdout)
    mov rax, 1               ; System call for sys_write
    syscall

    ; Print the factorial result
    mov rax, [result]        ; Load the factorial result
    call print_int           ; Print the integer

    ; Print newline
    mov rdx, 1
    mov rsi, newline
    mov rdi, 1
    mov rax, 1
    syscall

    ; Exit the program
    mov rax, 60              ; System call for sys_exit
    xor rdi, rdi             ; Exit code 0
    syscall

; Subroutine: atoi
atoi:
    ; Convert ASCII to integer
    ret
; Subroutine: factorial
factorial:
    push rbx                 ; Save rbx on the stack
    cmp rdi, 1               ; Base case: if n <= 1
    jle factorial_done       ; Jump to factorial_done if true
    dec rdi                  ; n - 1
    call factorial           ; Recursive call
    mov rbx, rax             ; Store result of (n-1)!
    inc rdi                  ; Restore rdi to original n
    imul rax, rdi            ; Multiply n * (n-1)!
    jmp factorial_end        ; Jump to factorial_end

factorial_done:
    mov rax, 1               ; Return 1 for n <= 1

factorial_end:
    pop rbx                  ; Restore rbx from the stack
    ret                      ; Return to caller

; Subroutine: print_int
print_int:
    ; Logic to print integer in rax
    ret

; ===========================================================
; Documentation
; ===========================================================
; **Program Overview**:
; This program calculates the factorial of a user-provided number using
; modular programming principles. It features subroutines for factorial
; calculation, ASCII-to-integer conversion, and integer output.
;
; **Register Management**:
; - `rax`: Holds intermediate results and return values from subroutines.
; - `rdi`: Holds the input number for factorial calculation.
; - `rbx`: Temporarily stores intermediate results during recursion.
;
; **Stack Usage**:
; - The `factorial` subroutine uses `push` to save the `rbx` register before
;   modifying it and `pop` to restore its original value after use.
; - Recursive calls push return addresses onto the stack automatically.
;
; **System Calls**:
; - `sys_write` (rax=1): Used for displaying prompts and results.
; - `sys_read` (rax=0): Reads user input into a buffer.
; - `sys_exit` (rax=60): Terminates the program gracefully.
;
; **Subroutine Details**:
; - `factorial`: Computes n! using recursion. Handles base cases (n <= 1)
;   and recursively multiplies n by (n-1)!.
; - `atoi`: Converts ASCII input to an integer (implementation pending).
; - `print_int`: Outputs an integer to the screen (implementation pending).
; ===========================================================
