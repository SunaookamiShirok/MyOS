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
    mov cx, 2000
    mov ax, 0x0720

.loop:
    mov [es:di], ax
    add di, 2
    loop .loop

    popa
    ret

; =====================
; print string
; =====================
print_string:
    pusha

.next:
    lodsb
    cmp al, 0
    je .done

    mov ah, 0x0F
    mov [es:di], ax
    add di, 2
    jmp .next

.done:
    popa
    ret

msg db "MyOS Lesson07 DEBUG OK", 0

times 510-($-$$) db 0
dw 0xAA55