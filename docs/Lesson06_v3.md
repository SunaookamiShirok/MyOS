# Lesson 06 (Version 3)

# Lesson 06（第三版）

## Reusable Print Routine / 可复用字符串输出函数

---

# Overview / 课程简介

## English

In this lesson, we refactor the string output logic into a reusable routine using `CALL` and `RET`.

Instead of writing the printing loop every time, we encapsulate it into a function named `print_string`, making the code cleaner, more modular, and easier to maintain.

This lesson introduces one of the most important programming concepts in operating system development: **code reuse**.

## 中文

本课将字符串输出逻辑封装成一个可复用的函数，并学习使用 `CALL` 与 `RET` 指令。

相比前一版本每次都编写完整的输出循环，本课将其封装为 `print_string`，使程序结构更加清晰，也更加容易维护。

这一课正式引入了操作系统开发中的重要思想：

**代码复用（Code Reuse）**

---

# Learning Objectives / 学习目标

After completing this lesson, you will be able to:

完成本课后，你将能够：

- CALL instruction
- RET instruction
- Procedure (Function)
- Reusable code
- Function invocation
- Basic modular programming

即：

- CALL 调用
- RET 返回
- 子程序（函数）
- 代码复用
- 函数调用
- 模块化编程思想

---

# Previous Version Review / 回顾 Version 2

Version 2 already supports string output.

第二版已经能够输出字符串。

```text
mov si,message

print:
    lodsb
    ...
```

However, the printing logic is still written directly inside `start`.

但输出代码仍然直接写在 `start` 中。

Whenever another string needs to be printed, the loop has to be written again.

如果以后还需要输出其它字符串，就需要再次编写输出循环。

This leads to duplicated code.

这样会造成代码重复。

---

# New Idea / 新思路

Instead of writing the printing loop repeatedly,

我们不再重复编写输出循环，

we move it into a reusable routine.

而是把它封装成一个可复用函数。

Program structure becomes:

程序结构变成：

```text
start
 │
 ├── call print_string
 │
 ├── call print_string
 │
 └── ...

print_string
 │
 ├── output characters
 │
 └── ret
```

---

# New Instructions / 新指令

## CALL

```asm
call print_string
```

CALL performs two operations:

- Save return address
- Jump to target routine

CALL 完成两件事情：

- 保存返回地址
- 跳转到函数

---

## RET

```asm
ret
```

RET returns to the instruction following CALL.

RET 会返回到 CALL 后面的下一条指令。

---

# Program Flow / 程序执行流程

```text
Program Start
      │
      ▼
CALL print_string
      │
      ▼
LODSB
      │
      ▼
Character == 0 ?
      │
 ┌────┴────┐
 │         │
 No       Yes
 │         │
 ▼         ▼
Write     RET
to VGA     │
 │         ▼
 └────────►Return
```
---

# Advantages / 优势

Compared with Version 2:

相比第二版：

✅ Better code reuse

代码可以重复利用。

✅ Cleaner structure

程序结构更加清晰。

✅ Easier maintenance

更加容易维护。

✅ Foundation for screen driver

为后续 Screen Driver 做准备。

---

# Comparison of Three Versions / 三个版本对比

| Version   | Goal                      | New Knowledge   | Programming Idea            |
| --------- | ------------------------- | --------------- | --------------------------- |
| Version 1 | Print multiple characters | VGA memory, DI  | Direct hardware programming |
| Version 2 | Print strings             | SI, LODSB, Loop | String processing           |
| Version 3 | Reusable print routine    | CALL, RET       | Modular programming         |


中文：

| 版本 | 目标 | 学习重点 | 编程思想 |
|------|------|----------|----------|
| v1 | 多字符输出 | VGA、DI | 直接操作硬件 |
| v2 | 字符串输出 | SI、LODSB | 字符串处理 |
| v3 | 可复用输出函数 | CALL、RET | 模块化设计 |


---

# Evolution / 演进过程

```text
Lesson06(v1)

Print Characters

        │

        ▼

Lesson06(v2)

Print String

        │

        ▼

Lesson06(v3)

Reusable Print Routine

        │

        ▼

Lesson07

Screen Driver
```

---

# Source Code Evolution / 源码演进

```text
Lesson06(v1)

mov [es:di], 'H'
mov [es:di+2], 'e'
mov [es:di+4], 'l'

        │
        ▼

Lesson06(v2)

lodsb
loop

        │
        ▼

Lesson06(v3)

call print_string

        │
        ▼

Lesson07

screen driver
```

The implementation evolved from direct hardware operations to reusable procedures.

本系列课程实现了从直接操作硬件到模块化程序设计的演进。

---

# Key Takeaways / 本课总结

## English

- Learned CALL instruction.
- Learned RET instruction.
- Built the first reusable routine.
- Introduced modular programming.
- Prepared for screen driver development.

## 中文

- 学会了 CALL 指令。
- 学会了 RET 指令。
- 编写了第一个可复用函数。
- 初步理解模块化程序设计。
- 为屏幕驱动开发做好准备。

---

# Next Lesson / 下一课

## English

Lesson 07 marks the transition from learning individual assembly instructions to building reusable operating system components.

The screen driver will gradually encapsulate operations such as:

- Character Output
- String Output
- Cursor Management
- New Line
- Screen Clear

## 中文

Lesson 07 将标志着课程从学习单个汇编指令正式过渡到构建可复用的操作系统组件。

下一课我们将开始构建真正意义上的屏幕驱动，并逐步封装：

- Character Output（字符输出）
- String Output（字符串输出）
- Cursor Management（光标管理）
- New Line（换行）
- Screen Clear（清屏）

---

Happy Coding!

祝开发愉快！