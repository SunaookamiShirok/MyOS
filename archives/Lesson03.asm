;=========================================================
; MyOS Bootloader
; Lesson 03
;
; Topic:
;   Print a string using BIOS services.
;
; Learning Objectives:
;   - Learn string output
;   - Learn SI register
;   - Learn LODSB instruction
;
; Version:
;   v0.1.0
;=========================================================

org 0x7C00
bits 16

start:

    mov si,message

print:

    lodsb               ; Load byte from DS:SI

    cmp al,0
    je done

    mov ah,0x0E
    int 0x10

    jmp print

done:

hang:
    jmp hang

message db "Hello MyOS!",0

times 510-($-$$) db 0
dw 0xAA55