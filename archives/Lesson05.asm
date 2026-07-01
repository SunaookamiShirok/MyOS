;=========================================================
; MyOS Bootloader
; Lesson 05
;
; Topic:
;   Direct VGA Memory Output.
;
; Learning Objectives:
;   - Initialize CPU environment
;   - Access VGA memory
;   - Display characters without BIOS
;
; Version:
;   v0.2.0-dev
;=========================================================

org 0x7C00
bits 16

start:

    cli

    ;-----------------------------------------------------
    ; Initialize Segment Registers
    ;-----------------------------------------------------

    xor ax,ax

    mov ds,ax
    mov ss,ax
    mov sp,0x7C00

    ;-----------------------------------------------------
    ; Set VGA Text Mode
    ;-----------------------------------------------------

    mov ax,0x0003
    int 0x10

    ;-----------------------------------------------------
    ; Access VGA Video Memory
    ;-----------------------------------------------------

    mov ax,0xB800
    mov es,ax

    xor di,di

    ; Character
    mov byte [es:di],'H'

    ; Attribute (White on Black)
    mov byte [es:di+1],0x0F

hang:
    hlt
    jmp hang

times 510-($-$$) db 0
dw 0xAA55