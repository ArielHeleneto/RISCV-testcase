# LTP Stress 长稳测试

Linux Test Project / LTP 中的 stress 组件可用于对内核进行压稳测试。

## 环境信息

- 发行版版本：openEuler 23.03 RISC-V Preview V1
- 内核版本：6.1.19
- 虚拟机版本：QEMU 8.0.0
- 宿主机：Arch Linux on WSL 2
- 软件版本：LTP 20230127 release ([GitHub](https://github.com/linux-test-project/ltp/releases/tag/20230127))

### 与上游测试方法不同之处

对脚本做了一定修改，方便一键执行。目前脚本默认压测 24 小时，如需修改，请将脚本中的 `sh ltpstress.sh -n -m 512 -t 24` 的 24 修改为其他数值。

## 测试步骤

请执行本目录下的 `run_ltpstress.sh` 脚本。

```bash
# 请先切换至 root 用户进行操作。如已为 root 用户登录请忽略。
sudo -i
wget https://gitee.com/yunxiangluo/openeuler-riscv-2303-test/raw/master/BasicTest/%E9%95%BF%E7%A8%B3%E6%B5%8B%E8%AF%95/LTPstress/run_ltpstress.sh
bash run_ltpstress.sh
```

## 测试结果

内核有报错，测试未通过。

[日志文件](./ltpstress.tar.zst)较大，已打包压缩，请解压后查看。

## 参考文档

https://gitee.com/hanson_fang/ltpstress-for-openeuler

本目录下提供的 `run_ltpstress.sh` 脚本是在此仓库提供的脚本基础上修改而成。