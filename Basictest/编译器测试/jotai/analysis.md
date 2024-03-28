# 测试结果分析

## AnghaLeaves

643 项失败。

### 命名冲突

测试代码中的枚举或符号在系统头文件中已经定义为宏或以不同的类型声明过了。

```
extr_darwin-xnubsdmiscfsdevfsdevfs_fdesc_support.c_fdesc_pathconf_Final.c
extr_darwin-xnubsdmiscfsfifofsfifo_vnops.c_fifo_pathconf_Final.c
extr_linuxarchx86kvmpmu_amd.c_msr_to_index_Final.c
```

### 类型定义冲突

测试代码中的存在对 `uint16_t` 等类型的定义，但是与系统 libc 的定义不同。

类别包含了所有未列出的失败项目。

### 平台相关代码

测试代码中存在对架构相关的预定义宏的使用，然而 RISC-V 架构不被包含在可识别的
列表中。

```
extr_linuxfslibfs.c_simple_statfs_Final.c:
```

### 未定义的符号

代码中使用的符号/宏未定义。

```
extr_darwin-xnuosfmki386machine_routines.c_ml_static_ptovirt_Final.c
```

所有错误均与编译器本身无关。
