# 解决mpirun has detected an attempt to run as root

## 摘要

在运行脚本的时候，经常会出现以下警告：

```mpirun has detected an attempt to run as root.```

这是在警告你，你在 root 上运行这个脚本。

## 操作步骤

以通过如下方式定义两个环境变量来允许 root 下也可以用 mpirun 。

```export OMPI_ALLOW_RUN_AS_ROOT=1```

```export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1```

## 预期结果

成功运行脚本。

## 其他说明

该方法仅适用于 4.0 版本后的 Open MPI ，不适用于以往版本的 Open MPI 。
