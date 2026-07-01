# Lesson 05 - Direct VGA Memory Output
# 第5课 - 直接操作 VGA 显存输出

---

## 📖 Learning Objectives / 学习目标

### English

In this lesson, we learned how to display characters by writing directly to VGA video memory instead of relying on BIOS interrupt services.

Topics include:

- Initialize CPU segment registers
- Initialize the stack
- Set VGA text mode
- Access VGA video memory
- Display characters by writing to memory

### 中文

本课学习如何不依赖 BIOS 中断，而是直接操作 VGA 显存完成字符输出。

主要内容包括：

- 初始化段寄存器
- 初始化栈
- 设置 VGA 文本模式
- 访问 VGA 显存
- 通过写显存显示字符

---

# 1. Bootloader Initialization / Bootloader 初始化

### English

Before accessing hardware directly, the CPU environment should be initialized.

```asm
cli

xor ax, ax

mov ds, ax
mov ss, ax
mov sp, 0x7C00
```

### 中文

在直接访问硬件之前，需要先初始化 CPU 的运行环境。

主要完成：

- 禁止中断（CLI）
- 初始化数据段（DS）
- 初始化栈段（SS）
- 初始化栈指针（SP）

这样能够保证程序运行更加稳定。

---

# 2. VGA Text Mode / VGA 文本模式

### English

The BIOS can switch the display into 80×25 VGA text mode.

```asm
mov ax,0x0003
int 0x10
```

Mode 03 provides:

- 80 columns
- 25 rows
- Color text display

### 中文

通过 BIOS 可以切换到 VGA 文本模式：

```asm
mov ax,0x0003
int 0x10
```

Mode 03 提供：

- 80 列
- 25 行
- 彩色文本显示

虽然很多 BIOS 默认已经是该模式，但主动初始化更加可靠。

---

# 3. VGA Video Memory / VGA 显存

### English

The VGA text buffer starts at:

```
0xB8000
```

In Real Mode:

```
Segment : Offset

0xB800 : 0x0000
```

Physical Address:

```
0xB800 × 16

=

0xB8000
```

### 中文

VGA 文本模式显存位于：

```
0xB8000
```

在实模式下：

```
ES = 0xB800

DI = 0
```

CPU 实际访问：

```
0xB8000
```

即屏幕左上角。

---

# 4. Writing Characters / 写入字符

Each character occupies **2 bytes**.

```
+------------+--------------+
| Character  | Attribute    |
+------------+--------------+
```

Example:

```asm
mov al,'H'

mov [es:di],al

mov byte [es:di+1],0x0F
```

Meaning:

```
'H'

↓

ASCII

↓

Video Memory

↓

Screen
```

### 中文

字符首先写入显存：

```
'H'
```

随后写入颜色属性：

```
0x0F
```

最终 VGA 控制器自动完成显示。

---

# 5. Segment Registers / 段寄存器

### English

This lesson introduced several important segment registers.

| Register | Purpose |
|----------|----------|
| DS | Data Segment |
| ES | Extra Segment |
| SS | Stack Segment |
| SP | Stack Pointer |

### 中文

本课学习了几个重要寄存器：

| 寄存器 | 作用 |
|---------|------|
| DS | 数据段 |
| ES | 附加段（显存等） |
| SS | 栈段 |
| SP | 栈指针 |

这些寄存器将在后续内核开发中频繁使用。

---

# 6. Direct Hardware Access / 直接操作硬件

Previously:

```
CPU

↓

BIOS

↓

Screen
```

Now:

```
CPU

↓

VGA Memory

↓

VGA Controller

↓

Screen
```

### 中文

之前：

```
CPU

↓

BIOS

↓

屏幕
```

现在：

```
CPU

↓

VGA 显存

↓

VGA 控制器

↓

屏幕
```

这意味着 MyOS 开始逐步摆脱 BIOS，真正开始直接控制硬件。

---

# Summary / 本课总结

✅ Initialized CPU segment registers.

✅ Initialized the stack.

✅ Learned how to switch VGA text mode.

✅ Learned how to access VGA video memory.

✅ Learned how to display characters by writing directly to memory.

✅ Entered the first stage of direct hardware programming.

---

## Key Knowledge / 核心知识点

| English | 中文 |
|----------|------|
| Segment Register | 段寄存器 |
| Data Segment | 数据段 |
| Stack Segment | 栈段 |
| Extra Segment | 附加段 |
| Stack Pointer | 栈指针 |
| VGA Video Memory | VGA 显存 |
| Real Mode | 实模式 |
| Physical Address | 物理地址 |
| Direct Hardware Access | 直接操作硬件 |

---

# Exercises / 课后练习

1. 将显示字符由 `'H'` 修改为 `'A'`、`'Z'`、`'@'`。
2. 尝试修改不同的颜色属性，例如：

```
0x07
0x0F
0x1E
0x4F
```

观察字符颜色变化。

3. 思考：

为什么 BIOS 可以显示字符，而直接写显存也能够显示字符？

---

# Next Lesson / 下一课

**Lesson 06**

> Multiple Character Output

> 输出多个字符

We will display multiple characters by writing continuously into VGA memory and begin implementing a simple screen output routine.

我们将学习如何连续写入 VGA 显存，实现多个字符输出，并开始编写简单的屏幕输出例程，为后续 Screen Driver 做准备。