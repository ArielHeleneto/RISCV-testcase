# AnghaBench 测试

AnghaBench 包含了一百万个可编译的 C 文件，可用于对 C 编译器进行编译测试。

## 环境

- 发行版版本：openEuler 23.03 RISC-V Preview V1
- 虚拟机版本：QEMU 7.2.0

## 执行测试

从 [此](https://github.com/brenocfg/AnghaBench/) 获得 AnghaBench 项目代码并使用 [该脚本](./compile.sh) 运行测试

## 测试结果

```
Total: 1044021 Passed: 1042280 Failed: 1741
```

通过率 99.83%

见 [AnghaBench.log](./AnghaBench.log.gz)

失败样例的编译器信息见 [compilation\_log.tar.gz](./compilation_log.tar.gz)

## 失败样例分析

### 平台相关的代码编译失败

如非 RISC-V 架构的内联汇编，不支持 RISC-V 平台的条件编译，列表见
[arch.md](./arch.md)。

共 1170 项

### AnghaBench 样例的代码缺陷

如使用了不标准的语法或存在未定义的类型。列表见
[testcase\_problem.md](./testcase\_problem.md)

共 132 项

### 其他

439 项。
