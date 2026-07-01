# Lesson 04 - Understanding VGA Text Mode
# 第4课 - 理解 VGA 文本模式

---

## 📖 Learning Objectives / 学习目标

### English

In this lesson, we learn the basic principles of VGA Text Mode before writing directly to video memory.

Topics include:

- What is VGA Text Mode?
- Why is the video memory located at **0xB8000**?
- Why does each character occupy **2 bytes**?
- What is the Attribute Byte?
- How does the CPU display characters by writing directly to memory?

### 中文

本课主要学习 VGA 文本模式的基本原理，为后续直接操作显存做准备。

学习内容包括：

- 什么是 VGA 文本模式？
- 为什么显存地址是 **0xB8000**？
- 为什么每个字符占用 **2 个字节**？
- 什么是颜色属性（Attribute）？
- CPU 为什么能够通过写内存直接控制屏幕？

---

# 1. BIOS Output Review / 回顾 BIOS 输出

### English

Previously, we displayed characters by calling the BIOS interrupt:

```asm
mov ah, 0x0E
mov al, 'A'
int 0x10
```

The BIOS performs all display operations for us.

Process:

```
CPU
 ↓
BIOS (INT 10h)
 ↓
VGA
 ↓
Screen
```

### 中文

之前我们通过 BIOS 中断输出字符：

```asm
mov ah,0x0E
mov al,'A'
int 0x10
```

BIOS 会负责完成所有显示工作。

流程如下：

```
CPU
 ↓
BIOS（INT 10h）
 ↓
VGA
 ↓
屏幕
```

---

# 2. What is Video Memory? / 什么是显存？

### English

VGA provides a dedicated memory region called **Video Memory**.

The CPU can write directly into this memory, and the VGA controller automatically displays its contents.

### 中文

VGA 提供了一块专门用于显示的内存——**显存（Video Memory）**。

CPU 只需要向显存写入数据，VGA 控制器便会自动将内容显示到屏幕上。

---

# 3. Why is the Address 0xB8000? / 为什么地址是 0xB8000？

### English

On IBM PC-compatible computers, VGA text mode video memory starts at the physical address:

```
0xB8000
```

This address has become the standard for x86 PCs and is still supported today.

### 中文

在 IBM PC 兼容机中，VGA 文本模式显存固定映射到物理地址：

```
0xB8000
```

这一标准一直沿用至今，因此现代 x86 系统仍然兼容该地址。

---

# 4. Screen Layout / 屏幕布局

### English

The default VGA text mode resolution is:

```
80 Columns × 25 Rows
```

Total characters:

```
80 × 25 = 2000
```

### 中文

默认 VGA 文本模式大小为：

```
80 列 × 25 行
```

共可显示：

```
80 × 25 = 2000 个字符
```

---

# 5. Character Structure / 字符结构

Each character occupies **2 bytes**.

每个字符占用 **2 个字节**。

```
+------------+--------------+
| Character  | Attribute    |
+------------+--------------+
| ASCII      | Color        |
+------------+--------------+
```

Example:

```
41 07
```

Meaning:

```
41h → 'A'

07h → White text on Black background
```

示例：

```
41h → 字符'A'

07h → 黑底白字
```

---

# 6. Attribute Byte / 颜色属性

The Attribute Byte stores foreground and background colors.

```
7 6 5 4 | 3 2 1 0
Background | Foreground
```

Example:

```
0x07
```

```
Background : Black

Foreground : White
```

例如：

```
0x1E
```

```
Background : Blue

Foreground : Yellow
```

即：

**蓝底黄字**

---

# 7. Memory Layout / 显存布局

The first row starts at:

```
0xB8000
```

The second row starts at:

```
0xB80A0
```

Reason:

```
80 Characters

×

2 Bytes

=

160 Bytes

=

0xA0
```

因此：

```
第一行：

0xB8000

第二行：

0xB80A0

第三行：

0xB8140
```

---

# 8. Memory-Mapped I/O / 内存映射 I/O

### English

The VGA controller continuously reads data from video memory.

Whenever the CPU modifies the video memory, the display updates automatically.

### 中文

VGA 控制器会不断读取显存中的数据。

CPU 修改显存后，屏幕内容会自动更新。

This mechanism is called:

```
Memory-Mapped I/O
```

即：

**内存映射 I/O**

---

# Summary / 本课总结

✅ Learned the difference between BIOS output and direct hardware access.

✅ Understood the VGA text mode memory layout.

✅ Learned why the video memory starts at **0xB8000**.

✅ Learned why every character occupies **2 bytes**.

✅ Learned the purpose of the Attribute Byte.

✅ Introduced the concept of **Memory-Mapped I/O**.

---

## Key Knowledge / 核心知识点

| English | 中文 |
|----------|------|
| BIOS Interrupt | BIOS 中断 |
| VGA Text Mode | VGA 文本模式 |
| Video Memory | 显存 |
| Physical Address | 物理地址 |
| Memory-Mapped I/O | 内存映射 I/O |
| Character Attribute | 字符属性 |
| Foreground Color | 前景色 |
| Background Color | 背景色 |
| ASCII Code | ASCII 字符编码 |

---

# Next Lesson / 下一课

**Lesson 05**

> Writing the First Character Using VGA Memory

> 使用 VGA 显存输出第一个字符

We will no longer rely on BIOS services and instead write directly to video memory.

我们将正式脱离 BIOS，开始直接操作 VGA 显存，实现字符显示。