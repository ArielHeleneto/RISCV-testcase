# MPI_Recv 与 MPI_Send

## 摘要

测试 MPI中的 MPI_Recv 与 MPI_Send 函数。

## 说明

MPI 的发送和接收方法是按以下方式进行的：开始的时候，A 进程决定要发送一些消息给 B 进程。A进程就会把需要发送给B进程的所有数据打包好，放到一个缓存里面。因为所有数据会被打包到一个大的信息里面，因此缓存常常会被比作信封（就像我们把好多信纸打包到一个信封里面然后再寄去邮局）。数据打包进缓存之后，通信设备（通常是网络）就需要负责把信息传递到正确的地方。这个正确的地方也就是根据特定秩确定的那个进程。

尽管数据已经被送达到 B 了，但是进程 B 依然需要确认它想要接收 A 的数据。一旦它确定了这点，数据就被传输成功了。进程 A 会接收到数据传递成功的信息，然后去干其他事情。

有时候 A 需要传递很多不同的消息给 B。为了让 B 能比较方便地区分不同的消息，MPI 运行发送者和接受者额外地指定一些信息 ID (正式名称是标签, tags)。当 B 只要求接收某种特定标签的信息的时候，其他的不是这个标签的信息会先被缓存起来，等到 B 需要的时候才会给 B。

### 函数原型

```
MPI_Send(
    void* data,
    int count,
    MPI_Datatype datatype,
    int destination,
    int tag,
    MPI_Comm communicator)
```

```
MPI_Recv(
    void* data,
    int count,
    MPI_Datatype datatype,
    int source,
    int tag,
    MPI_Comm communicator,
    MPI_Status* status)
```

## 操作步骤

```git clone https://github.com/mpitutorial/mpitutorial```

该步骤是在 GitHub 上 clone 一个仓库到本地，以便调用其中的代码进行 MPI_Recv 与 MPI_Send 的测试。

clone 完成后，进入文件夹中的 tutorials 。

```cd mpitutorial/tutorials```

开始运行脚本进行测试 send_recv 。

```./run.py send_recv```

## 预期结果

```
mpirun -n 2 ./send_recv
Process 1 received number -1 from process 0
```

出现以上代码则说明运行成功。

## 其他说明

若遇到以下情况，请参见[这里](https://github.com/microseyuyu/RISCV-testcase/blob/openmpi/Open%20MPI/testcase/解决mpirun%20has%20detected%20an%20attempt%20to%20run%20as%20root.md)

```mpirun has detected an attempt to run as root.```

源码，请参见[这里](https://github.com/mpitutorial/mpitutorial/blob/gh-pages/tutorials/mpi-send-and-receive/code/send_recv.c)
