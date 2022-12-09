# 使用 MPI 计算并行排名

## 摘要

测试使用 MPI 计算并行排名。

## 函数原型

```
TMPI_Rank(
    void *send_data,
    void *recv_data,
    MPI_Datatype datatype,
    MPI_Comm comm)
```

## 操作步骤

```git clone https://github.com/mpitutorial/mpitutorial```

该步骤是在 GitHub 上 clone 一个仓库到本地，以便调用其中的代码进行使用  MPI_Send 和 MPI_Recv 组织代码的测试。

clone 完成后，进入文件夹中的 tutorials 。

```cd mpitutorial/tutorials```

开始运行脚本进行测试。

```./run.py random_rank```

## 预期结果

```
mpirun -n 4  ./random_rank 100
Rank for 0.242578 on process 0 - 0
Rank for 0.894732 on process 1 - 3
Rank for 0.789463 on process 2 - 2
Rank for 0.684195 on process 3 - 1
```

## 实际结果

```
mpirun -n 4  ./performing-parallel-rank-with-mpi/code/random_rank 100
Rank for 0.840188 on process 0 - 2
Rank for 0.253774 on process 2 - 0
Rank for 0.740132 on process 3 - 1
Rank for 0.972745 on process 1 - 3
```

## 结论

功能正常运行，测试通过。

## 其他说明

若遇到以下情况，请参见[这里](https://github.com/microseyuyu/RISCV-testcase/blob/openmpi/Open%20MPI/testcase/解决mpirun%20has%20detected%20an%20attempt%20to%20run%20as%20root.md)

```mpirun has detected an attempt to run as root.```

测试使用 MPI 计算并行排名源码，请参见[这里](https://github.com/mpitutorial/mpitutorial/tree/gh-pages/tutorials/performing-parallel-rank-with-mpi/code/random_rank.c)
