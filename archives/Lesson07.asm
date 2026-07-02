;========================================
; MyOS - Lesson 07
; Screen Driver (VGA Text Mode)
;========================================

org 0x7C00
bits 16

;========================================
; CONSTANTS
;========================================
VGA_TEXT equ 0xB800

;========================================
; DATA
;========================================
msg db "MyOS Lesson 07: Screen Driver OK", 0

;========================================
; BOOT ENTRY
;========================================
start:
    cli

    ; setup segments
    xor ax, ax
    mov ds, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    ; VGA segment
    mov ax, VGA_TEXT
    mov es, ax

    ; clear screen
    call clear_screen

    ; print message
    mov si, msg
    call print_string

hang:
    jmp hang

;========================================
; clear_screen
; Fill VGA with spaces (0x0720)
;========================================
clear_screen:
    push ax
    push cx
    push di
    push es

    mov ax, VGA_TEXT
    mov es, ax
    xor di, di

    mov cx, 2000        ; 80 * 25
    mov ax, 0x0720      ; space + attribute

.clear_loop:
    mov [es:di], ax
    add di, 2
    loop .clear_loop

    pop es
    pop di
    pop cx
    pop ax
    ret

;========================================
; print_string
; SI -> string
;========================================
print_string:
    push ax
    push si
    push es
    push di

    mov ax, VGA_TEXT
    mov es, ax
    xor di, di

.print_loop:
    lodsb               ; AL = [SI]
    cmp al, 0
    je .done

    mov ah, 0x0F        ; white on black
    mov [es:di], ax
    add di, 2

    jmp .print_loop

.done:
    pop di
    pop es
    pop si
    pop ax
    ret

;========================================
; BOOT SIGNATURE
;========================================
times 510-($-$$) db 0
dw 0xAA55