//
//  UIDevice+TZ.h
//  TianZhiClouod
//
//  Created by casic on 2019/4/15.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (TZ)

/**
 获取设备品牌

 @return Apple
 */
+ (NSString *)platform;

/**
 获取设备唯一标识（UUID）

 @return UUID
 */
+ (NSString *)getUUID;
@end

NS_ASSUME_NONNULL_END
