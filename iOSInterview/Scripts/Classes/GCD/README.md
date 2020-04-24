```
https://www.jianshu.com/p/2d57c72016c6

主列队
let mainQueue = DispatchQueue.main

全局列队
let globalQueue = DispatchQueue.global()

用户创建列队
创建自己的列队，简单的方式就是指定列队的名称即可
let queue = DispatchQueue(label: "com.conpanyName.queue")

```
