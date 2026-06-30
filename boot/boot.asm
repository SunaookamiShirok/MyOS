[org 0x7C00]           ;BIOS把Bootloader加载到内存地址0x7C00
bits 16                    ;使用16位模式

start:
     cli                      ;cli全称Clean Interrupt Flag，意思为暂时关闭中断，原因:避免启动过程中被硬件中断打断
     mov si,msg               ;SI寄存器指向msg字符串的首地址

print:
     lodsb                    ;lodsb指令的作用是将DS:SI指向的内存单元中的一个字节加载到AL寄存器中，并且SI寄存器加1，指向下一个字节
     cmp al,0                 ;判断AL寄存器中的值是否为0
     je hang                  ;如果AL寄存器中的值为0，则跳转到hang标签处
     mov ah,0x0E              ;设置AH寄存器为0x0E，表示使用BIOS的Teletype输出功能
     int 0x10                 ;调用BIOS中断0x10，显示字符
     jmp print                ;跳转回print标签，继续打印下一个字符
hang:
     hlt                     ;让CPU进入休眠等待状态
     jmp hang                ;一直循环，从hlt➡jmp➡hlt➡jmp，避免CPU跑飞到未知内存地址
msg db 'MyOS Booting',0  ;定义要显示的字符串
times 510-($-$$) db 0  ;由于Boot Sector必须正好是512bytes，这句话的意思是填充到510字节,
                       ;(NASM的$符号表示当前地址，$$表示段的起始地址，所以$-$$表示当前段已经使用了多少字节，在这里是510字节，db 0表示填充0，最后55 AA刚好是最后两个字节)，
                       ;即510 Bytes + 2 Bytes(55 AA) = 512 Bytes，这就是为什么Bootloader的大小必须是512字节的原因。
dw 0xAA55              ;Boot Signature，BIOS要求最后两个字节必须是55 AA;
;新知识点 ①SI是源索引寄存器(Source Index Register)，它是一个16位的寄存器，主要用于字符串操作和数组操作。它通常与DS（数据段寄存器）一起使用，指向数据段中的内存地址。在这个例子里面;
;SI
;⬇
;msg
;'MyOS Booting'
;②loadsb,它相当于
;mov al,[si]
;inc si这两步一起做；
;也就是AL= 当前字符 SI++
;第一次执行lodsb时，AL= 'M' SI=0x7C00+1
;第二次执行lodsb时，AL= 'y' SI=0x7C00+2
;第三次执行lodsb时，AL= 'O' SI=0x7C00+3
;第四次执行lodsb时，AL= 'S' SI=0x7C00+4
;第五次执行lodsb时，AL= ' ' SI=0x7C00+5
;第六次执行lodsb时，AL= 'B' SI=0x7C00+6
;依此类推
;③cmp，先看例子，cmp al,0，意思是AL是不是0,如果为0，说明已经读到字符串的结尾了，跳转到hang标签处，执行hlt指令让CPU进入休眠状态，等待下一次中断的到来。
;所以整个的流程图是:msg
;⬇
;MyOS Booting
;⬆
;SI
;⬇
;loadsb
;⬇
;AL='M'
;⬇
;int 0x10
;⬇
;显示M
;⬇
;SI++
;⬇
;下一次循环
;⬇
;显示y
;⬇
;...
;直到AL=0
;结束