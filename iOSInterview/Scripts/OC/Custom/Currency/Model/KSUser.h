//
//  KSUser.h
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSUser : NSObject<NSCoding,NSCopying>

@property (nonatomic, assign) int       ID;
@property (nonatomic, copy  ) NSString  *name;
@property (nonatomic, copy  ) NSString  *email;
@property (nonatomic, strong) KSUser    *related;

-(void)updateInfo;

@end
