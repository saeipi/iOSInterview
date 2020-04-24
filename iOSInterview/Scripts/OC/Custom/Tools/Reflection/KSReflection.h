//
//  KSReflection.h
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//  反射管理

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KSReflection : NSObject

+ (void)routeNavigationCtrl:(UINavigationController *)navCtrl args:(NSMutableDictionary *)args;

@end
