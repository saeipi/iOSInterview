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
@end

@implementation KSCopyController

- (void)viewDidLoad {
    [super viewDidLoad];
    KSUser *user = [[KSUser alloc] init];
    user.name = @"saeipi";
    user.ID = 888;
    _array = [NSArray arrayWithObjects:user, nil];
    _mutableArray = [NSMutableArray arrayWithObjects:user, nil];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"array地址: %p",_array);
    NSArray *copyArray = [_array copy];
    NSLog(@"array copy地址: %p",copyArray);
    NSArray *arrayMutableCopy = [_array mutableCopy];
    NSLog(@"array mutableCopy地址: %p",arrayMutableCopy);
    
    NSLog(@"mutableArray地址: %p",_mutableArray);
    NSLog(@"mutableArray copy地址: %p",[_mutableArray copy]);
    NSLog(@"mutableArray mutableCopy地址: %p",[_mutableArray mutableCopy]);
    KSUser *user = _array.lastObject;
    user.ID = 666;
    
    KSUser *copyUser = arrayMutableCopy.lastObject;
    NSLog(@"mutableCopy user ID: %d",copyUser.ID);
    
}


+(NSString *)description {
    return @"深拷贝与浅拷贝";
}

@end
