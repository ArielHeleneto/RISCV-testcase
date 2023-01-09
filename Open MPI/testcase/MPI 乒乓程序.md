# MPI 乒乓程序

## 摘要

乒乓程序会一直使用 MPI_Send 和 MPI_Recv 的方法“推挡”消息。

## 操作步骤

```git clone https://github.com/mpitutorial/mpitutorial```

该步骤是在 GitHub 上 clone 一个仓库到本地，以便调用其中的代码进行 MPI 乒乓程序的测试。

clone 完成后，进入文件夹中的 tutorials 。

```cd mpitutorial/tutorials```

开始运行脚本进行测试乒乓程序。

```./run.py ping_pong```

## 预期结果

```
0 sent and incremented ping_pong_count 1 to 1
0 received ping_pong_count 2 from 1
0 sent and incremented ping_pong_count 3 to 1
0 received ping_pong_count 4 from 1
0 sent and incremented ping_pong_count 5 to 1
0 received ping_pong_count 6 from 1
0 sent and incremented ping_pong_count 7 to 1
0 received ping_pong_count 8 from 1
0 sent and incremented ping_pong_count 9 to 1
0 received ping_pong_count 10 from 1
1 received ping_pong_count 1 from 0
1 sent and incremented ping_pong_count 2 to 0
1 received ping_pong_count 3 from 0
1 sent and incremented ping_pong_count 4 to 0
1 received ping_pong_count 5 from 0
1 sent and incremented ping_pong_count 6 to 0
1 received ping_pong_count 7 from 0
1 sent and incremented ping_pong_count 8 to 0
1 received ping_pong_count 9 from 0
1 sent and incremented ping_pong_count 10 to 0
```

## 实际结果

```
mpirun -n 2  ./mpi-send-and-receive/code/ping_pong
0 sent and incremented ping_pong_count 1 to 1
1 received ping_pong_count 1 from 0
1 sent and incremented ping_pong_count 2 to 0
0 received ping_pong_count 2 from 1
0 sent and incremented ping_pong_count 3 to 1
1 received ping_pong_count 3 from 0
1 sent and incremented ping_pong_count 4 to 0
0 received ping_pong_count 4 from 1
0 sent and incremented ping_pong_count 5 to 1
0 received ping_pong_count 6 from 1
0 sent and incremented ping_pong_count 7 to 1
0 received ping_pong_count 8 from 1
0 sent and incremented ping_pong_count 9 to 1
1 received ping_pong_count 5 from 0
1 sent and incremented ping_pong_count 6 to 0
1 received ping_pong_count 7 from 0
1 sent and incremented ping_pong_count 8 to 0
1 received ping_pong_count 9 from 0
1 sent and incremented ping_pong_count 10 to 0
0 received ping_pong_count 10 from 1
```

## 结论

测试通过，功能正常运行。

## 其他说明

若遇到以下情况，请参见[这里](https://github.com/microseyuyu/RISCV-testcase/blob/openmpi/Open%20MPI/testcase/解决mpirun%20has%20detected%20an%20attempt%20to%20run%20as%20root.md)

```mpirun has detected an attempt to run as root.```

源码，请参见[这里](https://github.com/mpitutorial/mpitutorial/blob/gh-pages/tutorials/mpi-send-and-receive/code/ping_pong.c)
