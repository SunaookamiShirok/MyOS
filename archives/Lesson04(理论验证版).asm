;=========================================================
; MyOS Bootloader
; Lesson 04
;
; Topic:
;   Understanding VGA Text Mode.
;
; Learning Objectives:
;   - Learn VGA memory layout
;   - Learn video memory address
;   - Prepare for direct hardware programming
;
; Version:
;   v0.2.0-dev
;=========================================================

org 0x7C00
bits 16

start:

    cli

    xor ax,ax

    mov ds,ax
    mov ss,ax
    mov sp,0x7C00

    ; Set VGA Text Mode
    mov ax,0x0003
    int 0x10

    ; VGA Memory
    mov ax,0xB800
    mov es,ax

hang:
    hlt
    jmp hang

times 510-($-$$) db 0
dw 0xAA55