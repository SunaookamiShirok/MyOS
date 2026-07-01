;=========================================
; MyOS Bootloader
; Lesson 05
; Direct VGA Memory Output
;=========================================

org 0x7C00
bits 16

start:

    cli

    ;------------------------------------
    ; Initialize Segment Registers
    ;------------------------------------

    xor ax, ax

    mov ds, ax
    mov ss, ax
    mov sp, 0x7C00

    ;------------------------------------
    ; Set VGA Text Mode (80x25)
    ;------------------------------------

    mov ax, 0x0003
    int 0x10

    ;------------------------------------
    ; VGA Video Memory
    ;------------------------------------

    mov ax, 0xB800
    mov es, ax

    xor di, di

    ; Character
    mov al, 'A'
    mov [es:di], al

    ; Attribute
    mov byte [es:di+1], 0x1F

hang:
    hlt
    jmp hang

times 510-($-$$) db 0

dw 0xAA55