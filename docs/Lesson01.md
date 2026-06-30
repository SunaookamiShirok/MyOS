# Lesson 1 - 第一个 Bootloader

## 学习目标

- 搭建 MyOS 开发环境
- 学会使用 NASM 编译 Bootloader
- 了解 BIOS 的启动流程
- 生成第一个可启动扇区

---

## Bootloader 是什么？

Bootloader 是计算机开机后执行的第一段程序。

启动流程：

BIOS
↓

读取磁盘第一个扇区（512 Bytes）

↓

加载到内存地址 0x7C00

↓

开始执行 Bootloader

---

## Boot Sector

一个 Boot Sector 必须满足：

- 大小固定为 512 Bytes
- 最后两个字节必须为

```
0x55
0xAA
```

代码：

```asm
times 510-($-$$) db 0
dw 0xAA55
```

作用：

- 补齐到 510 字节
- 写入 Boot Signature
- 最后两位用 55 AA 来替代，这是bootloader要求

---

## 第一版 Bootloader

```asm
start:
    cli

hang:
    hlt
    jmp hang
```

说明：

- cli：关闭中断
- hlt：CPU进入休眠
- jmp hang：无限循环

---

## 编译

```bash
nasm boot/boot.asm -f bin -o build/boot.bin
```

---

## 运行

```bash
qemu-system-i386 -drive format=raw,file=build/boot.bin
```

---

## 本课收获

- Bootloader 的作用
- Boot Sector 固定为 512 字节
- BIOS 会加载 Bootloader 到 0x7C00
- 成功生成第一个 boot.bin