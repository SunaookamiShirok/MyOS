# Lesson08_v3_2 - Cursor Position Synchronization / 光标位置同步

Date: 2026-08-10

---

## Overview / 概述

Lesson08_v3_2 extends the VGA hardware cursor support introduced in
Lesson08_v3_1. The screen driver now maintains the cursor position in
software and synchronizes that position with the VGA hardware cursor.

Lesson08_v3_2 在 Lesson08_v3_1 的基础上继续完善 VGA 硬件光标支持。屏幕驱动程序在内存中维护光标坐标，并将该坐标同步到 VGA 硬件光标。

The implementation provides:

本版本实现了以下功能：

- Software cursor coordinates: `cursor_x` and `cursor_y`
- VGA hardware cursor position updates
- Cursor offset calculation
- Character output at the current cursor position
- Newline handling and simple cursor position wrapping

---

## Learning Goals / 学习目标

After completing this lesson, you should understand how to:

完成本课后，应当理解以下内容：

- Store and update a text-mode cursor position.
- Convert a two-dimensional cursor position into a VGA text-buffer offset.
- Write the high and low bytes of the cursor offset to VGA registers.
- Print characters and strings using the current cursor coordinates.

---

## VGA Text-Mode Coordinates / VGA 文本模式坐标

The VGA text screen contains 80 columns and 25 rows. The cursor position is
stored as two independent coordinates:

VGA 文本模式屏幕包含 80 列、25 行。光标位置由两个独立坐标保存：

| Variable | Meaning | Range |
|----------|---------|-------|
| `cursor_x` | Column / 列 | `0`–`79` |
| `cursor_y` | Row / 行 | `0`–`24` |

The VGA hardware cursor uses a linear character-cell offset rather than
separate row and column values:

VGA 硬件光标使用线性的字符单元偏移量，而不是单独的行列坐标：

```text
offset = cursor_y * 80 + cursor_x
```

Each text cell occupies two bytes in VGA memory: one byte for the character
and one byte for its attribute. Therefore, the memory address of a cell is:

每个文本单元在 VGA 显存中占用两个字节：一个字节保存字符，一个字节保存属性。因此，字符单元的显存地址为：

```text
video_address = 0xB8000 + offset * 2
```

---

## VGA Cursor Registers / VGA 光标寄存器

The VGA CRT Controller is accessed through an index port and a data port.

VGA CRT Controller 通过索引端口和数据端口访问：

| Register | Index | Function / 功能 |
|----------|-------|-----------------|
| Cursor Start Scan Line Register | `0x0A` | Cursor start scan line / 光标起始扫描线 |
| Cursor End Scan Line Register | `0x0B` | Cursor end scan line / 光标结束扫描线 |
| Cursor Location High Register | `0x0E` | High byte of cursor offset / 光标偏移量高字节 |
| Cursor Location Low Register | `0x0F` | Low byte of cursor offset / 光标偏移量低字节 |

```text
Index port: 0x3D4
Data port : 0x3D5
```

To update a register, first write its index to `0x3D4`, then write the value
to `0x3D5`.

更新寄存器时，先将寄存器索引写入 `0x3D4`，再将寄存器值写入 `0x3D5`。

---

## Program Flow / 程序流程

```text
Start
  |
  v
Initialize segment registers and stack
  |
  v
Initialize VGA hardware cursor
  |
  v
Clear screen and reset cursor coordinates
  |
  v
Print "HELLO MYOS"
  |
  v
Halt
```

---

## Implementation / 实现

### 1. Hardware Cursor Initialization / 硬件光标初始化

`init_cursor` configures the cursor scan-line range and sets the initial
cursor offset to zero. Scan lines `0` through `15` are enabled, producing a
full-height cursor for a standard 16-scan-line text cell.

`init_cursor` 配置光标扫描线范围，并将光标初始偏移量设置为零。本版本启用第 `0` 至第 `15` 条扫描线，在标准 16 扫描线字符单元中显示全高度光标。

