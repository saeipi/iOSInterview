//
//  KSReflection.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSReflection.h"

@implementation KSReflection

+ (void)routeNavigationCtrl:(UINavigationController *)navCtrl args:(NSMutableDictionary *)args {
    // 根据字典字段反射出我们想要的类
    Class class              = NSClassFromString(args[@"className"]);
    UIViewController *ctrl   = [[class alloc] init];
    [navCtrl pushViewController:ctrl animated:YES];
    
    if ([args[@"isCallMethod"] boolValue]) {
        // 获取参数列表
        NSDictionary *parameters = args[@"parameters"];
        // 从字典中获取方法名，并调用对应的方法
        SEL selector             = NSSelectorFromString(args[@"method"]);
        [ctrl performSelector:selector withObject:parameters afterDelay:0];
    }
}

@end
