# clearTimeout(t)

## 摘要

**clearTimeout( t )** 全局函数用于停止一个之前通过 setTimeout() 创建的定时器。 参数 **t** 是通过 setTimeout() 函数创建的定时器。

## 操作步骤

创建文件 main.js ，代码如下所示：

```
function printHello(){
   console.log( "Hello, World!");
}
// 两秒后执行以上函数
var t = setTimeout(printHello, 2000);

// 清除定时器
clearTimeout(t);
```

执行 main.js 文件，代码如下所示:

```
$ node main.js
```

## 预期结果

没有任何输出表示指令正常运行。

## 其他说明

无。