//
//  UIDevice+TZ.m
//  TianZhiClouod
//
//  Created by casic on 2019/4/15.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "UIDevice+TZ.h"
#import <sys/utsname.h>
#import <SAMKeychain.h>

@implementation UIDevice (TZ)
+ (NSString *)platform {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    return platform;
}

+ (NSString *)getUUID {
    NSError *error = nil;
    NSString *UUID = nil;
    NSString *account = [[NSBundle mainBundle] bundleIdentifier];
    UUID = [SAMKeychain passwordForService:@"UUID" account:account error:&error];
    if (error) {
        NSLog(@"getKeyChain error:%@", error.localizedDescription);
    }
    if ([UUID isEqualToString:@""] || UUID == nil) {
        // 随机生成一个UUID，只需要生成一次
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        CFStringRef stringRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
        UUID = (__bridge NSString *)stringRef;
        UUID = [UUID stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [SAMKeychain setPassword:UUID forService:@"UUID" account:account error:&error];
        CFRelease(stringRef);
        CFRelease(uuidRef);
    }
    return UUID;
}
@end
