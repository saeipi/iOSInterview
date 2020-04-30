//
//  KSKVOController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/28.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSKVOController.h"

@interface KSKVOController ()

@property (nonatomic, strong) KSUser *user;

@end

@implementation KSKVOController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _user = [[KSUser alloc] init];
    [_user addObserver:self forKeyPath:@"ID" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"change: %@",change);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _user.ID = _user.ID + 1;
}

+(NSString *)description {
    return @"KVO";
}

@end
