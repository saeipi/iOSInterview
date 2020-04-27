```
https://www.jianshu.com/p/e4d5b26b6a36

dispatch_barrier_sync和dispatch_barrier_async
不能使用全局并发队列，否则会散失栅栏函数的意义

共同点：
1、等待在它前面插入队列的任务先执行完
2、等待他们自己的任务执行完再执行后面的任务

不同点：
1、dispatch_barrier_sync将自己的任务插入到队列的时候，需要等待自己的任务结束之后才会继续插入被写在它后面的任务，然后执行它们
2、dispatch_barrier_async将自己的任务插入到队列之后，不会等待自己的任务结束，它会继续把后面的任务插入到队列，然后等待自己的任务结束后才执行后面任务。

-------- dispatch_barrier_async --------

NSLog(@"Start");
dispatch_queue_t queue = dispatch_queue_create("kspro.com", DISPATCH_QUEUE_CONCURRENT);
dispatch_async(queue, ^{
    NSLog(@"1: %@", [NSThread currentThread]);
});
dispatch_async(queue, ^{
    NSLog(@"2: %@", [NSThread currentThread]);
});

dispatch_barrier_async(queue, ^{
    NSLog(@"Barrier: %@", [NSThread currentThread]);
    [NSThread sleepForTimeInterval:2];
});
NSLog(@"Barrier");
dispatch_async(queue, ^{
    NSLog(@"3: %@", [NSThread currentThread]);
});
dispatch_async(queue, ^{
    NSLog(@"4: %@", [NSThread currentThread]);
});
NSLog(@"End");

输出
2020-04-27 19:33:44.558096+0800 XcodeError[9552:256947] Start
2020-04-27 19:33:44.558366+0800 XcodeError[9552:256947] Barrier
2020-04-27 19:33:44.558393+0800 XcodeError[9552:256947] End
2020-04-27 19:33:44.558641+0800 XcodeError[9552:257292] 2: <NSThread: 0x10077a510>{number = 3, name = (null)}
2020-04-27 19:33:44.558643+0800 XcodeError[9552:257291] 1: <NSThread: 0x1006001f0>{number = 2, name = (null)}
2020-04-27 19:33:44.558699+0800 XcodeError[9552:257292] Barrier: <NSThread: 0x10077a510>{number = 3, name = (null)}
2020-04-27 19:33:46.559139+0800 XcodeError[9552:257292] 3: <NSThread: 0x10077a510>{number = 3, name = (null)}
2020-04-27 19:33:46.559134+0800 XcodeError[9552:257291] 4: <NSThread: 0x1006001f0>{number = 2, name = (null)}

-------- dispatch_barrier_sync --------
NSLog(@"Start");
dispatch_queue_t queue = dispatch_queue_create("kspro.com", DISPATCH_QUEUE_CONCURRENT);
dispatch_async(queue, ^{
    NSLog(@"1: %@", [NSThread currentThread]);
});
dispatch_async(queue, ^{
    NSLog(@"2: %@", [NSThread currentThread]);
});

dispatch_barrier_sync(queue, ^{
    NSLog(@"Barrier: %@", [NSThread currentThread]);
    [NSThread sleepForTimeInterval:2];
});
NSLog(@"Barrier");
dispatch_async(queue, ^{
    NSLog(@"3: %@", [NSThread currentThread]);
});
dispatch_async(queue, ^{
    NSLog(@"4: %@", [NSThread currentThread]);
});
NSLog(@"End");
2020-04-27 19:35:45.350537+0800 XcodeError[9593:258461] Start
2020-04-27 19:35:45.351078+0800 XcodeError[9593:258495] 2: <NSThread: 0x101e001e0>{number = 3, name = (null)}
2020-04-27 19:35:45.351080+0800 XcodeError[9593:258494] 1: <NSThread: 0x10072b700>{number = 2, name = (null)}
2020-04-27 19:35:45.351172+0800 XcodeError[9593:258461] Barrier: <NSThread: 0x10050b130>{number = 1, name = main}
2020-04-27 19:35:47.354767+0800 XcodeError[9593:258461] Barrier
2020-04-27 19:35:47.354886+0800 XcodeError[9593:258461] End
2020-04-27 19:35:47.354992+0800 XcodeError[9593:258494] 3: <NSThread: 0x10072b700>{number = 2, name = (null)}
2020-04-27 19:35:47.354999+0800 XcodeError[9593:258495] 4: <NSThread: 0x101e001e0>{number = 3, name = (null)}
```
