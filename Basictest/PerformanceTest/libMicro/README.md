## 操作步骤

```bash
git clone https://github.com/redhat-performance/libMicro.git --depth=1
unzip 0.4.0-rh
cd libMicro-0.4.0-rh
make CFLAGS=-static CC=${CROSS_COMPILE}gcc ARCH=${ARCH} -j$(nproc)
sh bench.sh
```

## 测试结果

测试通过，测试结果详见本目录下的日志文件。