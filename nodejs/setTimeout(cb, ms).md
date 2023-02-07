## setTimeout(cb, ms)

## 摘要

**setTimeout(cb, ms)** 全局函数在指定的毫秒(ms)数后执行指定函数(cb)。：setTimeout() 只执行一次指定函数。

返回一个代表定时器的句柄值。

### 操作步骤

创建文件 main.js ，代码如下所示：

```
function printHello(){
   console.log( "Hello, World!");
}
// 两秒后执行以上函数
setTimeout(printHello, 2000);
```

## 预期结果

执行 main.js 文件，代码如下所示:

```
$ node main.js
Hello, World!
```

## 其他说明

无。