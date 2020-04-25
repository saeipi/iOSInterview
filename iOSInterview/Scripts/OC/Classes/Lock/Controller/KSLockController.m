//
//  KSLockController.m
//  iOSInterview
//
//  Created by Athena on 2020/4/25.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSLockController.h"
// 自旋锁
#import <libkern/OSAtomic.h>

#define RHTICK   NSDate *startTime = [NSDate date];
#define RHTOCK   NSLog(@"==========Time: %f", -[startTime timeIntervalSinceNow]);
@interface KSLockController ()

@end

@implementation KSLockController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUInteger count = 1000*10000;//执行一千万次
    RHTICK
    for(int i=0; i<count; i++) {
    //加锁
    //解锁
    }
    RHTOCK
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
