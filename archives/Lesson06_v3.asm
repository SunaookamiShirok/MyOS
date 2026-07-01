;=========================================
; MyOS
; Lesson 06 (Version 3)
; Reusable Print Routine
;=========================================

org 0x7C00

start:

    mov ax, 0xB800
    mov es, ax
    xor di, di

    mov si, message
    call print_string

hang:
    jmp hang

;-----------------------------------------
; print_string
;
; Input:
;   ES -> VGA Memory
;   SI -> String Address
;   DI -> Screen Position
;
; Output:
;   String displayed on screen
;
; Registers Modified:
;   AL, SI, DI
;-----------------------------------------

print_string:

.next_char:

    lodsb               ; AL = [SI], SI++

    cmp al, 0
    je .done

    mov [es:di], al
    mov byte [es:di+1], 0x07

    add di, 2

    jmp .next_char

.done:

    ret

message db "Hello, MyOS!", 0

times 510-($-$$) db 0
dw 0xAA55