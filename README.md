# Project Status

> 🚧 **Project Status:** Active Development
> 🚧 Development Version: v0.2.1-dev

# MyOS

> A hobby operating system built completely from scratch using Assembly, C, and C++.
>
> 一个使用汇编语言、C 和 C++ 从零开始开发的业余操作系统。

---

## About / 关于项目

### English

MyOS is a hobby operating system built completely from scratch using Assembly, C, and C++.

The project aims to explore computer architecture, operating system design, and low-level systems programming through hands-on development.

### 中文

MyOS 是一个完全从零开始、使用汇编语言、C 和 C++ 开发的业余操作系统项目。

项目旨在通过亲手实现操作系统，系统学习计算机体系结构、操作系统设计以及底层系统编程。

## Current Version / 当前版本

**v0.2.1-dev**

## Current Development / 当前开发

| Item | Status |
|------|--------|
| Lesson08_v3_1 Hardware Cursor Initialization | ✅ Completed |
| Lesson08_v3_2 Cursor Position Synchronization | ✅ Completed |
| Lesson08_v3_3 Hardware Cursor Driver Integration | 🚧 In Development |

Current focus:

Implementing a complete VGA hardware cursor driver layer and preparing the foundation for text console output.

当前重点：

实现完整 VGA 硬件光标驱动层，并为后续文本控制台系统提供基础。

## Current Stage / 当前阶段

**Phase 2: Hardware Access (85% Complete) / 第二阶段：硬件访问（完成度85%）**

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
- ✅ Print String
- ✅ Initial Documentation


### v0.2.1-dev

- ✅ Lesson04 - Understanding VGA Text Mode
- ✅ Lesson05 - Direct VGA Memory Output
- ✅ Lesson06_v1 - Multiple Character Output
- ✅ Lesson06_v2 - String Output Using Loop
- ✅ Lesson06_v3 - Reusable Print Routine
- ✅ Lesson07 - Basic Screen Driver
- ✅ Lesson08_v1 - Screen Driver Refactoring
- ✅ Lesson08_v2 - Software Cursor

### Lesson08_v3 - Hardware Cursor System

Completed:

- ✅ Lesson08_v3_1 - Hardware Cursor Initialization
- ✅ Lesson08_v3_2 - Cursor Position Synchronization

Current Development:

- 🚧 Lesson08_v3_3 - Hardware Cursor Driver Integration

Next:

- ⏳ Complete Lesson08_v3 Hardware Cursor System
- ⏳ Complete Phase 2 Hardware Access

## Project Structure / 项目结构

```text
MyOS
│
├── archives/      Historical source code for each lesson / 每个课程阶段的历史源码归档
├── boot/          Current bootloader implementation / 当前 Bootloader 实现
├── build/         Compiled binaries / 编译生成文件
├── docs/          Documentation and tutorials for each lesson / 每个课程对应的开发文档和教程
├── kernel/        Kernel source (future) / 内核源码（未来）
├── scripts/       Build utilities (future) / 构建工具脚本（未来）
├── drivers/       Device driver source / 设备驱动源码
├── tests/         Test programs (future) / 测试程序（未来）
├── include/       Kernel headers (future) / 内核头文件（未来）
│
├── README.md
├── CHANGELOG.md
├── LICENSE
├── Makefile
└── .gitignore
```

---

| Lesson / 课程 | Topic / 主题 |
|--------------|--------------|
| Lesson01 | Bootloader / 启动加载程序 |
| Lesson02 | Print First Character / 输出第一个字符 |
| Lesson03 | Print String / 输出字符串 |
| Lesson04 | Understanding VGA Text Mode / 理解 VGA 文本模式 |
| Lesson05 | Direct VGA Memory Output / 直接操作 VGA 显存 |
| Lesson06 (Version 1) | Multiple Character Output / 多字符输出 |
| Lesson06 (Version 2) | String Output Using Loop / 循环输出字符串 |
| Lesson06 (Version 3) | Reusable Print Routine / 可复用字符串输出函数 |
| Lesson07 | Basic Screen Driver / 屏幕驱动（基础实现） |
| Lesson08_v1 | Screen Driver Refactoring / 屏幕驱动重构 |
| Lesson08_v2 | Software Cursor / 软件光标 |
| Lesson08_v3_1 | Hardware Cursor Initialization / 硬件光标初始化 |
| Lesson08_v3_2 | Cursor Position Synchronization / 光标位置同步 |
| Lesson08_v3_3 | Hardware Cursor Driver Integration / 硬件光标驱动集成（开发中） |

For detailed tutorials, lesson notes, and the complete learning roadmap, please see **docs/README.md**.

完整教程、课程笔记及学习路线请查看 **docs/README.md**。

---

## Roadmap / 开发路线

### Phase 1 - Bootloader / 第一阶段：Bootloader

> Build a minimal bootloader capable of loading and displaying basic information.
>
> 构建最基础的 Bootloader，实现启动并完成基本信息输出。

- [x] Bootloader Foundation / Bootloader 基础
- [x] BIOS Character Output / BIOS 字符输出
- [x] BIOS String Output / BIOS 字符串输出

---

### Phase 2 - Hardware Access / 第二阶段：硬件访问

> Learn how to communicate directly with hardware without relying on BIOS services.
>
> 学习如何脱离 BIOS，直接与硬件进行交互。

