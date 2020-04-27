//
//  KSUser.m
//  iOSInterview
//
//  Created by saeipi on 2020/4/24.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSUser.h"

@implementation KSUser

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"KSUser_name"];
    [aCoder encodeObject:self.email forKey:@"KSUser_email"];
    [aCoder encodeInt32:self.ID forKey:@"KSUser_ID"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name  = [aDecoder decodeObjectForKey:@"KSUser_name"];
        _email = [aDecoder decodeObjectForKey:@"KSUser_email"];
        _ID    = [aDecoder decodeInt32ForKey:@"KSUser_ID"];
    }
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    KSUser *user = [[[self class] allocWithZone:zone] init];
    user.name = _name;
    user.email = _email;
    user.ID = _ID;
    user.related = [_related copyWithZone:zone];
    return user;
}

-(void)updateInfo {
    NSLog(@"KSUser updateInfo");
}

-(void)dealloc {
    NSLog(@"KSUser dealloc");
}

@end
