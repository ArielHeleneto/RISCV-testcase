# openMPI 自动测试文档

## 运行测试

### 依赖

- 一个已经安装好的 openMPI 库和对应的 C 编译器。
- automake
- gengetopt
- make

> 由于 openEuler 缺少 gengetopt，可以从 OBS 上获得一个代用品。从 [此处](http://obs-backend.tarsier-infra.com:82/home:/Ariel:/branches:/openEuler:/22.03/22.03/riscv64/gengetopt-2.23-8.oe2203.riscv64.rpm) 下载。

## 编译测试用例

运行以下指令编译 mpi-test-suite。

```bash
git clone https://github.com/open-mpi/mpi-test-suite.git
cd mpi-test-suite
autoscan
autoheader
aclocal
autoconf
automake --add-missing
./configure CC=mpicc
make -j16
```

## 运行测试用例

运行 `./mpi_test_suite -h` 获得帮助。(似乎该指令运行结果与官方文档不符。)

运行 `./mpi_test_suite -l` 列出所有的 tests/test-classes, comms/comm-classes 和 type/type-classes。

运行 `mpirun -np 32 ./mpi_test_suite` 以运行所有的测试用例，使用 `-t` 指定 tests/test-classes，`-c` 指定 comms/comm-classes 以及 `-d` 指定 Datatype-Class。测试器将会尝试所有可能的组合运行所有指定的测试。

## 环境配置

- 操作系统版本： openEuler 22.03 LTS riscv64
- 版本： openmpi-4.1.4

## 参考资料

- [官网](https://www.open-mpi.org)
- [openmpi 帮助](https://www.open-mpi.org/community/help/)
- [mpi-test-suite](https://github.com/open-mpi/mpi-test-suite)