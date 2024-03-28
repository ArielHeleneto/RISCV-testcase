# csmith

csmith 是适用于编译器的冒烟测试工具，能够生成大量合法的 C 文件作为测试用例，进而测试 C 编译器的标准性。

## 安装

从 [GitHub 仓库](https://github.com/csmith-project/csmith) 获取源代码，该项目使用 CMake 作为构建工具，需要安装 cmake。

```
# dnf install cmake
```

使用 CMake 进行编译并安装

```
# cmake . && make -j16 && make install
```

此时可以使用 `csmith` 命令，如果成功输出一段 C 代码即安装成功。

## 测试

***要求的样本量过于庞大，测试所需时间不现实。***

使用 `csrc.mk`, `list.mk`, `makefile`, `epoch.sh` 借助 make 的并行化构建功能
编写简单的测试驱动脚本。

在安装了 csmith 及 gcc, clang 的机器运行

```
$ ./epoch.sh THREAD_NUM
```

其中 THREAD\_NUM 为并行线程数量，设置为 CPU 数目的 1.25 倍较为合适。

该脚本会不停机地进行冒烟测试，使用 ^C 快捷键终止。csmith 生成的代码将会分别由
GCC，Clang 以五种不同的优化开关（`-O0`, `-O1`, `-O2`, `-O3`, `-Os`）进行编译，
产出可执行文件将会进行运行并对比输出结果的 SHA256 校验值。

### 使用 csmith 自带的脚本进行自动化测试

`csmith` 在 `scripts` 目录下提供了一个 `compiler_test.tl` 脚本可用于自动化测试。

在 `compiler_test.in` 中定义了使用的编译器和优化级别。

> Note: 该脚本为单线程执行。

执行如下内容（注意将 `CSMITH_PATH` 更改为真实的 `csmith` 目录，`100` 为执行测试用例个数）：

```bash
cd scripts
CSMITH_HOME=<CSMITH_PATH> ./compiler_test.pl 100 compiler_test.in 2>&1 | tee ~/csmith.log
```

结束后可在 `~/csmith.log` 下查看日志。

测试性运行 100 个测试用例的结果可查看 [csmith.log](./csmith.log)。为了测试所需时间，添加了 `time` 指令。

测试结果：100 个测试用例均通过，但在未做并行化处理的前提下，耗时 112 分钟。