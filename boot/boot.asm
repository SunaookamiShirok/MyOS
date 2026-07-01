;=========================================================
; MyOS Bootloader
; Lesson 06 (Version 2)
; Print String Using Loop
;=========================================================

org 0x7C00
bits 16

start:

    cli

    xor ax, ax
    mov ds, ax
    mov ss, ax
    mov sp, 0x7C00

    ; Set text mode
    mov ax, 0x0003
    int 0x10

    ; VGA memory
    mov ax, 0xB800
    mov es, ax

    xor di, di

    ; SI -> message
    mov si, message

print_loop:

    ; Read current character
    mov al, [si]

    ; End of string?
    cmp al, 0
    je hang

    ; Write character
    mov [es:di], al

    ; White on black
    mov byte [es:di+1], 0x0F

    ; Next character
    inc si

    ; Next screen cell
    add di, 2

    jmp print_loop

hang:
    hlt
    jmp hang

;---------------------------------------------------------

message db "Hello MyOS",0

;---------------------------------------------------------

times 510-($-$$) db 0
dw 0xAA55