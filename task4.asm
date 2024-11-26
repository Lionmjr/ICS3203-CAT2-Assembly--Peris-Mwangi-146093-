global _start

section .data
    sensor_value    dd 0            ; Simulated sensor input
    motor_status    db 0            ; Motor status: 0=OFF, 1=ON
    alarm_status    db 0            ; Alarm status: 0=OFF, 1=ON

    HIGH_LEVEL      equ 80          ; Define HIGH_LEVEL constant
    MODERATE_LEVEL  equ 50          ; Define MODERATE_LEVEL constant

    prompt          db 'Enter sensor value: '     ; Added length calculation
    prompt_len      equ $ - prompt
    input_buffer    times 10 db 0   ; Fixed array initialization
    motor_msg       db 'Motor Status: '
    motor_msg_len   equ $ - motor_msg
    alarm_msg       db 'Alarm Status: '
    alarm_msg_len   equ $ - alarm_msg
    on_msg          db 'ON', 10
    on_msg_len      equ $ - on_msg
    off_msg         db 'OFF', 10
    off_msg_len     equ $ - off_msg

section .bss
    ; Uninitialized data section

section .text
_start:
    ; Prompt for sensor value
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; stdout
    mov     rsi, prompt
    mov     rdx, prompt_len         ; Use calculated length
    syscall

    ; Read user input
    mov     rax, 0                  ; sys_read
    mov     rdi, 0                  ; stdin
    mov     rsi, input_buffer
    mov     rdx, 10
    syscall

    ; Convert input to integer
    mov     rsi, input_buffer
    call    atoi                    ; Result in RAX

    ; Store sensor value
    mov     [sensor_value], eax

    ; Read sensor value
    mov     eax, [sensor_value]

    ; Determine actions based on sensor value
    cmp     eax, HIGH_LEVEL
    jg      high_level

    cmp     eax, MODERATE_LEVEL
    jg      moderate_level

low_level:
    ; Low level: Motor ON, Alarm OFF
    mov     byte [motor_status], 1
    mov     byte [alarm_status], 0
    jmp     display_status

moderate_level:
    ; Moderate level: Motor OFF, Alarm OFF
    mov     byte [motor_status], 0
    mov     byte [alarm_status], 0
    jmp     display_status

high_level:
    ; High level: Motor ON, Alarm ON
    mov     byte [motor_status], 1
    mov     byte [alarm_status], 1

display_status:
    ; Display motor status
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; stdout
    mov     rsi, motor_msg
    mov     rdx, motor_msg_len
    syscall

    mov     al, [motor_status]
    cmp     al, 1
    je      motor_on
    jmp     motor_off

motor_on:
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; stdout
    mov     rsi, on_msg
    mov     rdx, on_msg_len
    syscall
    jmp     display_alarm

motor_off:
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; stdout
    mov     rsi, off_msg
    mov     rdx, off_msg_len
    syscall

display_alarm:
    ; Display alarm status
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; stdout
    mov     rsi, alarm_msg
    mov     rdx, alarm_msg_len
    syscall

    mov     al, [alarm_status]
    cmp     al, 1
    je      alarm_on
    jmp     alarm_off

alarm_on:
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; stdout
    mov     rsi, on_msg
    mov     rdx, on_msg_len
    syscall
    jmp     exit_program

alarm_off:
    mov     rax, 1                  ; sys_write
    mov     rdi, 1                  ; stdout
    mov     rsi, off_msg
    mov     rdx, off_msg_len
    syscall

exit_program:
    ; Exit the program
    mov     rax, 60                 ; sys_exit
    xor     rdi, rdi
    syscall

; Subroutine: ASCII to Integer Conversion (atoi)
atoi:
    xor     rax, rax                ; Clear RAX
    xor     rbx, rbx                ; Clear RBX for temporary storage
    mov     rbx, 10                 ; Multiplier (base 10)

atoi_loop:
    movzx   rcx, byte [rsi]         ; Load the next character
    cmp     rcx, 10                 ; Check for newline
    je      atoi_done
    sub     rcx, '0'                ; Convert ASCII to digit
    imul    rax, rbx                ; Multiply current value by 10
    add     rax, rcx                ; Add digit to result
    inc     rsi
    jmp     atoi_loop

atoi_done:
    ret

; ===========================================================
; Documentation
; ===========================================================
; **Program Overview**:
; This program simulates a sensor monitoring and control system. Based
; on a user-provided sensor value, it determines the statuses of a motor
; and an alarm based on defined thresholds. Actions include turning
; the motor or alarm ON/OFF and displaying their statuses.
;
; **Key Features**:
; 1. Prompts the user for a sensor value.
; 2. Compares the value against thresholds:
;    - Low Level (< 50): Motor ON, Alarm OFF
;    - Moderate Level (50–80): Motor OFF, Alarm OFF
;    - High Level (> 80): Motor ON, Alarm ON
; 3. Displays the motor and alarm statuses.
; 4. Exits gracefully with sys_exit.
;
; **Registers**:
; - `rax`: System call numbers and return values.
; - `rdi`: File descriptor (stdin/stdout) or program arguments.
; - `rsi`: Points to buffers (e.g., input or messages).
; - `rdx`: Length of data for system calls.
;
; **Stack Management**:
; - Subroutine `atoi` uses `rax` for integer conversion, clearing it
;   before operations to avoid corruption.
;
; **System Calls**:
; - sys_write (rax=1): Displays prompts and statuses.
; - sys_read (rax=0): Reads user input.
; - sys_exit (rax=60): Terminates the program.
;
; **Subroutines**:
; - `atoi`: Converts ASCII input to an integer, looping through digits
;   and multiplying by base 10.
; ===========================================================
