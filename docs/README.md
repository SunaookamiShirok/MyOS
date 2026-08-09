# MyOS Documentation

# MyOS 文档

---

## English

This directory contains all documentation, tutorials, and development notes for MyOS.

Each lesson represents a milestone in the operating system development process.

---

## 中文

本目录保存 MyOS 的所有开发文档、教程和学习笔记。

每一课对应操作系统开发过程中的一个里程碑。

---

# Documentation Structure / 文档结构

```text
docs/
├── README.md
├── Lesson01.md
├── Lesson02.md
├── Lesson03.md
├── Lesson04.md
├── Lesson05.md
├── Lesson06_v1.md
├── Lesson06_v2.md
├── Lesson06_v3.md
├── Lesson07.md
├── Lesson08_v1.md
├── Lesson08_v2.md
├── Lesson08_v3_1.md
├── Lesson08_v3_2.md
├── Lesson08_v3_3.md
└── ...

# Lessons / 课程目录

| Lesson / 课程 | Description / 描述 |
|--------------|--------------------|
| Lesson 01 | Bootloader / 启动加载程序 |
| Lesson 02 | BIOS Character Output / BIOS 字符输出 |
| Lesson 03 | BIOS String Output / BIOS 字符串输出 |
| Lesson 04 | Understanding VGA Text Mode / 理解 VGA 文本模式 |
| Lesson 05 | Direct VGA Memory Output / 直接操作 VGA 显存 |
| Lesson 06 (Version 1) | Multiple Character Output / 多字符输出 |
| Lesson 06 (Version 2) | String Output Using Loop / 循环输出字符串 |
| Lesson 06 (Version 3) | Reusable Print Routine / 可复用字符串输出函数 |
| Lesson 07 | Screen Driver / 屏幕驱动 |
| Lesson 08 (Version 1) | Screen Driver Refactoring / 屏幕驱动重构 |
| Lesson 08 (Version 2) | Software Cursor / 软件光标 |
| Lesson 08 (Version 3.1) | Hardware Cursor Control / 硬件光标控制 |
| Lesson 08 (Version 3.2) | Cursor Position Management / 光标位置管理 |
| Lesson 08 (Version 3.3) | Hardware Cursor Driver / 硬件光标驱动 |

---

# Learning Roadmap / 学习路线

Lesson 01 - Bootloader
    │
    ▼
Lesson 02 - BIOS Character Output
    │
    ▼
Lesson 03 - BIOS String Output
    │
    ▼
Lesson 04 - Understanding VGA Text Mode
    │
    ▼
Lesson 05 - Direct VGA Memory Output
    │
    ▼
Lesson 06 (Version 1) - Multiple Character Output
    │
    ▼
Lesson 06 (Version 2) - String Output Using Loop
    │
    ▼
Lesson 06 (Version 3) - Reusable Print Routine
    │
    ▼
Lesson 07 - Screen Driver
    │
    ▼
Lesson 08 (Version 1) - Screen Driver Refactoring
    │
    ▼
Lesson 08 (Version 2) - Software Cursor
    |
    ▼
Lesson 08 (Version 3.1) - Hardware Cursor Control
    |
    ▼
Lesson 08 (Version 3.2) - Cursor Position Management
    |
    ▼
Lesson 08 (Version 3.3) - Hardware Cursor Driver
    |
    ▼
Phase 3 - Protected Mode
```

# Current Progress / 当前进度

| Item / 项目 | Status / 状态 |
|------------|---------------|
| Current Version / 当前版本 | **v0.2.1-dev** |
| Current Stage / 当前阶段 | **Hardware Access / 硬件访问** |
| Latest Lesson / 最新课程 | **Lesson 08 (Version 3.1) - Hardware Cursor System** |

---

> Documentation will continue to grow alongside MyOS.

> 本文档将随着 MyOS 的开发持续更新。

---

## Next Lesson / 下一课

**Lesson 08 (Version 3.1) — Hardware Cursor Control**

Implement VGA hardware cursor control through VGA I/O ports.

通过 VGA I/O 端口实现硬件光标控制。

---

# Development Notes / 开发记录

## Lesson 08

### v3.1
- Enable VGA hardware cursor
- Configure cursor start/end registers
- Test cursor visibility

### v3.2
- Implement cursor position update
- Synchronize cursor with screen driver

### v3.3
- Integrate hardware cursor into print system
- Complete VGA cursor driver

---

Happy Coding!

祝开发愉快！
