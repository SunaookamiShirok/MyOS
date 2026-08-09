; MyOS Lesson08_v3_1
; Hardware Cursor Initialization
;
; Features:
; - VGA hardware cursor enable
; - Cursor register control
; - Hardware cursor positioning
;
; Date: 2026-08-09

org 0x7C00
bits 16


start:

cli

xor ax,ax
mov ds,ax
mov ss,ax
mov sp,0x7C00


mov ax,0xB800
mov es,ax


sti


; 初始化硬件光标

call init_cursor


; 清屏

call clear_screen


; 输出字符串

mov si,msg
call print_string



hang:

hlt
jmp hang



;=================================
; VGA Hardware Cursor Initialize
;=================================

init_cursor:


push ax
push dx


; Cursor Start

mov dx,0x3D4
mov al,0x0A
out dx,al


mov dx,0x3D5
mov al,0x00
out dx,al



; Cursor End

mov dx,0x3D4
mov al,0x0B
out dx,al


mov dx,0x3D5
mov al,0x0F
out dx,al



; 设置初始位置0

xor ax,ax

call update_cursor


pop dx
pop ax

ret




;=================================
; update hardware cursor
;
; AX = offset
;
;=================================

update_cursor:


push ax
push bx
push dx


mov bx,ax


; 高8位

mov dx,0x3D4
mov al,0x0E
out dx,al


mov dx,0x3D5
mov al,bh
out dx,al



; 低8位

mov dx,0x3D4
mov al,0x0F
out dx,al


mov dx,0x3D5
mov al,bl
out dx,al



pop dx
pop bx
pop ax

ret





;=================================
; clear screen
;=================================

clear_screen:


push ax
push cx
push di


xor di,di

mov ax,0x0720

mov cx,2000


.clear:

mov [es:di],ax

add di,2

loop .clear


xor ax,ax

call update_cursor



pop di
pop cx
pop ax

ret




;=================================
; print char
;
; AL = character
; DI = VGA offset
;
;=================================

print_char:


push ax


mov ah,0x07

mov [es:di],ax


add di,2


; 更新硬件光标

mov ax,di

shr ax,1


call update_cursor



pop ax

ret





;=================================
; print string
;=================================

print_string:


.next:

lodsb


cmp al,0

je .done



call print_char


jmp .next



.done:

ret




msg db "Welcome to MyOS Lesson08_v3.1",0



times 510-($-$$) db 0

dw 0xAA55