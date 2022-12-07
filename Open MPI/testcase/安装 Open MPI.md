# 安装 Open MPI

## 摘要

安装 Openb MPI 。

## 操作步骤

### 下载 Open MPI

下载 Open MPI ：

```wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz ```

下载完成后进行解压：

```tar xvf openmpi-4.1.4.tar.gz```

进入解压缩后的 Open MPI 目录：

``` cd openmpi-4.1.4```

### 在此目录中，你可以查看配置帮助

查看说明

```more README```

查看安装说明

```more INSTALL```

显示configure的可配置选项

```./configure –help | less```

开始安装，执行脚本，输入以下代码：

```./configure --prefix=/opt/openmpi```

```make```

```make install```

检测是否安装成功，用自带的例子来进行检验，输入以下指令

```cd openmpi-4.1.4/examples```

```make```

```mpirun -np 4 hello.c```

## 预期结果

出现以下代码，则说明安装成功

```
Hello, world, I am 0 of 4, (Open MPI v4.1.4, package: Open MPI root@openEuler-riscv64 Distribution, ident: 4.1.4, repo rev: v4.1.4, May 26, 2022, 117)
Hello, world, I am 1 of 4, (Open MPI v4.1.4, package: Open MPI root@openEuler-riscv64 Distribution, ident: 4.1.4, repo rev: v4.1.4, May 26, 2022, 117)
Hello, world, I am 2 of 4, (Open MPI v4.1.4, package: Open MPI root@openEuler-riscv64 Distribution, ident: 4.1.4, repo rev: v4.1.4, May 26, 2022, 117)
Hello, world, I am 3 of 4, (Open MPI v4.1.4, package: Open MPI root@openEuler-riscv64 Distribution, ident: 4.1.4, repo rev: v4.1.4, May 26, 2022, 117)
[root@openEuler-riscv64 examples]# mpirun -np 4 hello_c
Hello, world, I am 0 of 4, (Open MPI v4.1.4, package: Open MPI root@openEuler-riscv64 Distribution, ident: 4.1.4, repo rev: v4.1.4, May 26, 2022, 117)
Hello, world, I am 1 of 4, (Open MPI v4.1.4, package: Open MPI root@openEuler-riscv64 Distribution, ident: 4.1.4, repo rev: v4.1.4, May 26, 2022, 117)
Hello, world, I am 2 of 4, (Open MPI v4.1.4, package: Open MPI root@openEuler-riscv64 Distribution, ident: 4.1.4, repo rev: v4.1.4, May 26, 2022, 117)
Hello, world, I am 3 of 4, (Open MPI v4.1.4, package: Open MPI root@openEuler-riscv64 Distribution, ident: 4.1.4, repo rev: v4.1.4, May 26, 2022, 117))```
```

## 其他说明

无。
