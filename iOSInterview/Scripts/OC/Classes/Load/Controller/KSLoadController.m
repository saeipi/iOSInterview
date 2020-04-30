//
//  KSLoadController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/28.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSLoadController.h"

@interface KSLoadController ()

@end

@implementation KSLoadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+(NSString *)description {
    return @"load和initialize";
}

+(void)load {
    //load是只要类所在⽂文件被引⽤用就会被调⽤用
    NSLog(@"%s",__FUNCTION__);
}

+(void)initialize {
    //initialize是在类或者其⼦子类的第⼀一个⽅方法被 调⽤用前调⽤用
    NSLog(@"%s",__FUNCTION__);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    KSLoadController *ctrl = [[KSLoadController alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
}
@end
