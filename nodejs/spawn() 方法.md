# spawn() 方法

## 摘要

child_process.spawn 使用指定的命令行参数创建新进程，语法格式如下：

```
child_process.spawn(command[, args][, options])
```

### 参数

参数说明如下：

**command：** 将要运行的命令

**args：** Array 字符串参数数组

**options Object**

- cwd String 子进程的当前工作目录
- env Object 环境变量键值对
- stdio Array|String 子进程的 stdio 配置
- detached Boolean 这个子进程将会变成进程组的领导
- uid Number 设置用户进程的 ID
- gid Number 设置进程组的 ID

spawn() 方法返回流 (stdout & stderr)，在进程返回大量数据时使用。进程一旦开始执行时 spawn() 就开始接收响应。

> support.js 文件代码：

```
console.log("进程 " + process.argv[2] + " 执行。" );
```

> master.js 文件代码：

```
const fs = require('fs'); const child_process = require('child_process');  for(var i=0; i<3; i++) {   var workerProcess = child_process.spawn('node', ['support.js', i]);    workerProcess.stdout.on('data', function (data) {      console.log('stdout: ' + data);   });    workerProcess.stderr.on('data', function (data) {      console.log('stderr: ' + data);   });    workerProcess.on('close', function (code) {      console.log('子进程已退出，退出码 '+code);   }); }
```

## 预期结果

```
[root@openEuler-riscv64 nodejs-test]# node master.js
stdout: 进程 0 执行。

stdout: 进程 1 执行。

子进程已退出，退出码 0
子进程已退出，退出码 0
stdout: 进程 2 执行。

子进程已退出，退出码 0
```

