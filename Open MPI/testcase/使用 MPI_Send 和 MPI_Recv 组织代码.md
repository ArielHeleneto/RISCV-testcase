# 使用 MPI_Send 和 MPI_Recv 组织代码

## 摘要

测试使用 MPI_Send 和 MPI_Recv 组织代码。

## 说明

在该测试中，使用 MPI_Send 和 MPI_Recv 组织代码实现以下功能：

- 初始化 walkers 。
- 使用 walk 函数使 walkers 前进。
- 发出 outgoing_walkers 向量的所有 walkers 。
- 将新接受的 walkers 放入 incoming _walkers 向量中。
- 重复步骤 2 到 4 ，知道所有 walkers 完成。

## 操作步骤

```git clone https://github.com/mpitutorial/mpitutorial```

该步骤是在 GitHub 上 clone 一个仓库到本地，以便调用其中的代码进行使用  MPI_Send 和 MPI_Recv 组织代码的测试。

clone 完成后，进入文件夹中的 tutorials 。

```cd mpitutorial/tutorials```

开始运行脚本进行测试。

```./run.py random_walk```

## 预期结果

```
mpirun -n 5 ./random_walk 100 500 20
Process 2 initiated 20 walkers in subdomain 40 - 59
Process 2 sending 18 outgoing walkers to process 3
Process 3 initiated 20 walkers in subdomain 60 - 79
Process 3 sending 20 outgoing walkers to process 4
Process 3 received 18 incoming walkers
Process 3 sending 18 outgoing walkers to process 4
Process 4 initiated 20 walkers in subdomain 80 - 99
Process 4 sending 18 outgoing walkers to process 0
Process 0 initiated 20 walkers in subdomain 0 - 19
Process 0 sending 17 outgoing walkers to process 1
Process 0 received 18 incoming walkers
Process 0 sending 16 outgoing walkers to process 1
Process 0 received 20 incoming walkers
```

## 实际结果

