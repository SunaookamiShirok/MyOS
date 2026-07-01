;=========================================================
; MyOS Bootloader
; Lesson 01
;
; Topic:
;   Create the first bootable boot sector.
;
; Learning Objectives:
;   - Understand BIOS boot process
;   - Learn boot sector structure
;   - Learn org 0x7C00
;   - Learn boot signature (0xAA55)
;
; Version:
;   v0.1.0
;=========================================================

org 0x7C00
bits 16

start:

hang:
    jmp hang

;---------------------------------------------------------
; Boot Sector Padding
;---------------------------------------------------------

times 510-($-$$) db 0

;---------------------------------------------------------
; Boot Signature
;---------------------------------------------------------

dw 0xAA55