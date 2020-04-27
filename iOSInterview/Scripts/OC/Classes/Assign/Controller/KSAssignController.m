//
//  KSAssignController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/27.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSAssignController.h"
#import "KSUser.h"

@interface KSAssignController ()

@property (nonatomic, assign) KSUser *user1;
@property (nonatomic, weak) KSUser *user2;

@end

@implementation KSAssignController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KSUser *user1 = [[KSUser alloc] init];
    KSUser *user2 = [[KSUser alloc] init];
    
    _user1 = user1;
    _user2 = user2;
    
    [_user1 updateInfo];
    [_user2 updateInfo];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_user2 updateInfo];//[nil updateInfo]
    [_user1 updateInfo];//悬垂指针造成闪退，Thread 1: EXC_BAD_ACCESS (code=EXC_I386_GPFLT)
}

/*
 runtime 对注册的类，会进⾏布局，对于weak对象会放⼊一个hash表中。用weak指向的对象内存地址作为key，当此对象的引⽤计数为0的时候会dealloc，假如weak指向的对象内存地址是a，那么就会以a为键，在这个 weak 表中搜索，找到所有以a为键的weak对象，从⽽设置为nil。
 */
@end
