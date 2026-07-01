# Lesson 06 (Version 1) - Multiple Character Output
# 第6课（第一版）- 多字符输出

---

## 📖 Learning Objectives / 学习目标

### English

In this lesson, we begin displaying multiple characters directly through VGA video memory.

Instead of manually calculating memory addresses, we use the **DI register** as a pointer to manage the current output position.

Topics include:

- Review VGA text mode memory layout
- Understand why each character occupies 2 bytes
- Use the DI register to manage screen position
- Output multiple characters
- Prepare for string output

### 中文

本课开始学习如何直接通过 VGA 显存输出多个字符。

我们不再手动计算每个显存地址，而是使用 **DI 寄存器**作为当前位置指针来管理输出位置。

主要内容包括：

- 回顾 VGA 文本模式显存布局
- 理解为什么每个字符占用 2 字节
- 使用 DI 管理输出位置
- 输出多个字符
- 为字符串输出做准备

---

# 1. Review VGA Memory / 回顾 VGA 显存

### English

The VGA text buffer begins at:

```
0xB8000
```

Each character occupies **2 bytes**:

```
+-----------+-----------+
| Character | Attribute |
+-----------+-----------+
```

For example:

```
Address

0  -> 'H'
1  -> 0x0F

2  -> 'e'
3  -> 0x0F

4  -> 'l'
5  -> 0x0F
```

### 中文

VGA 文本模式显存起始地址为：

```
0xB8000
```

每个字符占用 **2 个字节**：

```
字符

+

颜色属性
```

例如：

```
0 -> H

1 -> 颜色

2 -> e

3 -> 颜色

4 -> l

5 -> 颜色
```

因此，每输出一个字符，需要移动：

```
2 Bytes
```

---

# 2. Why Use DI? / 为什么使用 DI？

### English

Instead of calculating every memory address manually:

```asm
mov byte [es:0],'H'
mov byte [es:2],'e'
mov byte [es:4],'l'
```

we use the **DI register** to record the current screen position.

After writing one character:

```asm
add di,2
```

DI automatically points to the next character position.

### 中文

如果继续手动计算地址：

```asm
mov byte [es:0],'H'
mov byte [es:2],'e'
mov byte [es:4],'l'
```

代码会越来越难维护。

因此，本课开始使用 **DI 寄存器**记录当前输出位置。

每写完一个字符：

```asm
add di,2
```

DI 自动移动到下一个字符的位置。

---

# 3. Output Multiple Characters / 输出多个字符

The output sequence becomes:

```
Write Character

↓

Write Attribute

↓

DI += 2

↓

Next Character
```

Example:

```asm
mov byte [es:di],'H'
mov byte [es:di+1],0x0F

add di,2

mov byte [es:di],'e'
mov byte [es:di+1],0x0F
```

### 中文

字符输出流程变为：

```
写字符

↓

写颜色

↓

DI 加 2

↓

继续输出下一个字符
```

这样无需手动计算显存地址。

---

# 4. Program Execution / 程序执行流程

CPU executes the following sequence:

```
DI = 0

↓

Write 'H'

↓

DI = 2

↓

Write 'e'

↓

DI = 4

↓

Write 'l'

↓

DI = 6

↓

Write 'l'

↓

DI = 8

↓

Write 'o'
```

### 中文

CPU 实际执行流程：

```
DI 初始化为 0

↓

输出 H

↓

DI 加 2

↓

输出 e

↓

DI 加 2

↓

输出 l

↓

……

直到完成整个单词
```

---

# 5. Advantages / 优点

### English

Compared with manually calculating addresses:

- Easier to understand
- Easier to modify
- Easier to expand
- More suitable for future drivers

### 中文

相比直接计算地址：

- 代码更加清晰
- 更容易修改
- 更方便扩展
- 更适合后续屏幕驱动开发

---

# 6. Current Limitation / 当前存在的问题

Although the output position is now managed by DI,

we still need to write every character manually.

For example:

```asm
mov byte [es:di],'H'
...
mov byte [es:di],'e'
...
mov byte [es:di],'l'
...
```

The code contains a large amount of repetition.

### 中文

虽然已经使用 DI 管理输出位置，

但仍然需要一个字符一个字符地编写代码。

例如：

```
H

↓

e

↓

l

↓

l

↓

o
```

除了字符不同，其余代码完全重复。

这说明程序还有进一步优化的空间。

---

# 7. Looking Ahead / 下一步

The next version will store characters inside memory:

```asm
message db "Hello MyOS",0
```

Then the CPU will:

```
Read Character

↓

Output Character

↓

DI += 2

↓

Read Next Character
```

until the string terminator (`0`) is reached.

### 中文

下一版本将不再把字符写死在代码中，而是存放到内存：

```asm
message db "Hello MyOS",0
```

CPU 将自动：

```
读取字符

↓

输出字符

↓

DI 加 2

↓

继续读取

↓

直到读取到 0
```

这将成为 MyOS 第一个真正意义上的字符串输出模块。

---

# Summary / 本课总结

✅ Reviewed VGA text memory layout.

✅ Learned why each character occupies 2 bytes.

✅ Used DI as the current output pointer.

✅ Displayed multiple characters.

✅ Prepared for automatic string output.

---

## Key Knowledge / 核心知识点

| English | 中文 |
|----------|------|
| VGA Memory | VGA 显存 |
| Character Cell | 字符单元 |
| Attribute Byte | 属性字节 |
| DI Register | DI 寄存器 |
| Memory Offset | 内存偏移 |
| Pointer | 指针 |
| Sequential Output | 顺序输出 |
| Screen Position | 屏幕输出位置 |

---

# Exercises / 课后练习

1. 将 `"Hello"` 修改为 `"MyOS"`。
2. 尝试输出 `"Hello MyOS"`。
3. 给每个字符设置不同颜色。
4. 思考：

为什么使用 DI 比直接计算地址更加方便？

---

# Next Lesson / 下一课

**Lesson 06 (Version 2)**

> String Output Using Loop

> 使用循环输出字符串

We will store strings in memory and output them automatically using a loop, creating the first reusable screen output routine for MyOS.

我们将学习把字符串存储在内存中，并利用循环自动输出整个字符串，实现 MyOS 第一个可复用的屏幕输出模块。