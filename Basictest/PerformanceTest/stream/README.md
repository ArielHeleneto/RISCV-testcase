# Stream 测试

## 说明

Stream 测试套件用于测试内存持续带宽。

## 测试步骤

- 安装测试依赖： `git`, `make`, `gcc`, `gfortran`
- 从 [Git仓库](https://gitee.com/thesamename/STREAM.git) 获取源代码。
- 使用 `make` 进行编译。
- 使用 `./stream_c.exe` 运行测试。
- 上传log文件。

具体命令如下：

```bash
git clone https://gitee.com/thesamename/STREAM.git  --depth=1
cd STREAM
sudo dnf install -y gcc gfortran
sed -i "s/CC =.*/CC = gcc/" Makefile
sed -i "s/FC =.*/FC = gfortran/" Makefile
make
./stream_c.exe
```

## 测试结果

采集标准输出即可。
