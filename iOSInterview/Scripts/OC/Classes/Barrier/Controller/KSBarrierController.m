//
//  KSBarrierController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/27.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSBarrierController.h"

@interface KSBarrierController ()

@end

@implementation KSBarrierController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

+ (NSString *)description {
    return @"栅栏函数";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self gcdBarrier];
}

- (void)gcdBarrier {
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
}

@end
