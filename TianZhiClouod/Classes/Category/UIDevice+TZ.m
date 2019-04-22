//
//  UIDevice+TZ.m
//  TianZhiClouod
//
//  Created by casic on 2019/4/15.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "UIDevice+TZ.h"
#import <sys/utsname.h>

@implementation UIDevice (TZ)
+ (NSString *)platform {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    return platform;
}
@end
