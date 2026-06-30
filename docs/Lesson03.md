# Lesson 03 - Print a String
# 第 3 课 - 输出字符串

## Learning Objectives / 学习目标

### English

- Learn how to store a string in memory
- Understand how the `SI` register points to data
- Use `LODSB` to read characters one by one
- Print a complete string using BIOS interrupt `int 0x10`

### 中文

- 学习如何在内存中定义字符串
- 理解 `SI` 寄存器如何指向字符串
- 学会使用 `LODSB` 逐个读取字符
- 利用 BIOS 中断 `int 0x10` 输出完整字符串

---

# Theory / 原理

## English

Instead of printing a single character, we store a string in memory.

The `SI` register stores the address of the string.

`LODSB` loads one byte from the memory pointed to by `SI` into register `AL`, then automatically increments `SI` to the next character.

The program continues printing until it reaches the null terminator (`0`).

## 中文

与上一课输出单个字符不同，本课将字符串存放在内存中。

`SI` 寄存器保存字符串的首地址。

`LODSB` 会将 `SI` 指向的一个字节读取到 `AL` 中，并自动将 `SI` 指向下一个字符。

程序不断循环输出，直到遇到字符串结束标志 `0`。

---

# Source Code / 源代码

```asm
; ==========================================================
; Project : MyOS
; File    : boot.asm
; Version : v0.0.3
; Lesson  : 03
; Title   : Print a String
; ==========================================================

[org 0x7C00]
bits 16

start:
    cli

    mov si, msg          ; SI points to the string

print:
    lodsb                ; Load byte from [SI] into AL, SI++

    cmp al, 0            ; End of string?
    je hang

    mov ah, 0x0E         ; BIOS teletype output
    int 0x10             ; Print character

    jmp print

hang:
    hlt
    jmp hang

msg db "MyOS Booting...", 0

times 510-($-$$) db 0
dw 0xAA55
```

---

# Code Explanation / 代码解析

| Instruction | Description | 中文说明 |
|------------|-------------|----------|
| `mov si, msg` | Load string address into SI | 将字符串地址保存到 SI |
| `lodsb` | Load one byte into AL and increment SI | 读取一个字符到 AL，并自动 SI++ |
| `cmp al, 0` | Check for end of string | 判断是否到达字符串结尾 |
| `je hang` | Jump if AL equals 0 | 如果为 0，则结束输出 |
| `mov ah, 0x0E` | BIOS teletype function | BIOS 字符输出功能 |
| `int 0x10` | Print current character | 调用 BIOS 输出字符 |
| `jmp print` | Continue printing | 继续循环输出 |

---

# Execution Flow / 执行流程

```text
          msg
           │
           ▼
"MyOS Booting..."
           │
           ▼
      mov SI, msg
           │
           ▼
        LODSB
           │
           ▼
       AL = Character
           │
           ▼
      cmp AL, 0
           │
    ┌──────┴──────┐
    │             │
  No│             │Yes
    ▼             ▼
int 0x10       End Program
    │
    ▼
Print Character
    │
    ▼
 SI points to next byte
    │
    ▼
Repeat
```

---

# Result / 运行结果

```text
MyOS booting
```

---