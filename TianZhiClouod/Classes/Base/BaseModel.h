//
//  BaseModel.h
//  TianZhiClouod
//
//  Created by casic on 2019/4/24.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

#define SUCCEDD_CODE 0 //请求成功success
NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject

@property (nonatomic, copy) NSString * error;

@property (nonatomic, assign) NSInteger errorCode;

@property (nonatomic, assign) NSInteger success;


@end

NS_ASSUME_NONNULL_END
