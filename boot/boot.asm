;========================================
; MyOS Bootloader
; Lesson 06 (Version 3)
; Reusable Print Routine
;========================================

org 0x7C00
bits 16

start:

    cli

    mov ax,0xB800
    mov es,ax

    xor di,di

    ; Print first string
    mov si,message1
    call print_string

    ; Print second string
    mov si,message2
    call print_string

hang:

    hlt
    jmp hang

;----------------------------------------
; Print String Routine
; ES -> VGA Memory
; SI -> String
; DI -> Screen Position
;----------------------------------------

print_string:

.next:

    lodsb               ; AL = [SI]

    cmp al,0
    je .done

    mov [es:di],al
    inc di

    mov byte [es:di],0x0F
    inc di

    jmp .next

.done:

    ret

;----------------------------------------
; Data
;----------------------------------------

message1 db "Hello, ",0
message2 db "MyOS!",0

;----------------------------------------

times 510-($-$$) db 0
dw 0xAA55