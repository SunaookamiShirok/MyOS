# Lesson 07 - Screen Driver

# 第07课 - 屏幕驱动

---

## English

In this lesson, we implemented the first version of a simple screen driver for MyOS.

We moved from "manual VGA writes" to a **structured screen pipeline**, including:

### Features implemented:
- VGA text mode initialization
- Screen clearing routine
- String rendering using `lodsb + stosw`
- Safe register handling (push/pop)
- Boot stability improvements (no flicker / no overwrite)

### Key idea:

Instead of directly writing characters randomly into VGA memory,
we now treat the screen as a controlled device.

This is the first step toward a real kernel display system.

---

## 中文

在这一课中，我们实现了 MyOS 的第一个“屏幕驱动雏形”。

我们从“手动写 VGA 显存”升级为一个**结构化显示流程**：

### 实现内容：

- VGA 文本模式初始化
- 清屏函数（clear_screen）
- 字符串输出函数（lodsb + stosw）
- 寄存器保护（push / pop）
- 启动稳定性修复（无闪屏/无覆盖）

### 核心思想：

不再直接随意写 VGA 内存，
而是把屏幕当成一个“设备”来管理。

这是进入真正 Kernel UI 的第一步。

---

## Technical Summary / 技术总结

- VGA base: `0xB8000`
- Screen size: 80 × 25 = 2000 cells
- Each cell: `[char][attribute]`
- Output method: `stosw`

---

## Result / 运行效果

- Boot successfully
- Screen cleared correctly
- Message displayed stable
- No flicker / no overwrite issue

---

## Next Step / 下一步

Cursor Control / 光标控制