# 使用 MPI_Scatter 和 MPI_Gather 来计算平均数

## 摘要

测试使用 MPI_Scatter 和 MPI_Gather 来计算平均数。

## 函数原型

```
MPI_Scatter(
    void* send_data,
    int send_count,
    MPI_Datatype send_datatype,
    void* recv_data,
    int recv_count,
    MPI_Datatype recv_datatype,
    int root,
    MPI_Comm communicator)
```

```
MPI_Gather(
    void* send_data,
    int send_count,
    MPI_Datatype send_datatype,
    void* recv_data,
    int recv_count,
    MPI_Datatype recv_datatype,
    int root,
    MPI_Comm communicator)
```

## 操作步骤

```git clone https://github.com/mpitutorial/mpitutorial```

该步骤是在 GitHub 上 clone 一个仓库到本地，以便调用其中的代码进行使用 MPI_Scatter 和 MPI_Gather 来计算平均数的测试。

clone 完成后，进入文件夹中的 tutorials 。

```cd mpitutorial/tutorials```

开始运行脚本进行测试。

```./run.py avg```

## 预期结果

```
/home/kendall/bin/mpirun -n 4 ./avg 100
Avg of all elements is 0.478699
Avg computed across original data is 0.478699
```

## 实际结果

```
mpirun -n 4  ./mpi-scatter-gather-and-allgather/code/avg 100
Avg of all elements is 0.496958
Avg computed across original data is 0.496958
```

## 结论

功能正常运行，测试通过。

## 其他说明

若遇到以下情况，请参见[这里](https://github.com/microseyuyu/RISCV-testcase/blob/openmpi/Open%20MPI/testcase/解决mpirun%20has%20detected%20an%20attempt%20to%20run%20as%20root.md)

```mpirun has detected an attempt to run as root.```

测试使用 MPI_Scatter 和 MPI_Gather 来计算平均数源码，请参见[这里](https://github.com/mpitutorial/mpitutorial/blob/gh-pages/tutorials/mpi-scatter-gather-and-allgather/code/avg.c)