### 2. Updating the Hardware Cursor / 更新硬件光标

`update_cursor` receives the linear cursor offset in `AX`. It writes:

`update_cursor` 接收 `AX` 中的线性光标偏移量，并分别写入：

- `AH` to register `0x0E` as the high byte.
- `AL` to register `0x0F` as the low byte.

### 3. Calculating the Cursor Offset / 计算光标偏移量

`calculate_cursor` converts the software coordinates into a linear offset:

```text
AX = cursor_y * 80 + cursor_x
```

It then calls `update_cursor` to synchronize the VGA hardware cursor.

随后调用 `update_cursor`，将计算结果同步到 VGA 硬件光标。

### 4. Clearing the Screen / 清屏

`clear_screen` writes `0x0720` to all 2000 text cells:

```text
0x07  = light-gray text attribute
0x20  = space character
```

After clearing the screen, both `cursor_x` and `cursor_y` are reset to zero,
and the hardware cursor is moved to the top-left corner.

清屏完成后，`cursor_x` 和 `cursor_y` 都被重置为零，并将硬件光标移动到屏幕左上角。

### 5. Printing a Character / 输出单个字符

`print_char` accepts the character in `AL` and calculates its position using
the current coordinates:

`print_char` 从 `AL` 接收字符，并根据当前坐标计算其位置：

```text
character_cell = cursor_y * 80 + cursor_x
video_offset   = character_cell * 2
```

The character is written with attribute `0x07`, then `cursor_x` is increased
by one and the hardware cursor is updated.

字符以属性 `0x07` 写入显存，随后 `cursor_x` 加一，并更新硬件光标。

### 6. Printing a String / 输出字符串

`print_string` reads bytes from the string pointed to by `SI` until it finds a
null terminator. A line-feed character (`0x0A`) resets the column to zero and
advances the row by one.

`print_string` 从 `SI` 指向的地址读取字符串，直到遇到空终止符。遇到换行符（`0x0A`）时，列坐标清零，行坐标加一。

When the row reaches 25, it wraps back to the first row.
This is a simple wrap policy; scrolling has not yet been implemented.

当行坐标达到25时，程序重新回到第一行。
这是简单的回绕策略，目前尚未实现滚屏。

---


## File Changes / 文件变化

Added:

- Lesson08_v3_2.asm
- Lesson08_v3_2.md

The assembly source implements cursor synchronization, while this document
describes its data flow, VGA register operations, and screen-driver logic.

汇编源文件实现光标同步功能，本文件说明其数据流、VGA 寄存器操作以及屏幕驱动逻辑。

---

## Current Status / 当前状态

| Feature / 功能 | Status / 状态 |
|----------------|----------------|
| VGA cursor scan-line configuration / VGA 光标扫描线配置 | Completed / 已完成 |
| Software cursor coordinate storage / 软件光标坐标保存 | Completed / 已完成 |
| Cursor offset calculation / 光标偏移量计算 | Completed / 已完成 |
| Hardware cursor location update / 硬件光标位置更新 | Completed / 已完成 |
| Character output by coordinates / 按坐标输出字符 | Completed / 已完成 |
| Scrolling / 屏幕滚动 | Not implemented / 未实现 |

---

## Summary / 总结

Lesson08_v3_2 connects the software cursor coordinate system with the VGA
hardware cursor. Every character output updates both the text buffer and the
hardware cursor position.

Lesson08_v3_2 将软件光标坐标系统与 VGA 硬件光标连接起来。每次输出字符时，程序同时更新文本显存和硬件光标位置。

The main relationship is:

核心关系如下：

```text
cursor_x, cursor_y
        |
        v
offset = cursor_y * 80 + cursor_x
        |
        v
VGA cursor registers 0x0E and 0x0F
```

The next improvement can add automatic wrapping and scrolling when the
cursor reaches the end of a line or the bottom of the screen.

下一步可以在光标到达行尾或屏幕底部时，实现自动换行和屏幕滚动。

---

Happy Coding!

祝开发愉快！
