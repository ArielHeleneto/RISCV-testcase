# 使用 MPI_Send 和 MPI_Recv 进行广播

## 摘要

广播 (broadcast)是标准的集体通信技术之一。一个广播发生的时候，一个进程会把同样一份数据传递给一个 communicator 里的所有其他进程。广播的主要用途之一是把用户输入传递给一个分布式程序，或者把一些配置参数传递给所有的进程。

## 函数原型

```
MPI_Bcast(
    void* data,
    int count,
    MPI_Datatype datatype,
    int root,
    MPI_Comm communicator)
```

## 操作步骤

```git clone https://github.com/mpitutorial/mpitutorial```

该步骤是在 GitHub 上 clone 一个仓库到本地，以便调用其中的代码进行使用 MPI_Send 和 MPI_Recv 进行广播的测试。

clone 完成后，进入文件夹中的 tutorials 。

```cd mpitutorial/tutorials```

开始运行脚本进行测试。

```./run.py my_bcast```

## 预期结果

```
mpirun -n 4 ./my_bcast
Process 0 broadcasting data 100
Process 2 received data 100 from root process
Process 3 received data 100 from root process
Process 1 received data 100 from root process
```

## 实际结果

```
mpirun -n 4  ./mpi-broadcast-and-collective-communication/code/my_bcast
Process 0 broadcasting data 100
Process 1 received data 100 from root process
Process 3 received data 100 from root process
Process 2 received data 100 from root process
```

## 结论

功能正常运行，测试通过。

## 其他说明

若遇到以下情况，请参见[这里](https://github.com/microseyuyu/RISCV-testcase/blob/openmpi/Open%20MPI/testcase/解决mpirun%20has%20detected%20an%20attempt%20to%20run%20as%20root.md)

```mpirun has detected an attempt to run as root.```

测试使用 MPI_Send 和 MPI_Recv 进行广播源码，请参见[这里](https://github.com/mpitutorial/mpitutorial/blob/gh-pages/tutorials/mpi-broadcast-and-collective-communication/code/my_bcast.c)
