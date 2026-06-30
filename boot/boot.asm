[org 0x7C00]           ;BIOS把Bootloader加载到内存地址0x7C00
bits 16                    ;使用16位模式

start:
     cli                      ;cli全称Clean Interrupt Flag，意思为暂时关闭中断，原因:避免启动过程中被硬件中断打断

hang:
     hlt                     ;让CPU进入休眠等待状态
     jmp hang           ;一直循环，从hlt➡jmp➡hlt➡jmp，避免CPU跑飞到未知内存地址

times 510-($-$$) db 0  ;由于Boot Sector必须正好是512bytes，这句话的意思是填充到510字节,
                       ;(NASM的$符号表示当前地址，$$表示段的起始地址，所以$-$$表示当前段已经使用了多少字节，在这里是510字节，db 0表示填充0，最后55 AA刚好是最后两个字节)，
                       ;即510 Bytes + 2 Bytes(55 AA) = 512 Bytes，这就是为什么Bootloader的大小必须是512字节的原因。
dw 0xAA55              ;Boot Signature，BIOS要求最后两个字节必须是55 AA;