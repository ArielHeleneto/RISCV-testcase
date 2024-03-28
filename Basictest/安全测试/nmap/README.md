## 系统环境

Host: Ubuntu 23.04 on WSL 2, Windows 10 IoT Enterprise LTSC, QEMU 8.0.0 （从源码编译）

Guest: openEuler 23.03 RISC-V preview

## 操作步骤

> 注意：需要启动两台虚拟机，用其中一台虚拟机对另一台进行扫描。建议分别创建不同的文件夹放置两个虚拟机的磁盘镜像、启动脚本等文件。

1. 安装依赖包：`sudo apt install -y vde2`

2. 利用脚本配置 VDE 网络：

```bash
cat << 'EOF' > vde.sh
#!/bin/sh

vdeSocket=/tmp/vde.ctl
mgmtSocket=/tmp/mgmt

rm -rf $vdeSocket
rm -rf $mgmtSocket

# Check for vde tools

if ! [ -f /usr/bin/vde_switch ]
then
	echo "VDE tools not found."
	exit 1
fi

vde_switch -d -s $vdeSocket -M $mgmtSocket
slirpvde -d -s $vdeSocket -dhcp

echo "VDE socket is $vdeSocket, management socket is $mgmtSocket"
EOF
bash vde.sh
```

3. 修改两台虚拟机的启动脚本 `start_vm.sh`，完整脚本如下。

> 注意：将两台虚拟机的 `ssh_port` 修改为不同端口以免冲突。

```bash
#!/usr/bin/env bash

# The script is created for starting a riscv64 qemu virtual machine with specific parameters.

RESTORE=$(echo -en '\001\033[0m\002')
YELLOW=$(echo -en '\001\033[00;33m\002')

## Configuration
vcpu=8
memory=8
memory_append=`expr $memory \* 1024`
drive="$(ls *.qcow2)"
fw="fw_payload_oe_uboot_2304.bin"
ssh_port=12055
macadd=$(echo $RANDOM|md5sum|sed 's/../&:/g'|cut -c 1-17)

cmd="qemu-system-riscv64 \
  -nographic -machine virt \
  -smp "$vcpu" -m "$memory"G \
  -bios "$fw" \
  -drive file="$drive",format=qcow2,id=hd0 \
  -object rng-random,filename=/dev/urandom,id=rng0 \
  -device virtio-vga \
  -device virtio-rng-device,rng=rng0 \
  -device virtio-blk-device,drive=hd0 \
  -device virtio-net-device,netdev=usernet \
  -netdev user,id=usernet,hostfwd=tcp::"$ssh_port"-:22 \
  -device virtio-net-device,netdev=innet,mac="$macadd" \
  -netdev vde,id=innet,sock=/tmp/vde.ctl \
  -device qemu-xhci -usb -device usb-kbd -device usb-tablet"

echo ${YELLOW}:: Starting VM...${RESTORE}
echo ${YELLOW}:: Using following configuration${RESTORE}
echo ""
echo ${YELLOW}vCPU Cores: "$vcpu"${RESTORE}
echo ${YELLOW}Memory: "$memory"G${RESTORE}
echo ${YELLOW}Disk: "$drive"${RESTORE}
echo ${YELLOW}SSH Port: "$ssh_port"${RESTORE}
echo ""
echo ${YELLOW}:: NOTE: Make sure ONLY ONE .qcow2 file is${RESTORE}
echo ${YELLOW}in the current directory${RESTORE}
echo ""
echo ${YELLOW}:: Tip: Try setting DNS manually if QEMU user network doesn\'t work well. ${RESTORE}
echo ${YELLOW}:: HOWTO -\> https://serverfault.com/a/810639 ${RESTORE}
echo ""
echo ${YELLOW}:: Tip: If \'ping\' reports permission error, try reinstalling \'iputils\'. ${RESTORE}
echo ${YELLOW}:: HOWTO -\> \'sudo dnf reinstall iputils\' ${RESTORE}
echo ""

sleep 2

eval $cmd
```

4. 分别启动两台虚拟机，查看各自的 IP 地址：`ip a`

5. 在其中一台虚拟机上安装 `nmap` 并运行端口扫描：

```bash
sudo dnf install -y nmap
sudo nmap -sS -p- 10.0.2.15
```

其中 `10.0.2.15` 为另一台虚拟机的 IP 地址，在上一步中获得。

6. 等待扫描完成，查看结果。

## 测试结果

扫描成功结束，目标虚拟机仅开启了 SSH / 22 端口。

```
[openeuler@openeuler-riscv64 ~]$ sudo nmap -sS -p- 10.0.2.15
Starting Nmap 7.92 ( https://nmap.org ) at 2023-05-05 12:49 CST
Nmap scan report for 10.0.2.15
Host is up (0.00049s latency).
Not shown: 65534 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
MAC Address: E0:A5:7C:A7:00:72 (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 19.34 seconds
[openeuler@openeuler-riscv64 ~]$
```

## 参考文档

- [适用于 QEMU 多节点的 VDE 网络配置指南](https://github.com/ArielHeleneto/Work-PLCT/blob/master/openMPI/VDE-network.md) by ArielHeleneto
