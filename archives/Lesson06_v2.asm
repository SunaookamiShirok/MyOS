;========================================
; MyOS Bootloader
; Lesson 06 (Version 2)
; String Output Using Loop
;========================================

org 0x7C00
bits 16

start:

    cli                     ; Disable interrupts

    mov ax,0xB800
    mov es,ax               ; ES -> VGA text memory

    xor di,di               ; Screen position

    mov si,message          ; SI -> string

print:

    lodsb                   ; AL = [SI], SI++

    cmp al,0                ; End of string?
    je hang

    mov [es:di],al          ; Character
    inc di

    mov byte [es:di],0x0F   ; White on black
    inc di

    jmp print

hang:

    hlt
    jmp hang

;----------------------------------------
; Data
;----------------------------------------

message db 'Hello, MyOS!',0

;----------------------------------------
; Boot Signature
;----------------------------------------

times 510-($-$$) db 0
dw 0xAA55