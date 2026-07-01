;=========================================================
; MyOS Bootloader
; Lesson 06 (Version 1)
;
; Topic:
;   Multiple Character Output
;
; Learning Objectives:
;   - Review VGA text mode memory layout
;   - Learn how to output multiple characters
;   - Use DI as the current output pointer
;   - Prepare for string output
;
; Version:
;   v0.2.0-dev
;=========================================================

org 0x7C00
bits 16

start:

    ;-----------------------------------------------------
    ; Initialize CPU Environment
    ;-----------------------------------------------------

    cli                     ; Disable interrupts

    xor ax, ax

    mov ds, ax              ; Data Segment
    mov ss, ax              ; Stack Segment
    mov sp, 0x7C00          ; Initialize Stack Pointer

    ;-----------------------------------------------------
    ; Set VGA Text Mode (80x25 Color Text)
    ;-----------------------------------------------------

    mov ax, 0x0003
    int 0x10

    ;-----------------------------------------------------
    ; VGA Video Memory
    ;-----------------------------------------------------

    mov ax, 0xB800
    mov es, ax

    xor di, di              ; Screen position = 0

    ;=====================================================
    ; Output "Hello"
    ;=====================================================

    ; H
    mov byte [es:di], 'H'
    mov byte [es:di+1], 0x0F
    add di, 2

    ; e
    mov byte [es:di], 'e'
    mov byte [es:di+1], 0x0F
    add di, 2

    ; l
    mov byte [es:di], 'l'
    mov byte [es:di+1], 0x0F
    add di, 2

    ; l
    mov byte [es:di], 'l'
    mov byte [es:di+1], 0x0F
    add di, 2

    ; o
    mov byte [es:di], 'o'
    mov byte [es:di+1], 0x0F

;---------------------------------------------------------
; Halt CPU
;---------------------------------------------------------

hang:
    hlt
    jmp hang

;---------------------------------------------------------
; Boot Sector Padding
;---------------------------------------------------------

times 510-($-$$) db 0

;---------------------------------------------------------
; Boot Signature
;---------------------------------------------------------

dw 0xAA55
