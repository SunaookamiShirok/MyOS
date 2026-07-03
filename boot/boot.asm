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

    ; 关闭硬件光标
    call disable_hardware_cursor

    ; === 清屏 ===
    call clear_screen

    ; === 打字 ===
    mov si, msg
    call print_string

hang:
    hlt
    jmp hang

; =====================
; disable hardware cursor
; =====================
disable_hardware_cursor:
    push ax
    push dx

    ; 选择 Cursor Start Register (0x0A)
    mov dx, 0x3D4
    mov al, 0x0A
    out dx, al

    ; 写入 bit5 = 1，关闭硬件光标
    mov dx, 0x3D5
    mov al, 0x20
    out dx, al

    pop dx
    pop ax
    ret

; =====================
; clear screen
; =====================
clear_screen:
    pusha

    xor di,di
    mov cx,2000
    mov ax,0x0720

.loop:
    mov [es:di],ax
    add di,2
    loop .loop

    xor di,di

    mov byte [cursor_x],0
    mov byte [cursor_y],0
    mov word [cursor_offset],0
    mov word [cursor_saved],0x0720

    popa
    ret

; =====================
; print character
; =====================
print_char:
    push ax

    call erase_cursor

    mov ah,0x0F
    mov [es:di],ax

    add di,2

    mov [cursor_offset],di

    call draw_cursor

    pop ax
    ret

; =====================
; draw cursor
; =====================
draw_cursor:
    push ax
    push di

    mov di,[cursor_offset]

    ; 保存当前位置原来的字符
    mov ax,[es:di]
    mov word [cursor_saved],ax

    ; 画光标
    mov ax,0x0F5F
    mov [es:di],ax

    pop di
    pop ax
    ret

erase_cursor:
    push ax
    push di

    mov di,[cursor_offset]

    mov ax,[cursor_saved]
    mov [es:di],ax

    pop di
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

cursor_x      db 0
cursor_y      db 0
cursor_offset dw 0
cursor_saved dw 0

; =====================
; Messages
; =====================

msg db "Welcome to MyOS Lesson08_v2",0

; =====================
; Boot Signature
; =====================

times 510-($-$$) db 0
dw 0xAA55