//
//  KSResponderChainController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/28.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSResponderChainController.h"

@interface KSResponderChainController ()

@end

@implementation KSResponderChainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+(NSString *)description {
    return @"iOS响应者链(Responder Chain)";
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    for (UIView *view in self.view.subviews) {
        if([view pointInside:point withEvent:event]){
            UIView *hitTestView = [view hitTest:point withEvent:event];
            if(nil == hitTestView){
                return view;
            }
        }
    }
    return nil;
}

@end
