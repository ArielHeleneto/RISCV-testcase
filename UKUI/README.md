# UKUI

## 软件说明

UKUI 是由麒麟团队开发的一款轻量级的Linux 桌面环境，默认搭载于优麒麟社
区各版本操作系统中，同时支持Ubuntu、Debian、Arch、openEuler 等主流
Linux 发行版。

官网: https://www.ukui.org

## 环境配置

- 操作系统版本： openEuler 22.03 LTS riscv64
vcpu: 16
memory: 32G
镜像： https://mirror.iscas.ac.cn/openeuler-sig-riscv/openEuler-RISC-V/testing/20221228/QEMU/openEuler-22.03-V2-base-qemu-preview.qcow2.tar.zst 

## 安装方法

``` bash
sudo dnf install ukui
sudo systemctl set-default graphical.target
sudo systemctl start --now graphical.target
```

## 参考资料
https://www.ukui.org
