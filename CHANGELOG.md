# Changelog / 更新日志

All notable changes to this project will be documented in this file.

本项目的重要更新都会记录在此文件中。

The format is based on **Keep a Changelog**.

本文档遵循 **Keep a Changelog** 规范。

Versioning follows **Semantic Versioning (SemVer)**.

版本号遵循 **Semantic Versioning（SemVer）** 规范。

---

## [Unreleased]

Changes that are under development and will be included in the next release.

当前开发中的功能，将包含在下一个正式版本中。

### Added / 新增

#### Lesson 08 (Version 2)

- Software Cursor / 软件光标
- Disabled VGA hardware cursor / 禁用 VGA 硬件光标
- Cursor drawing routine / 光标绘制函数
- Character restore routine / 字符恢复函数
- Cursor state management / 光标状态管理

### Changed / 修改

- Improved screen driver architecture / 优化屏幕驱动架构
- Updated project roadmap / 更新项目开发路线

### Documentation Updates / 文档更新

- Added Lesson08_v2 documentation / 新增 Lesson08_v2 教程
- Updated README.md / 更新 README
- Updated docs/README.md / 更新 docs/README

---

## [v0.2.0] - 2026-07-03

### Added / 新增

- Lesson 06 (Version 3) / Lesson 06（第三版）
- Reusable print routine / 可复用字符串输出函数
- CALL and RET based function invocation / 基于 CALL 与 RET 的函数调用
- Lesson 06 (Version 3) documentation / Lesson 06（第三版）课程文档
- Lesson 07 (Screen Driver) / Lesson 07（屏幕驱动）
- Basic VGA screen driver implementation / 基础 VGA 屏幕驱动实现
- Screen clear + string rendering pipeline / 清屏 + 字符串渲染流程

### Changed / 修改

- Updated project roadmap for Hardware Access stage / 更新硬件访问阶段开发路线
- Updated root README documentation / 更新根目录 README
- Updated docs/README lesson index / 更新 docs/README 课程索引
- Archived Lesson 07 source code / 归档 Lesson 07 源码

---

## [v0.1.0] - 2026-06-30

### Added / 新增

- Initial boot sector / 初始 Boot Sector
- BIOS text output / BIOS 文本输出
- Print first character / 输出第一个字符
- Print string / 输出字符串
- Lesson 01 documentation / Lesson 01 文档
- Lesson 02 documentation / Lesson 02 文档
- Lesson 03 documentation / Lesson 03 文档
- GitHub repository initialized / 初始化 GitHub 仓库
- README.md
- CHANGELOG.md

---

## Version History / 版本历史

| Version / 版本 | Status / 状态 | Description / 描述 |
|----------------|---------------|--------------------|
| v0.1.0 | Released | Initial Release / 初始版本 |
| v0.2.0 | Released | Hardware Access Stage (Lesson07) / 硬件访问阶段（Lesson07） |
| v0.2.1-dev | Development | Screen Driver Refactoring & Software Cursor / 屏幕驱动重构与软件光标 |
---

> New features under development are recorded in the **Unreleased** section until the next official release.

> 开发中的新功能将在正式发布前统一记录在 **Unreleased** 部分。
