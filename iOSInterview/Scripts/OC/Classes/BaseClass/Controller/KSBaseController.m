//
//  KSBaseController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/28.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSBaseController.h"

@interface KSBaseController ()

@end

@implementation KSBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1.0];
    self.title = NSStringFromClass([self class]);
}

@end
