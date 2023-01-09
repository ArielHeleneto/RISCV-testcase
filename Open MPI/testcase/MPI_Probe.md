# MPI_Probe

## 摘要

测试 MPI_Probe 是否可以在实际接收消息之前查询消息大小。

## 说明

MPI_Probe 看起来与 MPI_Recv 非常相似。 实际上，您可以将 MPI_Probe 视为 MPI_Recv，除了不接收消息外，它们执行相同的功能。 与 MPI_Recv 类似，MPI_Probe 将阻塞具有匹配标签和发送端的消息。 当消息可用时，它将填充 status 结构体。 然后，用户可以使用 MPI_Recv 接收实际的消息。

### 函数原型

```
MPI_Probe(
    int source,
    int tag,
    MPI_Comm comm,
MPI_Status* status)
```

## 操作步骤

```git clone https://github.com/mpitutorial/mpitutorial```

该步骤是在 GitHub 上 clone 一个仓库到本地，以便调用其中的代码进行  MPI_Probe 的测试。

clone 完成后，进入文件夹中的 tutorials 。

```cd mpitutorial/tutorials```

开始运行脚本进行测试 MPI_Probe 。

```./run.py probe```

## 预期结果

```
mpirun -n 2  ./dynamic-receiving-with-mpi-probe-and-mpi-status/code/probe
0 sent 3 numbers to 1
1 dynamically received 3 numbers from 0.
```

测试通过，功能正常运行。

## 其他说明

若遇到以下情况，请参见[这里](https://github.com/microseyuyu/RISCV-testcase/blob/openmpi/Open%20MPI/testcase/解决mpirun%20has%20detected%20an%20attempt%20to%20run%20as%20root.md)

```mpirun has detected an attempt to run as root.```

测试 MPI_Probe 源码，请参见[这里](https://github.com/mpitutorial/mpitutorial/blob/gh-pages/tutorials/dynamic-receiving-with-mpi-probe-and-mpi-status/code/probe.c)
