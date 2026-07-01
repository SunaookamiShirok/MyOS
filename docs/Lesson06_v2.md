# Lesson 06 (Version 2)

# 第六课（第二版）

---

## Topic

### English

Print String Using Loop

### 中文

使用循环输出字符串

---

## Learning Objectives

### English

In this lesson, we replace repeated character output instructions with a loop.

By traversing a null-terminated string, the bootloader can print strings of arbitrary length while keeping the code concise and reusable.

### 中文

本课将之前重复输出字符的代码改为循环实现。

通过遍历以空字符结尾的字符串，Bootloader 可以输出任意长度的字符串，使代码更加简洁，并为后续封装输出函数做好准备。

---

## New Knowledge

### 1. String Definition

#### English

```asm
message db "Hello MyOS",0
```

A string is stored sequentially in memory.

The last `0` is called the **Null Terminator**, indicating the end of the string.

#### 中文

```asm
message db "Hello MyOS",0
```

字符串按顺序存放在内存中。

最后的 `0` 被称为**字符串结束符（Null Terminator）**，用于标识字符串结束。

---

### 2. SI Register

#### English

```asm
mov si, message
```

SI stores the address of the current character.

#### 中文

```asm
mov si, message
```

SI 保存当前字符的地址。

随着循环进行，SI 会不断移动到下一个字符。

---

### 3. Read Character

#### English

```asm
mov al,[si]
```

Read one character from memory into AL.

#### 中文

```asm
mov al,[si]
```

读取当前字符到 AL 寄存器。

---

### 4. End Detection

#### English

```asm
cmp al,0
je hang
```

If the character equals zero, stop printing.

#### 中文

```asm
cmp al,0
je hang
```

如果字符为 0，说明已经到达字符串结尾，停止输出。

---

### 5. Loop

#### English

```asm
inc si
add di,2
jmp print_loop
```

Move to the next character and continue printing.

#### 中文

```asm
inc si
add di,2
jmp print_loop
```

移动到下一个字符，同时更新屏幕输出位置。

---

## Program Flow

### English

```text
Initialize

↓

Set VGA Memory

↓

SI → message

↓

Read Character

↓

Character == 0 ?

↓

Yes → Stop

↓

No

↓

Display Character

↓

Move to Next Character

↓

Loop
```

### 中文

```text
初始化

↓

设置 VGA 显存

↓

SI 指向字符串

↓

读取字符

↓

是否为字符串结束符？

↓

是 → 停止

↓

否

↓

输出字符

↓

移动到下一个字符

↓

继续循环
```

---

## Program Output

### English

```text
Hello MyOS
```

### 中文

程序将在屏幕左上角显示：

```text
Hello MyOS
```

---

## Summary

### English

In this lesson we learned:

- Null-terminated strings
- SI register
- AL register
- String traversal
- cmp instruction
- je instruction
- Loop-based string output

This prepares us for implementing the first reusable output function in Lesson 06 (Version 3).

### 中文

本课学习了：

- 空字符结尾字符串（Null-Terminated String）
- SI 寄存器
- AL 寄存器
- 字符串遍历
- cmp 指令
- je 指令
- 使用循环输出字符串

这些知识将为下一课封装 **print_string()** 函数打下基础。

---

Happy Coding!

祝开发愉快！