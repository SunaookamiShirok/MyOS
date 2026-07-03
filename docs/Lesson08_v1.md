# Lesson08_v1 — Screen Driver Refactoring
# Lesson08_v1 —— 屏幕驱动重构

---

## Objective / 本节目标

### English

Refactor the screen output routines into reusable functions.

Instead of writing characters directly inside `print_string`, introduce a dedicated `print_char()` routine that will become the foundation of the future screen driver.

### 中文

将屏幕输出逻辑重构为可复用函数。

不再由 `print_string` 直接负责字符输出，而是新增独立的 `print_char()` 函数，为后续屏幕驱动打下基础。

---

## What We Learned / 学习内容

### English

- Refactoring Assembly code
- Function decomposition
- Reusable screen output routines
- Software cursor state initialization
- Calling conventions

### 中文

- 汇编代码重构
- 函数拆分
- 可复用字符输出函数
- 软件光标状态初始化
- 函数调用约定

---

## New Features / 新增功能

### English

- Added `print_char()` routine.
- `print_string()` now reuses `print_char()`.
- Introduced software cursor variables.
- Reset cursor state when clearing the screen.

### 中文

- 新增 `print_char()` 字符输出函数。
- `print_string()` 调用 `print_char()` 输出字符。
- 新增软件光标变量。
- 清屏时重置软件光标。

---

## Source Structure / 源码结构

```
print_string()
        │
        ▼
print_char()
        │
        ▼
 VGA Memory
```

---

## Notes / 注意事项

### English

Using `pusha` inside `print_char()` restores `DI` after every call, causing all characters to overwrite the same position.

Only preserve registers that actually need protection.

### 中文

如果在 `print_char()` 中使用 `pusha`，函数返回时会恢复 `DI`，导致所有字符都写入同一位置。

因此只保存真正需要保护的寄存器即可。

---

## Result / 本节成果

✔ Modular screen output

✔ Reusable character output routine

✔ Software cursor framework initialized

---

Next Lesson:

**Lesson08_v2 — Software Cursor**