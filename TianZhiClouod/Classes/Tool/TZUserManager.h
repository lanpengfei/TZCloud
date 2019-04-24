//
//  TZUserManager.h
//  TianZhiClouod
//
//  Created by casic on 2019/4/24.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TZUserManager : NSObject

+ (instancetype)shareManager;

@property (nonatomic, copy) NSString * mobile;

@property (nonatomic, copy) NSString * password;


@end

NS_ASSUME_NONNULL_END
