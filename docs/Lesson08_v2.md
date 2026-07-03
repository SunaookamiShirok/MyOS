# Lesson 08 (Version 2)

# Software Cursor / 软件光标

---

## English

In this lesson, we implement a basic software cursor based on the screen driver developed in Version 1.

Instead of relying on the VGA hardware cursor, the cursor is now drawn directly into VGA text memory. Before drawing the cursor, the driver saves the original character at the cursor position and restores it when the cursor moves.

This demonstrates how an operating system can completely manage cursor rendering in software.

---

## 中文

本课将在 Version 1 屏幕驱动的基础上，实现一个简单的软件光标。

软件光标不再依赖 VGA 提供的硬件光标，而是直接修改 VGA 文本显存进行绘制。绘制光标前，驱动会保存当前位置原有字符；移动光标时，再恢复原来的字符。

这一课展示了操作系统如何完全通过软件控制光标显示。

---

# Objectives / 学习目标

### English

After completing this lesson, you will learn how to:

- Disable the VGA hardware cursor
- Draw a software cursor
- Save the original character beneath the cursor
- Restore the original character when moving
- Update the cursor position after printing

### 中文

完成本课后，你将学会：

- 禁用 VGA 硬件光标
- 实现软件光标
- 保存光标覆盖的字符
- 光标移动前恢复字符
- 输出字符后更新光标位置

---

# New Functions / 新增函数

## disable_hardware_cursor()

### English

Disables the VGA hardware cursor through CRT Controller registers.

### 中文

通过 VGA CRT Controller 寄存器关闭硬件光标。

---

## draw_cursor()

### English

Draws the software cursor at the current cursor position.

### 中文

在当前光标位置绘制软件光标。

---

## erase_cursor()

### English

Restores the original character before the cursor moves.

### 中文

在移动光标之前恢复原来的字符。

---

# New Variables / 新增变量

| Variable | Description | 中文说明 |
|----------|-------------|----------|
| cursor_x | Cursor column | 光标列坐标 |
| cursor_y | Cursor row | 光标行坐标 |
| cursor_offset | VGA memory offset | 当前光标显存偏移 |
| cursor_saved | Saved character | 保存被覆盖的字符 |

---

# Workflow / 工作流程

```text
Print Character
        │
        ▼
Erase Previous Cursor
        │
        ▼
Write Character
        │
        ▼
Update Cursor Position
        │
        ▼
Draw Software Cursor
```

对应中文：

```text
输出字符
    │
    ▼
恢复旧光标
    │
    ▼
写入字符
    │
    ▼
更新光标位置
    │
    ▼
绘制新光标
```

---

# Result / 实现效果

### English

The screen driver can now:

- Disable the VGA hardware cursor
- Display a software cursor
- Restore overwritten characters
- Track the current cursor position

### 中文

现在屏幕驱动已经能够：

- 关闭 VGA 硬件光标
- 显示软件光标
- 恢复被覆盖的字符
- 维护当前光标位置

---

# Current Limitations / 当前限制

### English

The current implementation does not yet support:

- Newline (`\n`)
- Carriage Return (`\r`)
- Backspace
- Tab
- Screen Scrolling

These features will be implemented in future lessons.

### 中文

当前版本暂未支持：

- 换行（`\n`）
- 回车（`\r`）
- Backspace（退格）
- Tab（制表符）
- 屏幕滚动（Scrolling）

这些功能将在后续课程中逐步实现。

---

# Summary / 本课总结

### English

In Version 2, the screen driver evolves from simple text output to basic cursor management.

Instead of relying on VGA hardware, MyOS now controls the cursor entirely through software, providing a more flexible foundation for future console development.

### 中文

Version 2 标志着屏幕驱动从简单输出发展到基本光标管理。

MyOS 不再依赖 VGA 硬件光标，而是完全通过软件控制光标显示，为后续控制台驱动和内核开发打下基础。

---

# Next Lesson / 下一课

**Lesson 08 (Version 3)**

**Hardware Cursor / 硬件光标**

Implement a hardware cursor driver and improve the screen driver.

实现 VGA 硬件光标驱动，并进一步完善屏幕驱动。

---

Happy Coding!

祝开发愉快！