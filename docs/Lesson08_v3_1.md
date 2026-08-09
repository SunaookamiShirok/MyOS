# Lesson08_v3_1 - Hardware Cursor Initialization / 硬件光标初始化

---

## Overview / 概述

### English

In Lesson08_v2, MyOS implemented a software cursor by modifying VGA text memory.

The software cursor works by replacing the character at the current position with a cursor symbol and restoring the original character when the cursor moves.

However, this method has several limitations:

- The cursor occupies actual screen memory.
- Character data must be saved and restored manually.
- Cursor management becomes complicated when developing a complete screen driver.

In this lesson, MyOS begins implementing VGA hardware cursor support.

The hardware cursor is controlled by VGA registers through I/O ports and is managed directly by the VGA controller.

### 中文

在 Lesson08_v2 中，MyOS 通过修改 VGA 文本显存实现了软件光标。

软件光标通过替换当前位置字符实现显示，并在移动时恢复原字符。

但是这种方式存在一些问题：

- 光标会占用实际显存内容。
- 需要手动保存和恢复字符数据。
- 当屏幕驱动功能增加后，光标管理会越来越复杂。

本课开始实现 VGA 硬件光标。

硬件光标通过 I/O 端口访问 VGA 寄存器，由 VGA 控制器直接管理。

---

# Learning Goals / 学习目标

After completing this lesson:

完成本课后：

- Understand VGA hardware cursor mechanism
- Learn VGA register access through I/O ports
- Initialize hardware cursor
- Enable hardware cursor display

学习：

- 理解 VGA 硬件光标工作机制
- 学习通过 I/O 端口访问 VGA 寄存器
- 初始化硬件光标
- 开启硬件光标显示

---

# VGA Hardware Cursor / VGA 硬件光标

## VGA Cursor Registers / VGA 光标寄存器

The VGA hardware cursor is controlled by two registers:

VGA 硬件光标主要由两个寄存器控制：

| Register | Index | Function |
| --- | --- | --- |
| Cursor Start Register | 0x0A | Cursor start scan line |
| Cursor End Register | 0x0B | Cursor end scan line |

---

## VGA I/O Ports / VGA I/O 端口

VGA registers are accessed through:

VGA 寄存器通过以下端口访问：
Index Port:
0x3D4

Data Port:
0x3D5


Access process:

访问流程：

Write register index to 0x3D4
Write register value to 0x3D5


---

# Implementation / 实现

## Hardware Cursor Initialization

## 硬件光标初始化

```asm
enable_hardware_cursor:

    ; Select Cursor Start Register
    mov dx,0x3D4
    mov al,0x0A
    out dx,al

    ; Enable cursor
    mov dx,0x3D5
    mov al,0x06
    out dx,al


    ; Select Cursor End Register
    mov dx,0x3D4
    mov al,0x0B
    out dx,al

    ; Set cursor end line
    mov dx,0x3D5
    mov al,0x07
    out dx,al

    ret
```
Boot Flow / 启动流程

After initialization:

初始化完成后：

start

  |
  v

VGA Initialization

  |
  v

Enable Hardware Cursor

  |
  v

Clear Screen

  |
  v

Print String

  |
  v

Hardware Cursor Display

Software Cursor VS Hardware Cursor
软件光标与硬件光标对比
Feature	Software Cursor	Hardware Cursor
Implementation	Modify VGA memory	VGA controller
Storage	Need save character	No character storage
Management	Software controlled	Hardware controlled
Performance	More CPU operations	Hardware handled

Problems Solved / 解决的问题
Software Cursor Problems

软件光标存在的问题：

1. Character Replacement

光标需要覆盖当前字符：

Before:

A

After:

_

移动后需要恢复：

_

↓

A
2. Cursor State Management

软件需要维护：

Current Position

+

Saved Character

+

Cursor Status
Hardware Cursor Improvement

硬件光标：

CPU

 |

I/O Port

 |

VGA Register

 |

Hardware Cursor

光标显示由 VGA 控制器完成。

File Changes / 文件变化

Added:

新增：

archives/
└── Lesson08_v3_1.asm

Documentation:

文档：

docs/
└── Lesson08_v3_1.md
Current Status / 当前状态
Feature	Status
VGA Cursor Register Access	✅ Completed
Hardware Cursor Initialization	✅ Completed
Hardware Cursor Display	✅ Completed
Cursor Position Update	⏳ Next Lesson
Next Lesson / 下一课
Lesson08_v3_2 - Cursor Position Synchronization

Goals:

目标：

Synchronize cursor position with screen driver
Update VGA hardware cursor location
Integrate cursor movement control
Summary / 总结

Lesson08_v3_1 introduces the VGA hardware cursor system.

Lesson08_v3_1 开始引入 VGA 硬件光标系统。

Compared with the software cursor, the hardware cursor is managed by VGA hardware and does not modify screen memory.

相比软件光标，硬件光标由 VGA 硬件管理，不需要修改显存内容。

This provides the foundation for a complete screen driver.

这为后续完整屏幕驱动开发提供基础。

Happy Coding!

祝开发愉快！