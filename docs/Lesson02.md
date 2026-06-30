# Lesson 02 - Print the First Character
# 第 2 课 - 输出第一个字符

## Learning Objectives / 学习目标

### English

- Understand BIOS interrupt `int 0x10`
- Print the first character on the screen
- Learn the purpose of registers `AH` and `AL`

### 中文

- 理解 BIOS 视频中断 `int 0x10`
- 学会在屏幕上输出第一个字符
- 认识 `AH` 与 `AL` 寄存器的作用

---

# Theory / 原理

## English

BIOS provides video services through interrupt `0x10`.

When register `AH` is set to `0x0E`, BIOS enters **Teletype Output Mode**.

The character stored in register `AL` will be printed on the screen.

## 中文

BIOS 通过 `int 0x10` 提供视频显示服务。

当寄存器 `AH = 0x0E` 时，BIOS 会进入 **Teletype Output（打字机输出）模式**。

此时寄存器 `AL` 中保存的字符会显示到屏幕上。

---

# Source Code / 源代码

```asm
[org 0x7C00]
bits 16

start:
    cli

    mov ah, 0x0E      ; BIOS Teletype Output
    mov al, 'M'       ; Character to print
    int 0x10          ; BIOS video interrupt

hang:
    hlt
    jmp hang

times 510-($-$$) db 0
dw 0xAA55
```

---

# Code Explanation / 代码解析

| Instruction | 中文说明 |
|------------|---------|
| `mov ah,0x0E` | 选择 BIOS 字符输出功能 |
| `mov al,'M'` | 将字符 M 放入 AL |
| `int 0x10` | 调用 BIOS 输出字符 |

---

# Execution Flow / 执行流程

```text
CPU
 │
 ▼
AH = 0x0E
 │
 ▼
AL = 'M'
 │
 ▼
int 0x10
 │
 ▼
BIOS
 │
 ▼
Screen
 │
 ▼
M
```

---

# Result / 运行结果

```
M
```

---

# Knowledge Learned / 本课知识点

### English

- BIOS interrupt
- Video service
- Registers `AH` and `AL`
- `mov` instruction
- `int` instruction

### 中文

- BIOS 中断
- 视频服务
- AH、AL 寄存器
- mov 指令
- int 指令

---

# Next Lesson / 下一课

Print an entire string instead of a single character.

输出完整字符串，而不仅仅是一个字符。
# 附第二版boot.asm及注释
; ==========================================================
; MyOS Bootloader v2
; Lesson 02 - Print the First Character
; 第2课：输出第一个字符
; ==========================================================

[org 0x7C00]            ; BIOS loads the boot sector at 0x7C00
bits 16                 ; Use 16-bit real mode

start:
    cli                 ; Disable interrupts / 关闭中断

    ; ------------------------------------------------------
    ; BIOS Video Service
    ; AH = 0x0E : Teletype Output
    ; AL = Character to print
    ; BIOS 视频服务：输出单个字符
    ; ------------------------------------------------------

    mov ah, 0x0E        ; BIOS teletype output function
    mov al, 'M'         ; Character to display
    int 0x10            ; Call BIOS video interrupt

hang:
    hlt                 ; Halt CPU / CPU休眠
    jmp hang            ; Infinite loop / 无限循环

; ----------------------------------------------------------
; Boot Sector Signature
; 补齐至 512 Bytes，并写入启动签名
; ----------------------------------------------------------

times 510-($-$$) db 0
dw 0xAA55