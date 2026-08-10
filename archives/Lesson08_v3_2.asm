; MyOS Lesson08_v3_2
; Cursor Position Synchronization
;
; Features:
; - Software cursor coordinate system
; - VGA hardware cursor synchronization
; - Cursor position calculation
; - Character output using coordinates
; - Basic line wrapping
;
; Date: 2026-08-09

org 0x7C00
bits 16


start:

cli

cld

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


mov word [cursor_x],0
mov word [cursor_y],0

call calculate_cursor



pop di
pop cx
pop ax

ret




;=================================
; print char
;
; AL = character
; cursor_x/cursor_y = current position
;
;=================================

print_char:

push ax
push bx
push dx
push di


push ax        ; 保存字符


mov ax,[cursor_y]

mov bx,80

mul bx

add ax,[cursor_x]

shl ax,1

mov di,ax


pop ax         ; 取回字符


mov ah,07

mov [es:di],ax



inc word [cursor_x]


call calculate_cursor


pop di
pop dx
pop bx
pop ax

ret


;=================================
; calculate hardware cursor
;
; cursor_x cursor_y
;
;=================================

calculate_cursor:


push ax
push bx


mov ax,[cursor_y]

mov bx,80

mul bx


add ax,[cursor_x]


call update_cursor


pop bx
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


cmp al,10
je .newline



call print_char
jmp .next


.newline:

mov word [cursor_x],0
inc word [cursor_y]

cmp word [cursor_y],25
jl .update_newline

mov word [cursor_y],0



.update_newline:


call calculate_cursor


jmp .next




.done:

ret


cursor_x dw 0
cursor_y dw 0

msg db "HELLO MYOS",0

times 510-($-$$) db 0


dw 0xAA55