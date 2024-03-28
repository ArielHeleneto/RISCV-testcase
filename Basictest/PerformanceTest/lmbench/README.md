## 操作步骤

1. 安装并编译 `lmbench`：

```bash
sudo dnf install -y lmbench libtirpc libtirpc-devel
cp -R /opt/lmbench .
sudo chown -R openeuler:openeuler lmbench
wget https://git.savannah.gnu.org/cgit/config.git/plain/config.guess
cp -f config.guess lmbench/scripts/gnu-os
cd lmbench
make -j$(nproc)
```

2. 运行 `lmbench`：`make results`

3. 输入测试参数：

```
MULTIPLE COPIES[DEFAULT 1]: (默认回车)
Job placement selection[DEFAULT 1]: （默认回车）
MB[default 182159]:1024 (输入 1024)
SUBSET （ALL|HARWARE|OS|DEVELOPMENT）[default all]:(默认回车)
FASTMEM[default no]:(默认回车)
SLOWFS[default no]: (默认回车)
DISKS[default none]:(默认回车)
REMOTE[default none]: (默认回车)
Processor mhz[default 2599MHz,0.3848 nanosec clock]: (默认回车)
FSDIR[default /usr/tmp]: /usr/tmp
Status output file [default /dev/tty]: (默认回车)
Mail results [default yes]: no (设置为 no)
```

4. 等待测试完成后，查看结果：

```bash
make see
cd results && make summary > summary.out 2 > summary.errs && make percent > percent.out 2 > percent.errs
```

### 与上游测试方式不同之处

- `lmbench` 软件包为从软件源获取，而非直接编译安装。
- 内存测试范围选定为 1024M。部分小内存开发板设置更低值。
    - For QEMU: oErv 23.03 base 镜像默认在 `/boot/extlinux/extlinux.conf` 中限制了最大内存为 4096M，选定 4096M 可能会导致内存不足。其他开发板同理。
    - For QEMU: 需要在启动脚本中添加启动选项：`-cpu rv64,sv39=on \`，否则 lmbench 在运行内存相关测试时会出现内核报错。注意，需要 QEMU >= 8.0.0。
- 使用新版本的 `config.guess` 替换了 `scripts/gnu-os` 这一系统检测脚本，`lmbench` 附带的版本过旧（2004 年）不支持 RISC-V 架构，直接运行会导致报错。
- 使用 `make see`, `make summary`, `make percent` 查看详细统计结果。参考 [jean9823 / openEuler_riscv_performance_test](https://gitee.com/jean9823/openEuler_riscv_performance_test/blob/master/%E5%9C%A8openEuler%20riscv64%E4%B8%AD%E4%BD%BF%E7%94%A8lmbench%E8%BF%9B%E8%A1%8C%E7%BB%BC%E5%90%88%E6%80%A7%E8%83%BD%E6%B5%8B%E8%AF%95.md#3-lmbench%E6%B5%8B%E8%AF%95%E7%BB%93%E6%9E%9C)

## 测试结果

测试通过，但运行部分项目时内核日志有报错。测试结果详见对应目录下的日志文件。

与 openEuler 23.03 x86_64 执行 lmbench 时程序输出的错误日志进行了对比，注意到 RISC-V 平台出现的报错在 x86_64 均有出现，没有出现 RISC-V 平台特有的错误，对比结果见下图。x86_64 平台下的测试结果位于 [x86_64](./x86_64/) 目录中，供参考。

左：openEuler 23.03 x86_64，右：openEuler 23.03 RISC-V on QEMU

![percent](./images/percent-diff.png)

![summary](./images/summary-diff.png)