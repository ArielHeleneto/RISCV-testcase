# yarpgen

yarpgen 是由 Intel 编写的编译器冒烟测试套件。

## 编译安装

从[GitHub 仓库](https://github.com/intel/yarpgen)获取源代码。

该项目使用 CMake 构建系统，需要安装 CMake

```
dnf install cmake
```

编译 yarpgen

```
cmake . && make -j16
```

## 运行测试

参考脚本[auto\_test.sh](./auto_test.sh)。该脚本调用 `clang` 和 `gcc`
分别使用 `-O0`, `-O1`, `-O2`, `-O3` 与 `-Os` 对 yarpgen 生成的代码进行
编译运行并对比结果。

调用方式

```
./auto_test.sh TEST_NUM
```

其中 `TEST_NUM` 为要进行的测试数量。

注意，`clang` 默认并未安装，可能需要 `dnf install clang` 安装才能正常进行
测试。

## 测试结果

```
Total: 200 Failed: 0
```
