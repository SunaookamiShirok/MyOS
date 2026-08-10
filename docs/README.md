# MyOS Documentation / MyOS 文档

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
├── Lesson08_v3_3.md (In Development)
└── ...
```

# Lessons / 课程目录

| Lesson / 课程 | Description / 描述 |
|--------------|--------------------|
| Lesson01 | Bootloader / 启动加载程序 |
| Lesson02 | BIOS Character Output / BIOS 字符输出 |
| Lesson03 | BIOS String Output / BIOS 字符串输出 |
| Lesson04 | Understanding VGA Text Mode / 理解 VGA 文本模式 |
| Lesson05 | Direct VGA Memory Output / 直接操作 VGA 显存 |
| Lesson06_v1 | Multiple Character Output / 多字符输出 |
| Lesson06_v2 | String Output Using Loop / 循环输出字符串 |
| Lesson06_v3 | Reusable Print Routine / 可复用字符串输出函数 |
| Lesson07 | Screen Driver / 屏幕驱动 |
| Lesson08_v1 | Screen Driver Refactoring / 屏幕驱动重构 |
| Lesson08_v2 | Software Cursor / 软件光标 |
| Lesson08_v3_1 | Hardware Cursor Initialization / 硬件光标初始化 |
| Lesson08_v3_2 | Cursor Position Synchronization / 光标位置同步 |
| Lesson08_v3_3 | Hardware Cursor Driver Integration / 硬件光标驱动集成 |

---

# Learning Roadmap / 学习路线
```
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
    │
    ▼
Lesson 08 (Version 3.1) - Hardware Cursor Initialization
    │
    ▼
Lesson 08 (Version 3.2) - Cursor Position Synchronization
    │
    ▼
Lesson 08 (Version 3.3) - Hardware Cursor Driver Integration
    │
    ▼
Complete Phase 2 - Hardware Access
    │
    ▼
Phase 3 - Protected Mode
```
---

# Current Progress / 当前进度

| Item / 项目 | Status / 状态 |
|------------|---------------|
| Current Version / 当前版本 | **v0.2.1-dev** |
| Current Stage / 当前阶段 | **Hardware Access / 硬件访问** |
| Current Development / 当前开发 | **Lesson 08 (Version 3.3) - Hardware Cursor Driver Integration** |


## Lesson08_v3 - Hardware Cursor System

### Lesson08_v3_1 ✅ Completed

Hardware Cursor Initialization

Status:

Completed

Goals:

- Access VGA cursor registers
- Initialize hardware cursor
- Configure cursor scan line parameters
- Enable hardware cursor display


### Lesson08_v3_2 ✅ Completed

Cursor Position Synchronization

Status:

Completed

Goals:

- Synchronize hardware cursor state with screen driver
- Update VGA cursor position
- Connect VGA cursor position with internal screen coordinates


### Lesson08_v3_3 🚧 In Development

Hardware Cursor Driver Integration

Status:

In Development

Goals:

- Integrate hardware cursor into screen driver
- Provide unified cursor control interface
- Complete cursor management system
- Prepare foundation for console output

---

> Documentation will continue to grow alongside MyOS.

> 本文档将随着 MyOS 的开发持续更新。

---

## Current Lesson / 当前课程

Lesson08_v3_3 - Hardware Cursor Driver Integration

Integrate VGA hardware cursor control into the screen driver layer.

将 VGA 硬件光标控制集成到屏幕驱动层。

---

Happy Coding!

祝开发愉快！
