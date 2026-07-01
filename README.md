# MyOS

> A hobby operating system written from scratch using Assembly, C and C++.
>
> 一个使用汇编语言、C 和 C++ 从零开始编写的业余操作系统。

---

## Current Version / 当前版本

**v0.2.0-dev**

## Current Stage / 当前阶段

**Hardware Access (Development)**

**硬件访问（开发中）**

---

## Project Goals / 项目目标

### English

The purpose of this project is not only to build a simple operating system, but also to systematically learn:

- x86 Assembly
- Computer Architecture
- Operating System Principles
- C/C++ Systems Programming
- Kernel Development

### 中文

本项目不仅仅是为了编写一个操作系统，更希望通过实践系统学习：

- x86 汇编语言
- 计算机组成原理
- 操作系统原理
- C/C++ 系统编程
- 内核开发

---

## Features / 已完成功能

### v0.1.0

- ✅ Boot Sector
- ✅ BIOS Text Output
- ✅ Print First Character
- ✅ Print String

### v0.2.0-dev

- ✅ Lesson 04 - Understanding VGA Text Mode
- ✅ Lesson 05 - Direct VGA Memory Output
- ⏳ Screen Driver
- ⏳ Cursor Control
- ⏳ Multiple Character Output

---

## Project Structure / 项目结构

```text
MyOS
│
├── boot/           Bootloader source code
├── build/          Compiled binaries
├── docs/           Learning notes & lessons
├── kernel/         Kernel source (future)
├── drivers/        Device drivers (future)
├── include/        Header files (future)
│
├── README.md
├── CHANGELOG.md
├── Makefile
└── .gitignore
```

---

## Documentation / 学习文档

| Lesson | Topic |
|---------|------|
| Lesson 01 | Bootloader |
| Lesson 02 | Print First Character |
| Lesson 03 | Print String |
| Lesson 04 | Understanding VGA Text Mode |
| Lesson 05 | Direct VGA Memory Output |

Detailed notes are available in the **docs/** directory.

详细课程笔记请查看 **docs/** 目录。

---

## Roadmap / 开发路线

### ✅ v0.1.0 - Bootloader Foundation

- [x] Boot Sector
- [x] BIOS Text Output
- [x] Print First Character
- [x] Print String

### 🚧 v0.2.0-dev

- [x] Understanding VGA Text Mode
- [x] Direct VGA Memory Output
- [ ] Multiple Character Output
- [ ] Screen Driver
- [ ] Cursor Control
- [ ] Keyboard Input

### ⏳ v0.3.0 - Protected Mode

- [ ] Global Descriptor Table (GDT)
- [ ] Enter Protected Mode
- [ ] Kernel Entry

### ⏳ v0.4.0 - C/C++ Kernel

- [ ] Basic Kernel
- [ ] Console
- [ ] Kernel Main

### ⏳ v0.5.0 - Memory Management

- [ ] Physical Memory Manager
- [ ] Paging

### ⏳ v0.6.0 - Interrupt Handling

- [ ] Interrupt Descriptor Table (IDT)
- [ ] Programmable Interrupt Controller (PIC)
- [ ] Timer
- [ ] Keyboard Driver

### ⏳ v0.7.0 - File System

- [ ] FAT12 Reader
- [ ] Virtual File System

### ⏳ v0.8.0 - Shell

- [ ] Command Line Interface
- [ ] Built-in Commands

### 🎯 v1.0.0 - First Stable Release

- [ ] Interactive Shell
- [ ] File System
- [ ] User Programs

---

## Build

```bash
make
```

Run with QEMU:

```bash
make run
```

---

## Changelog / 更新日志

See:

```text
CHANGELOG.md
```

---

## License / 开源协议

This project is released under the MIT License.

本项目采用 MIT License 开源协议。

---

Happy Coding!

祝开发愉快！