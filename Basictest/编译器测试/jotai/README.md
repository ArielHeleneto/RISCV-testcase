# jotai

jotai 是从 AnghaBench 中抽取修改的可编译可运行的代码测试集。

## 进行测试

从 [GitHub 仓库](https://github.com/lac-dcc/jotai-benchmarks) 获取源代码，
在 `/benchmarks/` 目录下有 `anghaLeaves` 和 `anghaMath` 两个目录包含测试程序
源代码。

所有的源代码程序可以直接独立进行编译，结果文件可以直接进行运行。不带参数地运行
结果程序可以得到其能够使用的参数列表。

编写脚本 [Makefile](./Makefile) [singletest.lua](./singletest.lua) 进行自动化运
行，并利用 make 的多线程能力进行测试。运行前需要安装编译器依赖及 Lua 解释器。

```
yum install gcc lua make
```

在 `anghaLeaves` 和 `anghaMath` 目录拷贝测试脚本后使用 `make` 直接开始运行测试，
可以添加 `-j THREAD_NUM` 并行化测试，注意这会使测试打印的日志乱序。该 Makefile
会调用 `singletest.lua`，其使用 gcc 编译测试源代码，并使用模式 `%s(%d+)%s`
（对应 POSIX 正则 `\s(\d+)\s`）从结果程序的输出中提取可选的测试选项，并分别使用
各个选项运行并检查其返回值是否为 0。

每一个名为 `extr_test.c` 的测试在测试结束后都会生成 `extr_test.c.task` 文件，
如果失败会生成 `extr_test.c.fail` 文件。

使用 `find . -path '*.task' | sed -e 's/\.task//g` 获取所有已完成测试列表，使用
`find . -path '*.fail' | sed -e 's/\.task//g` 获取所有失败测试列表。

## 测试结果

对 `anghaLeaves` 进行测试时的日志包含在 [test.log.gz](./test.log.gz) 文件中。

- anghaLeaves 中失败测试列表：[anghaLeaves.fail](anghaLeaves.fail)
- anghaMath 中失败测试列表：[anghaMath.fail](anghaMath.fail)

[测试结果分析](./analysis.md)

## History

先前不完整的 jotai 测试结果包含在 old 目录中。
