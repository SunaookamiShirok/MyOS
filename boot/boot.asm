org 0x7C00
bits 16

start:
    cli

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    sti

    ; === VGA 初始化 ===
    mov ax, 0xB800
    mov es, ax
    xor di, di

    ; === 清屏 ===
    call clear_screen

    ; === 打字 ===
    mov si, msg
    call print_string

hang:
    hlt
    jmp hang

; =====================
; clear screen
; =====================
clear_screen:
    pusha

    xor di, di
    mov cx,2000
    mov ax,0x0720

.loop:
    mov [es:di],ax
    add di,2
    loop .loop

    mov byte [cursor_x],0
    mov byte [cursor_y],0
    xor di,di

    popa
    ret

; =====================
; print character
; =====================
print_char:
    push ax

    mov ah,0x0F
    mov [es:di],ax
    add di,2

    pop ax
    ret

; =====================
; print character
; Input:
;   AL = character
; Uses:
;   ES:DI = VGA memory position
; =====================
print_string:
    pusha

.next:
    lodsb
    cmp al, 0
    je .done

    call print_char
    jmp .next

.done:
    popa
    ret

; =====================
; Screen Driver
; =====================

cursor_x db 0
cursor_y db 0

; =====================
; Messages
; =====================

msg db "Welcome to MyOS Lesson08_v1",0

; =====================
; Boot Signature
; =====================

times 510-($-$$) db 0
dw 0xAA55