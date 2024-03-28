# LTP 测试

## 测试方法

使用 Linux Test Project（简称 LTP）对内核进行测试。

### 下载、编译、安装 LTP

```bash
git clone https://github.com/linux-test-project/ltp.git --depth=1
cd ltp
make autotools
./configure --with-bash --with-expect --with-perl --with-python
make
make install
```

### 运行测试

```bash
cd /opt/ltp
./runltp | tee ltp.log
```

## 日志

采集 LTP 测试产生的 `output` 目录和 `results` 目录。

- `results/LTP_RUN_ON-2023_04_30-08h_15m_39s.log`：测试结果统计。
- `output/LTP_RUN_ON-tests.output.failed` 失败测试的名字（tag）及具体命令。
- `output/LTP_RUN_ON-tests.output.tconf`：（可能）需要调整配置的测试名（tag）及具体命令，包括且大部分为主动跳过的测试。
- `ltp.log` ltp 程序的输出也一并采集。