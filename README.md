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

### Phase 1 - Bootloader

- [x] Bootloader Foundation
- [x] BIOS Character Output
- [x] BIOS String Output

### Phase 2 - Hardware Access

- [x] VGA Text Mode
- [x] Direct VGA Memory Output
- [x] Multiple Character Output (Version 1)
- [ ] String Output (Version 2)
- [ ] Screen Driver
- [ ] Cursor Control

### Phase 3 - Protected Mode

- [ ] A20 Line
- [ ] Global Descriptor Table (GDT)
- [ ] Enter Protected Mode

### Phase 4 - Kernel

- [ ] C/C++ Kernel
- [ ] Console Driver
- [ ] Memory Management
- [ ] Interrupt Handling

### Phase 5 - System

- [ ] Keyboard Driver
- [ ] File System
- [ ] Shell
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