# Process 属性

## Process 属性说明

Process 提供了很多有用的属性，便于我们更好的控制系统的交互：

| 序号. | 属性 & 描述                                                  |
| :---- | :----------------------------------------------------------- |
| 1     | **stdout** 标准输出流。                                      |
| 2     | **stderr** 标准错误流。                                      |
| 3     | **stdin** 标准输入流。                                       |
| 4     | **argv** argv 属性返回一个数组，由命令行执行脚本时的各个参数组成。它的第一个成员总是node，第二个成员是脚本文件名，其余成员是脚本文件的参数。 |
| 5     | **execPath** 返回执行当前脚本的 Node 二进制文件的绝对路径。  |
| 6     | **execArgv** 返回一个数组，成员是命令行下执行脚本时，在Node可执行文件与脚本文件之间的命令行参数。 |
| 7     | **env** 返回一个对象，成员为当前 shell 的环境变量            |
| 8     | **exitCode** 进程退出时的代码，如果进程优通过 process.exit() 退出，不需要指定退出码。 |
| 9     | **version** Node 的版本，比如v0.10.18。                      |
| 10    | **versions** 一个属性，包含了 node 的版本和依赖.             |
| 11    | **config** 一个包含用来编译当前 node 执行文件的 javascript 配置选项的对象。它与运行 ./configure 脚本生成的 "config.gypi" 文件相同。 |
| 12    | **pid** 当前进程的进程号。                                   |
| 13    | **title** 进程名，默认值为"node"，可以自定义该值。           |
| 14    | **arch** 当前 CPU 的架构：'arm'、'ia32' 或者 'x64'。         |
| 15    | **platform** 运行程序所在的平台系统 'darwin', 'freebsd', 'linux', 'sunos' 或 'win32' |
| 16    | **mainModule** require.main 的备选方法。不同点，如果主模块在运行时改变，require.main可能会继续返回老的模块。可以认为，这两者引用了同一个模块。 |

## 操作步骤

创建文件 main.js ，代码如下所示：

```
// 输出到终端
process.stdout.write("Hello World!" + "\n");

// 通过参数读取
process.argv.forEach(function(val, index, array) {
   console.log(index + ': ' + val);
});

// 获取执行路径
console.log(process.execPath);


// 平台信息
console.log(process.platform);
```

## 预期结果

执行 main.js 文件，代码如下所示:

```
[root@openEuler-riscv64 nodejs-test]# node main.js
Hello World!
0: /usr/bin/node
1: /root/nodejs-test/main.js
/usr/bin/node
linux
```

## 其他说明

无。