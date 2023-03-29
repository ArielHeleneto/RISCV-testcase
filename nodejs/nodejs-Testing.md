# Node.js-Testing

## 部署测试环境

* 使用 QEMU 启动 openEuler 22.03
* 构建 Node.js

## 开始构建 Node.js

先创建一个名为 rpmbuild 的文件夹，并使用 cd 指令进入。

接着我们需要克隆[ nodejs 的仓库 ](https://gitee.com/openeuler-risc-v/nodejs)到 rpmbuild 中，并且创建一个名为 SOURCES 的文件夹，使用以下指令执行：

```
 git clone https://gitee.com/openeuler-risc-v/nodejs SOURCES -b openEuler-22.03-LTS --depth 1
```

> 该仓库中存在许多的分支，所以需要指定对应系统版本的 nodejs 进行 clone。

完成 clone 后，将 SOURCES 中的 nodejs.spec 与 node.js 拷贝到 rpmbuild 中，使用以下指令执行：

```
cp SOURCES/nodejs.spec nodejs
cp SOURCES/nodejs.spec nodejs.spec
```

开始构建 nodejs ，请输入以下指令开始构建：

```
rpmbuild -bp nodejs.spec
rpmbuild -bb nodejs.spec
```

> 其中 -bp 的意思是开始进行准备， -bb 是开始编译。

### 您可能遇到的状况

```
[root@openEuler-riscv64 rpmbuild]# rpmbuild -bb nodejs.spec
error: Failed build dependencies:
 brotli-devel is needed by nodejs-1:16.14.2-1.riscv64
 chrpath is needed by nodejs-1:16.14.2-1.riscv64
 libnghttp2-devel >= 1.45.0 is needed by nodejs-1:16.14.2-1.riscv64
 libuv-devel >= 1:1.43.0 is needed by nodejs-1:16.14.2-1.riscv64
 nodejs-packaging is needed by nodejs-1:16.14.2-1.riscv64
 openssl-devel >= 1:1.1.1 is needed by nodejs-1:16.14.2-1.riscv64
 python3-devel is needed by nodejs-1:16.14.2-1.riscv64
```

若出现以上的报错，说明您的系统中缺失了构建所需的依赖。请使用 yum 进行补充，例如安装 brotli-devel ：

```
yum install brotli-devel
```


## 安装 Node.js

将此版本的 *Node.js* 安装到系统目录中：

```shell
$ [sudo] make install
```

## 运行测试

要验证构建：

```shell
$ make test-only
```

此时，您已准备好更改代码并重新运行测试。

如果您在提交拉取请求之前运行测试，请使用：

```shell
$ make -j4 test
```

make -j4 test 对代码库进行全面检查，包括运行 linter 和文档测试。

要在不运行测试的情况下运行 linter，请使用 `make lint/ vcbuild lint`。它会检查 *JavaScript*、*C++* 和 *Markdown* 文件。

如果您正在更新测试并希望在单个测试文件中运行测试（例如 `test/parallel/test-stream2-transform.js`）：

```shell
$ tools/test.py test/parallel/test-stream2-transform.js
```

您可以通过提供子系统的名称来为给定的子系统执行整套测试：

```shell
$ tools/test.py child-process
```

您还可以在测试套件目录（例如 `test/message`）中执行测试：

```shell
$ tools/test.py test/message
```

如果要检查其他选项，请使用以下 `--help` 选项参考帮助：

```shell
$ tools/test.py --help
```

注意：在 *Windows* 上，您应该使用 `python3` 可执行文件。例如：`python3 tools/test.py test/message`

您通常可以直接使用节点运行测试：

```shell
$ ./node test/parallel/test-stream2-transform.js
```

### 说明：`./node` 指向您本地的 Node.js 构建。

`make -j4` 如果更改 `lib` 或 `src` 目录中的代码，请记住在测试运行之间重新编译。

这些测试尝试检测对 IPv6 的支持，并在适当时排除 IPv6 测试。如果您的主接口有 IPv6 地址，那么您的环回接口也必须启用 “::1”。对于 *OpenEuler* 上的某些默认安装，情况似乎并非如此。要在 *OpenEuler* 的环回接口上启用 “::1”：

```shell
sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=0
```

如果您的 *IDE* 配置存在，您可以使用 `node-code-ide-configs` 来运行/调试测试。

## 运行覆盖

确保您添加或更改的任何代码都包含在测试中是一种很好的做法。您可以通过在启用覆盖的情况下运行测试套件来做到这一点：

```shell
$ ./configure --coverage
$ make coverage
```

将 `coverage/index.html` 针对 JavaScript 覆盖率和 `coverage/cxxcoverage.html` C++ 覆盖率编写一份详细的覆盖率报告。

如果您只想运行 JavaScript 测试，则不需要运行第一个命令 (`./configure --coverage`)。运行 `make coverage-run-js`, 以独立于 C++ 测试套件执行 JavaScript 测试：

```shell
$ make coverage-run-js
```

如果您正在更新测试并希望收集单个测试文件的覆盖率（例如 `test/parallel/test-stream2-transform.js`）：

```shell
$ make coverage-clean
$ NODE_V8_COVERAGE=coverage/tmp tools/test.py test/parallel/test-stream2-transform.js
$ make coverage-report-js
```

您可以通过提供子系统的名称来收集给定子系统的整个测试套件的覆盖率：

```shell
$ make coverage-clean
$ NODE_V8_COVERAGE=coverage/tmp tools/test.py --mode=release child-process
$ make coverage-report-js
```

该 `make coverage` 命令将一些工具下载到项目根目录。生成覆盖率报告后进行清理：

```shell
$ make coverage-clean
```

## 从命令行运行测试

可以通过传入 `--test` 标志从命令行调用 *Node.js* 测试运行程序：

```shell
node --test
```

默认情况下，*Node.js* 将递归搜索当前目录以查找匹配特定命名约定的 *JavaScript* 源文件。 匹配文件作为测试文件执行。 有关预期测试文件命名约定和行为的更多信息可以在测试运行器执行模型章节中找到。

或者，可以提供一个或多个路径作为 *Node.js* 命令的最终参数，如下所示。

```shell
node --test test1.js test2.mjs custom_test_dir/
```

在本例中，测试运行程序将执行文件 `test1.js` 和 `test2.mjs`。 测试运行器还将递归搜索 `custom_test_dir/` 目录以查找要执行的测试文件。

## 测试运行器执行模型

当搜索要执行的测试文件时，测试运行器的行为如下：

执行用户显式提供的任何文件。
如果用户没有显式地指定任何路径，则递归搜索当前工作目录中指定的文件，如以下步骤所示。
除非用户显式地提供，否则跳过 `node_modules` 目录。
如果遇到名为 `test` 的目录，则测试运行程序将递归搜索所有 `.js`、`.cjs` 和 `.mjs` 文件。 所有这些文件都被视为测试文件，不需要匹配下面详述的特定命名约定。 这是为了适应将所有测试放在单个 `test` 目录中的项目。
在所有其他目录中，匹配以下模式的 `.js`、`.cjs` 和 `.mjs` 文件被视为测试文件：
`^test$` - 基本名称为字符串 `'test'` 的文件。 示例：`test.js`、`test.cjs`、`test.mjs`。
`^test-.+` - 基本名称以字符串 `'test-'` 开头，后跟一个或多个字符的文件。 示例：`test-example.js`、`test-another-example.mjs`。
`.+[\.\-\_]test$` - 基本名称以 `.test`、`-test` 或 `_test` 结尾的文件，前面有一个或多个字符。 示例：`example.test.js`、`example-test.cjs`、`example_test.mjs`。
*Node.js* 理解的其他文件类型，例如 `.node` 和 `.json`，不会由测试运行程序自动执行，但如果在命令行上显式地提供，则支持。
每个匹配的测试文件都在单独的子进程中执行。 如果子进程以退出代码 0 结束，则认为测试通过。 否则，认为测试失败。 测试文件必须是 *Node.js* 可执行文件，但不需要在内部使用 `node:test` 模块。

## 说明

参考网站：http://nodejs.cn/api-v16/test.html

