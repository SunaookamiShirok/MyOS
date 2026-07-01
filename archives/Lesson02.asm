;=========================================================
; MyOS Bootloader
; Lesson 02
;
; Topic:
;   Display the first character using BIOS.
;
; Learning Objectives:
;   - Learn BIOS INT 10H
;   - Display a single character
;
; Version:
;   v0.1.0
;=========================================================

org 0x7C00
bits 16

start:

    mov ah,0x0E         ; BIOS Teletype Output
    mov al,'H'          ; Character
    int 0x10

hang:
    jmp hang

times 510-($-$$) db 0
dw 0xAA55