- [x] Understanding VGA Text Mode / 理解 VGA 文本模式
- [x] Direct VGA Memory Output / 直接操作 VGA 显存
- [x] Multiple Character Output / 多字符输出
- [x] String Output Using Loop / 循环输出字符串
- [x] Reusable Print Routine / 可复用字符串输出函数
- [x] Basic Screen Driver / 屏幕驱动（基础实现）
- [x] Screen Driver Refactoring / 屏幕驱动重构
- [x] Software Cursor / 软件光标
- 🚧 Hardware Cursor System / 硬件光标系统
  - [x] Lesson08_v3_1 Hardware Cursor Initialization / 硬件光标初始化
  - [x] Lesson08_v3_2 Cursor Position Synchronization / 光标位置同步
  - [ ] 🚧 Lesson08_v3_3 Hardware Cursor Driver Integration / 硬件光标驱动集成
---

### Phase 3 - Protected Mode / 第三阶段：保护模式

> Switch the CPU from Real Mode to Protected Mode and prepare for kernel execution.
>
> 将 CPU 从实模式切换到保护模式，为内核运行做好准备。

- [ ] Enable A20 Line / 开启 A20 地址线
- [ ] Global Descriptor Table (GDT) / 全局描述符表（GDT）
- [ ] Enter Protected Mode / 进入保护模式

---

### Phase 4 - Kernel / 第四阶段：内核

> Build the core of the operating system, including memory and interrupt management.
>
> 构建操作系统核心，实现内存管理和中断处理等基础功能。

- [ ] C/C++ Kernel / C/C++ 内核
- [ ] Console Driver / 控制台驱动
- [ ] Memory Management / 内存管理
- [ ] Interrupt Handling / 中断处理

---

### Phase 5 - System / 第五阶段：系统

> Develop essential system components to support user interaction and program execution.
>
> 开发系统基础组件，为用户交互和程序运行提供支持。

- [ ] Keyboard Driver / 键盘驱动
- [ ] File System / 文件系统
- [ ] Shell / 命令行解释器
- [ ] User Programs / 用户程序

---

### Phase 6 - Desktop / 第六阶段：桌面环境

> Design a modern graphical desktop environment inspired by KDE while remaining lightweight.
>
> 设计一个受 KDE 启发的现代图形桌面环境，同时保持轻量化。

- [ ] Window Manager / 窗口管理器
- [ ] GUI Framework / 图形界面框架
- [ ] Desktop Environment / 桌面环境

---

### Phase 7 - Ecosystem / 第七阶段：生态系统

> Build a complete software ecosystem for MyOS, including development tools and applications.
>
> 构建 MyOS 的完整软件生态，包括开发工具和应用程序。

- [ ] Package Manager / 包管理器
- [ ] Applications / 应用程序
- [ ] SDK / 软件开发工具包

---

## Vision / 项目愿景

> Build a complete operating system from scratch while documenting every development step to serve as both a learning project and an open-source educational resource.

> 从零开始构建一个完整的操作系统，并记录每一个开发阶段，使其既是一个实践项目，也是一个开源的操作系统学习教程。

---

## Requirements / 开发环境

### Tools / 工具

- NASM (2.16+ recommended)
- GNU Make
- QEMU
- Git

### Supported Platforms / 支持的平台

- Windows (MSYS2)
- Linux
- macOS

### Recommended Environment / 编程环境

- Visual Studio Code
- MSYS2 (Windows)
- Git Bash (Windows)

---

## Build / 构建

```bash
make
```

## Run / 运行

```bash
make run
```

## Clean / 清理

```bash
make clean
```

## Debug / 调试

```bash
make debug
```



## Changelog / 更新日志

For detailed version history, please see [CHANGELOG.md](CHANGELOG.md).

详细版本记录请查看 [CHANGELOG.md](CHANGELOG.md)。

---

## Development Progress / 开发进度

各阶段开发完成情况。

Phase 1  ██████████ 100%

Phase 2  ████████░░ 85%

Phase 3  ░░░░░░░░░░ 0%

Phase 4  ░░░░░░░░░░ 0%

Phase 5  ░░░░░░░░░░ 0%

Phase 6  ░░░░░░░░░░ 0%

Phase 7  ░░░░░░░░░░ 0%

## Next Milestone / 下一阶段

| Item            | Value                                                        |
| --------------- | ------------------------------------------------------------ |
| Current Version | v0.2.1-dev                                                   |
| Current Lesson  | Lesson08_v3_3                                                |
| Current Goal    | Complete Hardware Cursor Driver Layer and Console Foundation |
| Next Milestone  | Complete Hardware Access Phase                               |

## Planned

- [ ] Complete Lesson08_v3 Hardware Cursor System
- [ ] Complete Phase 2 Hardware Access
- [ ] Release v0.3.0 - Protected Mode

## License / 开源协议

This project is released under the MIT License.

本项目采用 MIT License 开源。

Contributions, issues and pull requests are welcome.

欢迎提交 Issue 和 Pull Request。

---

## Contributing / 贡献

Contributions, bug reports, feature requests, and pull requests are welcome.

欢迎提交代码、Issue、功能建议以及 Pull Request。

---

Happy Coding!

Thanks for visiting MyOS.

If you enjoy this project, consider giving it a ⭐.

祝开发愉快！

如果喜欢这个项目，欢迎点个 Star ⭐。