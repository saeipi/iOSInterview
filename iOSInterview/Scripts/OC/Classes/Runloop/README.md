```
https://blog.csdn.net/SEVEN_ELEVEN_LGW/article/details/83752941

// method 1 苹果的描述中有这样一句话:If you want the run loop to terminate, you shouldn't use this method. 
// 意思就是如果你想让这个runloop退出,那就不要用这个方法.
- (void)run;
// method 2 苹果的描述中有这样一句话: If no input sources or timers are attached to the run loop, this method exits immediately. 
// 意思就是当没有输入源或者timer加入到runloop中时,runloop会立即退出
- (void)runUntilDate:(NSDate *)limitDate;
// method 3 苹果描述中有这样一句话: If no input sources or timers are attached to the run loop, this method exits immediately and returns NO. 
// 意思就是当没有输入源或者timer加入到runloop中时,runloop会立即退出并返回NO.
- (BOOL)runMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate;

# 小结
// 1.如果我们通过run方法启动runloop是无法退出runloop的,所以子线程无法释放,其引用的target便不能释放.
// 2.在子线程中使用NSTimer,要通过runUntilDate: 或 runMode: beforeDateL:来启动runloop才可以控制子线程的释放.

#扩展
/*
 * 关于run的使用,我目前了解到的就是常驻线程(当然也有可能在其他方面用到,欢迎在评论中补充,谢谢)
 * 最典型的例子就是AFN2.xxx版本,里面就是创建了一个常驻线程.在AFN3.0只后的版本便不再创建常驻线程了.
 * 原因是从iOS9.0开始 苹果deprecated了 NSURLConnection。 替代方案就是NSURLSession。
   这里有篇文章可详细了解:https://www.jianshu.com/p/b5c27669e2c1
 */
// 创建常驻线程代码,这里AFN是用单例去创建的
+ (void)networkRequestThreadEntryPoint:(id)__unused object {
    @autoreleasepool {
        [[NSThread currentThread] setName:@"AFNetworking"];
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}

+ (NSThread *)networkRequestThread {
    static NSThread *_networkRequestThread = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _networkRequestThread = [[NSThread alloc] initWithTarget:self selector:@selector(networkRequestThreadEntryPoint:) object:nil];
        [_networkRequestThread start];
    });
    return _networkRequestThread;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"test";
    self.view.backgroundColor = [UIColor whiteColor];
    NSThread *threadA = [[NSThread alloc] initWithTarget:self selector:@selector(initTimer) object:nil];
    [threadA setName:@"testThreadA"];
    [threadA start];
    self.thread = threadA;

    //监听子线程的释放（为了证明下面@autoreleasepool{}的写法可以释放我们的子线程）
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(threadfinishTask:) name:NSThreadWillExitNotification object:nil];

}

- (void)threadfinishTask:(NSNotification *)notification{
    NSLog(@"==============================子线程被释放了！");
}

- (void)initTimer {

    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(refreshData) userInfo:@{@"key":@"value"} repeats:YES];
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];

}

- (void)refreshData {
    self.i ++;
    NSLog(@"%@",@(self.i));
}

- (void)cancelTimer {
    if (_timer) {
        if ([_timer isValid]) { // 如果timer还在runLoop中
            [_timer invalidate];
        }
        _timer = nil;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self performSelector:@selector(cancelTimer) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)dealloc {
    NSLog(@"dealloc~~~~~~~~~~~~ ");
}

```
