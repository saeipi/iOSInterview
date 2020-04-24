//
//  KSDispatchGroupcController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSDispatchGroupcController.h"

@interface KSDispatchGroupcController ()

@end

@implementation KSDispatchGroupcController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//requestDatasGroup1 和 requestDatasGroup2 效果一样
- (void)requestDatasGroup1 {
    // 创建调度组
    dispatch_group_t group = dispatch_group_create();
    // 创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

    // 模拟异步发送网络请求 A
    // 入组
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"接口 A 数据请求完成");
        // 出组
        dispatch_group_leave(group);
    });
    
    // 模拟异步发送网络请求 B
    // 入组
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"接口 B 数据请求完成");
        // 出组
        dispatch_group_leave(group);
    });
    
    NSLog(@"我是最开始执行的，异步操作里的打印是后执行的");
    
    // 调度组的任务都执行完毕
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"接口 A 和接口 B 的数据请求都已经完毕！, 开始合并两个接口的数据");
    });
}

- (void)requestDatasGroup2 {
    // 创建调度组
    dispatch_group_t group = dispatch_group_create();
    // 创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"接口 1 数据请求完成");
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:4.0];
        NSLog(@"接口 2 数据请求完成");
    });
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"接口 3 数据请求完成");
    });

    NSLog(@"我是最开始执行的，异步操作里的打印是后执行的");
    // 调度组的任务都执行完毕
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"接口1 2 3 的数据请求都已经完毕！, 开始合并两个接口的数据");
    });
}

@end
