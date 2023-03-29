# Python 测试步骤

## 部署测试环境

* 使用 QEMU 启动 openEuler 22.03
* 安装 Python 3.8

## 获取测试集

从 [openKylin 的 Python3.8 Fork](https://gitee.com/openkylin/python3.8/)
获取 ``python3.8`` 源代码。QEMU 使用 user mode 模拟网卡时宿主机被映射为 IP 地址
为 ``10.0.2.2`` 的机器；若宿主机有运行 ``OpenSSH`` 服务可在宿主机下载源代码后使
用 ``scp`` 拷贝到虚拟机中。

```Shell
$ scp <user>@10.0.2.2:<path-to-source> .
```

## 运行测试集

解压源代码包，目录结构如下：

```
cpython3.
├── Doc
├── Grammar
├── Include
├── Lib
├── LICENSE
├── Mac
├── Misc
├── Modules
├── Objects
├── Parser
├── PC
├── PCbuild
├── Programs
├── Python
└── Tools
```


切换到源代码目录下的 ``Lib`` 目录并执行

```shell
python3.8 -m test -j N		# N 表示运行测试的线程数
```

## Python 测试集运行参数

参考 Python 官方文档的 [Running and Writing Tests](
https://devguide.python.org/testing/run-write-tests/)。

```shell
python3.8 -m test [选项]
```

其中测试集应该为某个测试对应的名字，不包含文件扩展名。

### 参数

- ``-h``: 输出帮助
- ``-j``: 指定运行测试的线程数（并发数，类似 ``make`` 的参数）。
指定为 ``-j 0`` 时将会自动选择线程数。
- ``-r``: 随机化测试顺序
- ``-v``: 输出详细信息
- ``-Wd``: 严格比对测试输出与预期结果
- ``-w``: 重试失败的测试
- ``-uall``: 允许使用一切可能的资源（例如网络访问）来进行测试。
- ``-R``: 检测引用计数中的泄漏（仅在修改 C 源码时需要）。``-R a:b`` 将会先运行 a
  次测试以稳定引用计数，此后运行 b 次测试检查是否有泄漏。

### 测试文件与测试用例

每个测试文件 (test file) 中包含多个测试用例 (test case)

### 运行单个测试文件

```shell
python3.8 -m <测试文件名>
```

此处测试文件名不应当包含后缀名，例如，``test_abc`` 是正确的，但
``test_abc.py`` 不是。

### 运行单个测试集

```shell
python3.8 -m unittest <引入测试集的包路径>
```

例如，对于 ``test_abc`` 测试文件下的 ``TestABC_Py`` 测试用例，其包路径为
``test.test_abc.TestABC_Py``。
