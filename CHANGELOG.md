# Changelog / 更新日志

All notable changes to this project will be documented in this file.

本项目的重要更新都会记录在此文件中。

The format is based on **Keep a Changelog**.

本文档遵循 **Keep a Changelog** 规范。

Versioning follows **Semantic Versioning (SemVer)**.

版本号遵循 **Semantic Versioning（SemVer）** 规范。

---

# [Unreleased]

Changes planned or currently under development.

计划中或正在开发中的内容。

---

## Lesson08 - Advanced Screen Driver / 高级屏幕驱动

### Lesson08_v3_3 - Hardware Cursor Driver Integration

Status: Planned

- Integrate hardware cursor into the complete screen driver
- Improve cursor movement control
- Add cursor enable/disable management
- Prepare foundation for higher-level text console system


---

## Technical Improvements / 技术改进

- Improve VGA screen driver architecture
- Improve cursor management mechanism
- Prepare text console framework


---

## Documentation Updates / 文档更新

- Update README.md
- Update docs/README.md
- Add Lesson08_v3_3 documentation


---

# [v0.2.1-dev]

Development Version

开发版本

---

## Added / 新增

### Lesson08 Advanced Screen Driver

- Lesson08_v1 Screen Driver Refactoring
- Lesson08_v2 Software Cursor Coordinate System
- Lesson08_v3_1 VGA Hardware Cursor Initialization
- Lesson08_v3_2 Cursor Position Synchronization


### VGA Hardware Cursor Support

- Added VGA CRT Controller register access
- Added hardware cursor initialization
- Added cursor scan line configuration
- Added hardware cursor position update mechanism


---

## Changed / 修改

- Improved screen driver architecture
- Added software cursor coordinate management
- Connected software cursor coordinates with VGA hardware cursor
- Improved text output pipeline


---

## Completed / 已完成

- Software cursor coordinate system
- VGA hardware cursor initialization
- Hardware cursor position synchronization
- Character output based on cursor coordinates
- Basic cursor position management


---

## Technical Details / 技术细节

### VGA Cursor Register Access

Accessed VGA CRT Controller through I/O ports:

```text
Index Port : 0x3D4
Data Port  : 0x3D5
```

Cursor location registers:

```text
Register 0x0E : Cursor offset high byte
Register 0x0F : Cursor offset low byte
```

---


### Cursor Position Calculation

Software cursor coordinates:

```text
cursor_x : Column position
cursor_y : Row position
```

Converted into VGA cursor offset:

```text
offset = cursor_y * 80 + cursor_x
```

---

## Next Development / 下一阶段开发

- Lesson08_v3_3 Hardware Cursor Driver Integration


---

# [v0.2.0] - 2026-07-03

## Added / 新增

- Lesson04 Understanding VGA Text Mode
- Lesson05 Direct VGA Memory Output
- Lesson06_v1 Multiple Character Output
- Lesson06_v2 String Output Using Loop
- Lesson06_v3 Reusable Print Routine
- CALL and RET based function invocation
- Lesson07 Basic Screen Driver
- Screen clear and string rendering pipeline


## Changed / 修改

- Updated Hardware Access roadmap
- Updated README documentation
- Updated docs structure
- Archived previous lesson source code


---

# [v0.1.0] - 2026-06-30

## Added / 新增

- Initial boot sector
- BIOS text output
- Print first character
- Print string
- Initial documentation
- GitHub repository initialization


---

# Version History / 版本历史

| Version | Status | Description |
|---------|--------|-------------|
| v0.1.0 | Released | Initial Release |
| v0.2.0 | Released | Hardware Access Stage |
| v0.2.1-dev | Development | Lesson08 Advanced Screen Driver Development |
| Unreleased | Planned | Lesson08_v3_3 Future Development |


---

New features under development are recorded in the Unreleased section.

开发中的功能将在正式发布前记录于 Unreleased 部分。