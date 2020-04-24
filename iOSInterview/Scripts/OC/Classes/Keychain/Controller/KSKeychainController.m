//
//  KSKeychainController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSKeychainController.h"
#import "KSKeychain.h"
@interface KSKeychainController ()

@end

@implementation KSKeychainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)test {
    NSString *keychain = @"";
    // 存储数据
    BOOL save = [KSKeychain keyChainSaveData:@"思念诉说，眼神多像云朵" withIdentifier:keychain];
    if (save) {
        NSLog(@"存储成功");
    }else {
        NSLog(@"存储失败");
    }
    // 获取数据
    NSString * readString = [KSKeychain keyChainReadData:keychain];
    NSLog(@"获取得到的数据:%@",readString);
    
    // 更新数据
    BOOL updata = [KSKeychain keyChainUpdata:@"长发落寞，我期待的女孩" withIdentifier:keychain];
    if (updata) {
        NSLog(@"更新成功");
    }else{
        NSLog(@"更新失败");
    }
    // 读取数据
    NSString * readUpdataString = [KSKeychain keyChainReadData:keychain];
    NSLog(@"获取更新后得到的数据:%@",readUpdataString);
    
    // 删除数据
    [KSKeychain keyChainDelete:keychain];
    // 读取数据
    NSString * readDeleteString = [KSKeychain keyChainReadData:keychain];
    NSLog(@"获取删除后得到的数据:%@",readDeleteString);
}
@end
