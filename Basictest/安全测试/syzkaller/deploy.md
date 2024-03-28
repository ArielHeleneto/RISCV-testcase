# syzkaller 部署安装

## 准备编译环境

### 获取 Golang 工具链

syzkaller 管理页面使用 Golang 编写，在构建时需要获取一份 Golang 工具链
(version >= 1.19)。

可以从 https://go.dev/dl/ 下载官方的预编译工具链并在解压后将其 bin 目录
添加到 PATH，也可以从软件包管理器直接安装

### 制作 RISC-V 交叉编译工具链

syzkaller 需要目标平台为 RISC-V 的交叉编译工具链来编译在被测试内核上运行
的冒烟测试程序。

从 [ISCAS 镜像源](https://mirror.iscas.ac.cn/riscv-toolchains/git/riscv-collab/riscv-gnu-toolchain)
获取 RISC-V 交叉编译工具链脚本。

可以按照 [镜像源帮助文档](https://help.mirrors.cernet.edu.cn/riscv-toolchains/) 的说明下载并编译
工具链。注意预编译的工具链可能不包含 syzkaller 需要的 g++ C++ 编译器。

### 安装 QEMU

syzkaller 需要 QEMU 为内核提供虚拟化环境。注意如果从源代码编译，需要准备
开发版本的 libslirp 包来为 QEMU 提供用户态网络虚拟化支持。

## 构建 syzkaller

从 [GitHub 仓库](https://github.com/google/syzkaller) 获取源代码。

修改 `vm/qemu/qemu.go`，将第 455 行的 `"file=%v,if=none,format=raw,id=hd0"` 修改为
`"file=%v,if=none,format=qcow2,id=hd0"`

使用

```
make TARGETOS=linux TARGETARCH=riscv64 -j$(nproc)
```

构建 syzkaller

## 配置受测镜像

syzkaller 实际上通过 SSH 连接到被测系统进行测试，其需要保证以下条件

- 被测系统包含网络支持
- 被测系统的内核开启了 [syzkaller 所需的调试选项](https://github.com/google/syzkaller/blob/master/docs/linux/kernel_configs.md)
- 被测系统在 /sys/kernel/debug 挂在
- 被测系统允许 root 用户通过 SSH 登陆

下载需要测试的 RISC-V 平台镜像并启动，以 root 身份登陆。

### 配置 fstab

运行
```
echo "debugfs /sys/kernel/debugfs debugfs defaults 0 0" >> /etc/fstab
```

以自动挂载 debugfs

### 配置 OpenSSHD

打开 `/etc/ssh/sshd_config`，确保 `PermitRootLogin`, `PasswordAuthentication`
与 `PermitEmptyPasswords` 全部设置为 `yes`.

### 生成 SSH 密钥对

运行
```
ssh-keygen -f id_rsa -t rsa -N "" && cat id_rsa.pub >> ~/.ssh/authorized_keys
```
并将 `id_rsa` 文件拷贝到宿主机

## 编写 syzkaller 配置文件

```
{
        "name": "riscv64",
        "target": "linux/riscv64",
        "http": ":56700",
        "workdir": ".",
        "syzkaller": ".",
        "procs": 8,
        "image": "2303.qcow2",
        "type": "qemu",
        "sshkey": "id_rsa",
        "ignores": [".*BUG: soft lockup.*", ".*rcu_sched self-detected stall on CPU.*"],
        "vm": {
                "count": 1,
                "qemu_args": "-machine virt -bios fw.bin -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0",
                "cpu": 2,
                "mem": 2048
        }
}
```

其中 `image` 的值替换为 qcow2 镜像路径，`sshkey` 替换为 `id\_rsa` 私钥路径，
`fw.bin` 替换为 `fw_payload` 固件路径。

由于 QEMU 性能较差，可能会出现内核假死报错终止测试的问题。所以添加了
`ignores` 选项来屏蔽相关的内核错误。

## 运行测试

```
bin/syzkaller -config CONFIGURATION
```

访问本机 56700 端口即可看到测试信息统计。
