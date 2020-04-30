//
//  KSCopyController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/30.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSCopyController.h"

@interface KSCopyController ()

@property (nonatomic, copy) NSArray *array;
@property (nonatomic, strong) NSMutableArray *mutableArray;
@property (nonatomic, copy) NSString *myFlag;
@property (nonatomic, copy) NSArray *copArray;
@end

@implementation KSCopyController

- (void)viewDidLoad {
    [super viewDidLoad];
    KSUser *user = [[KSUser alloc] init];
    user.name = @"saeipi";
    user.ID = 888;
    _array = [NSArray arrayWithObjects:user, nil];
    _mutableArray = [NSMutableArray arrayWithObjects:user, nil];
    
    _myFlag = @"saeipi";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"[NSArray array]地址[栈区]: %p",[NSArray array]);
    NSLog(@"array地址[堆区]: %p",_array);
    NSArray *copyArray = [_array copy];
    NSLog(@"array copy地址[堆区]: %p",copyArray);
    NSArray *arrayMutableCopy = [_array mutableCopy];
    NSLog(@"array mutableCopy地址[堆区]: %p",arrayMutableCopy);
    
    NSLog(@"mutableArray地址[堆区]: %p",_mutableArray);
    NSLog(@"mutableArray copy地址[堆区]: %p",[_mutableArray copy]);
    NSLog(@"mutableArray mutableCopy地址[堆区]: %p",[_mutableArray mutableCopy]);
    self.copArray = _mutableArray;
    NSLog(@"copy 修饰的可变数组: %p",_copArray);
    
    KSUser *user = _array.lastObject;
    user.ID = 666;
    
    KSUser *copyUser = arrayMutableCopy.lastObject;
    NSLog(@"mutableCopy user ID: %d",copyUser.ID);
    
    NSLog(@"myFlag地址 01: %p",_myFlag);
    _myFlag = @"saeipi";
    NSLog(@"myFlag地址 02: %p",_myFlag);
    
    NSMutableString *str = [NSMutableString stringWithString:@"KSChart"];
    self.myFlag = str;
   
    NSLog(@"myFlag地址 03: %p, KSChart地址: %p",_myFlag,str);
}


+(NSString *)description {
    return @"深拷贝与浅拷贝";
}

@end
