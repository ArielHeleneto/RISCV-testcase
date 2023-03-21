# __filename

## 摘要

**__filename** 表示当前正在执行的脚本的文件名。它将输出文件所在位置的绝对路径，且和命令行参数所指定的文件名不一定相同。 如果在模块中，返回的值是模块文件的路径。

### 操作步骤

创建文件 main.js ，代码如下所示：

```
// 输出全局变量 __filename 的值
console.log( __filename );
```

执行 main.js 文件，代码如下所示:

```
$ node main.js
/web/com/runoob/nodejs/main.js
```

## 预期结果

```
[root@openEuler-riscv64 nodejs-test]# node main.js
/root/nodejs-test/main.js
```

## 其他说明

```
[root@openEuler-riscv64 nodejs-test]# node main.js
node:internal/modules/cjs/loader:936
  throw err;
  ^

Error: Cannot find module '/root/nodejs-test/mijs'
    at Function.Module._resolveFilename (node:internal/modules/cjs/loader:933:15)
    at Function.Module._load (node:internal/modules/cjs/loader:778:27)
    at Function.executeUserEntryPoint [as runMain] (node:internal/modules/run_main:77:12)
    at node:internal/main/run_main_module:17:47 {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}
```

若出现以上错误，则说明运行该脚本的根目录缺失 **mijs** 模型。

可以通过安装该模型进行解决，请输入以下指令：

```
npm install mijs
```

## 其他说明

无。
