# UnixBench 测试

## 说明

UnixBench 套件用于测试类Unix系统基本性能。

## 环境配置

### QEMU

- 发行版版本：[Eulaceura riscv64 23H2 Server](https://mirror.iscas.ac.cn/openeuler-sig-riscv/eulaceura/image/23H2/Eulaceura.riscv64-23H2-Server_vm.qcow2)
- 虚拟机版本：qemu-8.1.3-4.fc39
- 宿主机版本：Fedora Linux 39
- qemu参数：
    - CPU：4
    - 内存大小：4G

### Lichee Pi 4A

版本略。

## 测试步骤

- 安装测试依赖： `git`, `make`, `gcc`, `gfortran`
- 从[Git仓库](https://gitee.com/yan-mingzhu/byte-unixbench)获取源代码。
- 使用 `make -j$(nproc)` 进行编译。
- 使用 `./Run -c $(nproc)` 运行测试。
- 上传log文件。

```bash
git clone https://github.com/kdlucas/byte-unixbench
cd byte-unixbench/UnixBench
make -j$(nproc)
./Run -c $(nproc)
```

## 测试结果

采集标准输出即可。
 