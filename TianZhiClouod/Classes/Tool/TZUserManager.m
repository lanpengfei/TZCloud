//
//  TZUserManager.m
//  TianZhiClouod
//
//  Created by casic on 2019/4/24.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "TZUserManager.h"

@implementation TZUserManager

+ (instancetype)shareManager {
    static TZUserManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TZUserManager alloc]init];
    });
    return manager;
}




@end
