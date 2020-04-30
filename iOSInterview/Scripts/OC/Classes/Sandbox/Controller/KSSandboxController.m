//
//  KSSandboxController.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSSandboxController.h"

@interface KSSandboxController ()

@end

@implementation KSSandboxController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/// 沙河目录
- (void)sandboxPath {
    //Home目录
    NSString *homeDirectory = NSHomeDirectory();
    /*
     typedef NS_OPTIONS(NSUInteger, NSSearchPathDomainMask) {
        NSUserDomainMask =1,      // 用户的主目录
        NSLocalDomainMask =2,     // 当前机器的本地目录
        NSNetworkDomainMask =4,    //在网络中公开可用的位置
        NSSystemDomainMask =8,    // 被苹果系统提供的，不可更改的位置 (/System)
        NSAllDomainsMask = 0x0ffff  // 上述所有及未来的位置
     };
     */
    //NSUserDomainMask:常量，表面将搜索限制与当前应用程序的沙盒中，这样的话只能找到一个Documents目录，因为每个应用程序沙盒中只有一个Documents目录
    //Document目录   documents (Documents)
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *documentPath = [documentPaths objectAtIndex:0];

    //Libaray目录  various documentation, support, and configuration files, resources (Library)
    NSArray *libarayPaths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES);
    NSString *libarayPath = [libarayPaths objectAtIndex:0];

    //Cache目录  location of discardable cache files (Library/Caches)
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES);
    NSString *cachePath = [cachePaths objectAtIndex:0];

    //tmp目录
    NSString *tempPath = NSTemporaryDirectory();
}


/// 偏好设置
- (void)preference {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"saeipi" forKey:@"name"];
    NSString *name = [defaults objectForKey:@"name"];
}

/// NSKeyedArchiver归档
- (void)keyedArchiver {
    KSUser *user = [[KSUser alloc] init];
    user.name = @"saeipi";
    user.ID = 870320;
    user.email = @"ksert@163.com";
    
    NSString *tempPath = NSTemporaryDirectory();
    NSString *filePath = [tempPath stringByAppendingPathComponent:@"user.data"];
    /*
     注意：archiveRootObject会调用encodeWithCoder:方法 得自己写。
     默认情况下，只能对NSDate, NSNumber, NSString, NSArray, or NSDictionary来进行归档。
     自己定义的对象进行“编码/解码”操作时，却需要实现NSCoding协议的相关方法来告诉程序如何来“编码/解码”我们自己的对象！
     */
    BOOL success = [NSKeyedArchiver archiveRootObject:user toFile:filePath];
    
    // unarchiveObjectWithFile会调用initWithCoder
    KSUser *user1 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"name:%@, email:%@, ID:%d",user1.name,user1.email,user1.ID);
}

@end