```
mpirun -n 5  ./point-to-point-communication-application-random-walk/code/random_walk 100 500 20
Process 1 initiated 20 walkers in subdomain 20 - 39
Process 1 sending 20 outgoing walkers to process 2
Process 3 initiated 20 walkers in subdomain 60 - 79
Process 3 sending 18 outgoing walkers to process 4
Process 4 initiated 20 walkers in subdomain 80 - 99
Process 4 sending 20 outgoing walkers to process 0
Process 0 initiated 20 walkers in subdomain 0 - 19
Process 0 sending 20 outgoing walkers to process 1
Process 2 initiated 20 walkers in subdomain 40 - 59
Process 2 sending 19 outgoing walkers to process 3
Process 0 received 20 incoming walkers
Process 0 sending 17 outgoing walkers to process 1
Process 1 received 20 incoming walkers
Process 1 sending 20 outgoing walkers to process 2
Process 1 received 17 incoming walkers
Process 1 sending 15 outgoing walkers to process 2
Process 2 received 20 incoming walkers
Process 2 sending 19 outgoing walkers to process 3
Process 2 received 20 incoming walkers
Process 2 sending 20 outgoing walkers to process 3
Process 3 received 19 incoming walkers
Process 3 sending 18 outgoing walkers to process 4
Process 3 received 19 incoming walkers
Process 3 sending 19 outgoing walkers to process 4
Process 3 received 20 incoming walkers
Process 3 sending 19 outgoing walkers to process 4
Process 4 received 18 incoming walkers
Process 4 sending 18 outgoing walkers to process 0
Process 1 received 17 incoming walkers
Process 1 sending 17 outgoing walkers to process 2
Process 0 received 18 incoming walkers
Process 0 sending 17 outgoing walkers to process 1
Process 2 received 15 incoming walkers
Process 2 sending 14 outgoing walkers to process 3
Process 3 received 14 incoming walkers
Process 3 sending 14 outgoing walkers to process 4
Process 4 received 18 incoming walkers
Process 4 sending 17 outgoing walkers to process 0
Process 2 received 17 incoming walkers
Process 2 sending 17 outgoing walkers to process 3
Process 1 received 17 incoming walkers
Process 1 sending 17 outgoing walkers to process 2
Process 0 received 17 incoming walkers
Process 0 sending 17 outgoing walkers to process 1
Process 4 received 19 incoming walkers
Process 4 sending 19 outgoing walkers to process 0
Process 4 received 19 incoming walkers
Process 4 sending 18 outgoing walkers to process 0
Process 4 received 14 incoming walkers
Process 4 sending 13 outgoing walkers to process 0
Process 3 received 17 incoming walkers
Process 3 sending 16 outgoing walkers to process 4
Process 3 received 15 incoming walkers
Process 1 received 19 incoming walkers
Process 1 sending 19 outgoing walkers to process 2
Process 1 received 18 incoming walkers
Process 1 sending 17 outgoing walkers to process 2
Process 0 received 19 incoming walkers
Process 0 sending 19 outgoing walkers to process 1
Process 0 received 18 incoming walkers
Process 0 sending 18 outgoing walkers to process 1
Process 0 received 13 incoming walkers
Process 0 sending 13 outgoing walkers to process 1
Process 0 received 13 incoming walkers
Process 0 sending 13 outgoing walkers to process 1
Process 1 received 13 incoming walkers
Process 1 sending 13 outgoing walkers to process 2
Process 1 received 13 incoming walkers
Process 4 received 16 incoming walkers
Process 4 sending 13 outgoing walkers to process 0
Process 4 received 14 incoming walkers
Process 4 sending 10 outgoing walkers to process 0
Process 4 received 17 incoming walkers
Process 4 sending 17 outgoing walkers to process 0
Process 2 received 17 incoming walkers
Process 2 sending 15 outgoing walkers to process 3
Process 2 received 19 incoming walkers
Process 2 sending 18 outgoing walkers to process 3
Process 2 received 17 incoming walkers
Process 2 sending 17 outgoing walkers to process 3
Process 2 received 13 incoming walkers
Process 2 sending 13 outgoing walkers to process 3
Process 2 received 13 incoming walkers
Process 3 sending 14 outgoing walkers to process 4
Process 3 received 18 incoming walkers
Process 3 sending 17 outgoing walkers to process 4
Process 3 received 17 incoming walkers
Process 3 sending 16 outgoing walkers to process 4
Process 3 received 13 incoming walkers
Process 0 received 10 incoming walkers
Process 0 sending 10 outgoing walkers to process 1
Process 0 received 17 incoming walkers
Process 0 sending 17 outgoing walkers to process 1
Process 0 received 14 incoming walkers
Process 0 sending 14 outgoing walkers to process 1
Process 0 received 12 incoming walkers
Process 0 sending 11 outgoing walkers to process 1
Process 0 received 11 incoming walkers
Process 0 sending 11 outgoing walkers to process 1
Process 1 sending 13 outgoing walkers to process 2
Process 1 received 10 incoming walkers
Process 1 sending 9 outgoing walkers to process 2
Process 1 received 17 incoming walkers
Process 1 sending 15 outgoing walkers to process 2
Process 1 received 14 incoming walkers
Process 1 sending 13 outgoing walkers to process 2
Process 1 received 11 incoming walkers
Process 1 sending 10 outgoing walkers to process 2
Process 1 received 11 incoming walkers
Process 1 sending 10 outgoing walkers to process 2
Process 4 received 16 incoming walkers
Process 4 sending 14 outgoing walkers to process 0
Process 4 received 12 incoming walkers
Process 4 sending 12 outgoing walkers to process 0
Process 4 received 12 incoming walkers
Process 4 sending 11 outgoing walkers to process 0
Process 2 sending 13 outgoing walkers to process 3
Process 2 received 9 incoming walkers
Process 2 sending 9 outgoing walkers to process 3
Process 2 received 15 incoming walkers
Process 2 sending 12 outgoing walkers to process 3
Process 3 sending 12 outgoing walkers to process 4
Process 3 received 13 incoming walkers
Process 3 sending 12 outgoing walkers to process 4
Process 3 received 9 incoming walkers
Process 3 sending 9 outgoing walkers to process 4
Process 2 received 13 incoming walkers
Process 2 sending 12 outgoing walkers to process 3
Process 0 received 9 incoming walkers
Process 0 sending 7 outgoing walkers to process 1
Process 1 received 7 incoming walkers
Process 1 sending 7 outgoing walkers to process 2
Process 4 received 9 incoming walkers
Process 4 sending 9 outgoing walkers to process 0
Process 3 received 12 incoming walkers
Process 3 sending 11 outgoing walkers to process 4
Process 4 received 11 incoming walkers
Process 4 sending 10 outgoing walkers to process 0
Process 4 received 11 incoming walkers
Process 4 sending 11 outgoing walkers to process 0
Process 2 received 10 incoming walkers
Process 2 sending 9 outgoing walkers to process 3
Process 0 received 10 incoming walkers
Process 0 sending 10 outgoing walkers to process 1
Process 0 received 11 incoming walkers
Process 0 sending 8 outgoing walkers to process 1
Process 1 received 10 incoming walkers
Process 1 sending 9 outgoing walkers to process 2
Process 3 received 12 incoming walkers
Process 3 sending 11 outgoing walkers to process 4
Process 3 received 9 incoming walkers
Process 3 sending 8 outgoing walkers to process 4
Process 3 received 10 incoming walkers
Process 3 sending 8 outgoing walkers to process 4
Process 1 received 8 incoming walkers
Process 1 sending 8 outgoing walkers to process 2
Process 1 received 4 incoming walkers
Process 1 sending 4 outgoing walkers to process 2
Process 4 received 8 incoming walkers
Process 4 sending 5 outgoing walkers to process 0
Process 4 received 8 incoming walkers
Process 4 sending 8 outgoing walkers to process 0
Process 2 received 10 incoming walkers
Process 2 sending 10 outgoing walkers to process 3
Process 2 received 7 incoming walkers
Process 2 sending 7 outgoing walkers to process 3
Process 2 received 9 incoming walkers
Process 2 sending 8 outgoing walkers to process 3
Process 2 received 8 incoming walkers
Process 2 sending 7 outgoing walkers to process 3
Process 2 received 4 incoming walkers
Process 2 sending 3 outgoing walkers to process 3
Process 0 received 5 incoming walkers
Process 0 sending 4 outgoing walkers to process 1
Process 0 received 8 incoming walkers
Process 0 sending 7 outgoing walkers to process 1
Process 0 received 6 incoming walkers
Process 0 sending 5 outgoing walkers to process 1
Process 0 received 7 incoming walkers
Process 3 received 7 incoming walkers
Process 3 sending 7 outgoing walkers to process 4
Process 3 received 8 incoming walkers
Process 3 sending 8 outgoing walkers to process 4
Process 3 received 7 incoming walkers
Process 3 sending 7 outgoing walkers to process 4
Process 3 received 3 incoming walkers
Process 3 sending 2 outgoing walkers to process 4
Process 3 received 4 incoming walkers
Process 3 sending 3 outgoing walkers to process 4
Process 3 received 3 incoming walkers
Process 3 sending 2 outgoing walkers to process 4
Process 3 received 3 incoming walkers
Process 3 sending 0 outgoing walkers to process 4
Process 3 received 1 incoming walkers
Process 3 sending 0 outgoing walkers to process 4
Process 3 received 1 incoming walkers
Process 3 sending 0 outgoing walkers to process 4
Process 1 received 7 incoming walkers
Process 1 sending 6 outgoing walkers to process 2
Process 1 received 5 incoming walkers
Process 1 sending 3 outgoing walkers to process 2
Process 1 received 6 incoming walkers
Process 1 sending 5 outgoing walkers to process 2
Process 1 received 3 incoming walkers
Process 1 sending 3 outgoing walkers to process 2
Process 1 received 2 incoming walkers
Process 1 sending 1 outgoing walkers to process 2
Process 1 received 2 incoming walkers
Process 1 sending 0 outgoing walkers to process 2
Process 1 received 0 incoming walkers
Process 1 sending 0 outgoing walkers to process 2
Process 1 received 0 incoming walkers
Process 1 sending 0 outgoing walkers to process 2
Process 1 received 0 incoming walkers
Process 1 done
Process 4 received 7 incoming walkers
Process 4 sending 6 outgoing walkers to process 0
Process 4 received 8 incoming walkers
Process 4 sending 7 outgoing walkers to process 0
Process 4 received 7 incoming walkers
Process 4 sending 4 outgoing walkers to process 0
Process 4 received 2 incoming walkers
Process 4 sending 2 outgoing walkers to process 0
Process 4 received 3 incoming walkers
Process 4 sending 3 outgoing walkers to process 0
Process 4 received 2 incoming walkers
Process 4 sending 1 outgoing walkers to process 0
Process 4 received 0 incoming walkers
Process 4 sending 0 outgoing walkers to process 0
Process 4 received 0 incoming walkers
Process 4 sending 0 outgoing walkers to process 0
Process 4 received 0 incoming walkers
Process 4 sending 0 outgoing walkers to process 0
Process 2 received 6 incoming walkers
Process 2 sending 4 outgoing walkers to process 3
Process 2 received 3 incoming walkers
Process 2 sending 3 outgoing walkers to process 3
Process 2 received 5 incoming walkers
Process 2 sending 3 outgoing walkers to process 3
Process 2 received 3 incoming walkers
Process 2 sending 1 outgoing walkers to process 3
Process 2 received 1 incoming walkers
Process 2 sending 1 outgoing walkers to process 3
Process 2 received 0 incoming walkers
Process 2 sending 0 outgoing walkers to process 3
Process 2 received 0 incoming walkers
Process 2 sending 0 outgoing walkers to process 3
Process 2 received 0 incoming walkers
Process 2 done
Process 0 sending 6 outgoing walkers to process 1
Process 0 received 4 incoming walkers
Process 0 sending 3 outgoing walkers to process 1
Process 0 received 2 incoming walkers
Process 0 sending 2 outgoing walkers to process 1
Process 0 received 3 incoming walkers
Process 0 sending 2 outgoing walkers to process 1
Process 0 received 1 incoming walkers
Process 0 sending 0 outgoing walkers to process 1
Process 0 received 0 incoming walkers
Process 0 sending 0 outgoing walkers to process 1
Process 0 received 0 incoming walkers
Process 0 sending 0 outgoing walkers to process 1
Process 0 received 0 incoming walkers
Process 0 done
Process 3 received 0 incoming walkers
Process 3 sending 0 outgoing walkers to process 4
Process 3 received 0 incoming walkers
Process 3 done
Process 4 received 0 incoming walkers
Process 4 done
```

## 结论

功能正常运行，测试通过。

## 其他说明

在此项目中可能会碰到死锁的情况，如何预防死锁请参见这里。

若遇到以下情况，请参见[这里](https://github.com/microseyuyu/RISCV-testcase/blob/openmpi/Open%20MPI/testcase/解决mpirun%20has%20detected%20an%20attempt%20to%20run%20as%20root.md)

```mpirun has detected an attempt to run as root.```

测试使用 MPI_Send 和 MPI_Recv 组织代码源码，请参见[这里](https://github.com/mpitutorial/mpitutorial/blob/gh-pages/tutorials/point-to-point-communication-application-random-walk/code/random_walk.cc)
