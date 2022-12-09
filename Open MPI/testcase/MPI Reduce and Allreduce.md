# MPI Reduce and Allreduce

## 摘要

测试 MPI_Reduce 与 MPI_allreduce 是否能够正常运行。

## 函数原型

```
MPI_Reduce(
    void* send_data,
    void* recv_data,
    int count,
    MPI_Datatype datatype,
    MPI_Op op,
    int root,
    MPI_Comm communicator)
```

```
MPI_Allreduce(
    void* send_data,
    void* recv_data,
    int count,
    MPI_Datatype datatype,
    MPI_Op op,
    MPI_Comm communicator)
```

## 操作步骤

```git clone https://github.com/mpitutorial/mpitutorial```

该步骤是在 GitHub 上 clone 一个仓库到本地，以便调用其中的代码进行  MPI_Reduce 与 MPI_allreduce 的测试。

clone 完成后，进入文件夹中的 tutorials 。

```cd mpitutorial/tutorials```

开始运行脚本进行测试。

```./run.py reduce_stddev```

## 预期结果

```
mpirun -n 4  ./reduce_stddev 100
Mean - 0.501100, Standard deviation = 0.301126
```

## 实际结果

```
mpirun -n 4  ./mpi-reduce-and-allreduce/code/reduce_stddev 100
Mean - 0.486650, Standard deviation = 0.289384
```

## 结论

功能正常运行，测试通过。

## 其他说明

若遇到以下情况，请参见[这里](https://github.com/microseyuyu/RISCV-testcase/blob/openmpi/Open%20MPI/testcase/解决mpirun%20has%20detected%20an%20attempt%20to%20run%20as%20root.md)

```mpirun has detected an attempt to run as root.```

测试使用 MPI_Send 和 MPI_Recv 组织代码源码，请参见[这里](https://github.com/mpitutorial/mpitutorial/tree/gh-pages/tutorials/mpi-reduce-and-allreduce/code/reduce_stddev.c)
