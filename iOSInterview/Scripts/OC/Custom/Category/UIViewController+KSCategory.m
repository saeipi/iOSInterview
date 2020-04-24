//
//  UIViewController+KSCategory.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "UIViewController+KSCategory.h"
#import <objc/runtime.h>

static const char *KSUIViewControllerPropertyKeyRequestArgs = "KSUIViewControllerPropertyKeyRequestArgs";

/*
 Property 'index' requires method 'index' to be defined - use @dynamic or provide a method implementation in this category
 添加Property对应的Set/Get方法解决警告。也可以在Set/Get方法中利用Runtime动态创建属性
 */
/*
 typedef OBJC_ENUM(uintptr_t, objc_AssociationPolicy) {
     OBJC_ASSOCIATION_ASSIGN = 0,             //关联对象的属性是弱引用
     OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,   //关联对象的属性是强引用并且关联对象不使用原子性
     OBJC_ASSOCIATION_COPY_NONATOMIC = 3,     //关联对象的属性是copy并且关联对象不使用原子性
     OBJC_ASSOCIATION_RETAIN = 01401,         //关联对象的属性是copy并且关联对象使用原子性
     OBJC_ASSOCIATION_COPY = 01403            //关联对象的属性是copy并且关联对象使用原子性
 };
 */
@implementation UIViewController (KSCategory)

- (void)setOffsetY:(CGFloat)offsetY {
    CGRect frame = self.view.frame;
    frame.origin.y = offsetY;
    self.view.frame = frame;
}

- (CGFloat)offsetY {
    return self.view.frame.origin.y;
}

- (void)setRequestArgs:(NSMutableDictionary *)requestArgs {
    objc_setAssociatedObject(self,KSUIViewControllerPropertyKeyRequestArgs, requestArgs,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)requestArgs {
    return objc_getAssociatedObject(self, KSUIViewControllerPropertyKeyRequestArgs);
}

@end
