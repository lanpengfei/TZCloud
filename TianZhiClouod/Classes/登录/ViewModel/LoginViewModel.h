//
//  LoginViewModel.h
//  TianZhiClouod
//
//  Created by casic on 2018/11/1.
//  Copyright © 2018年 CASICloud. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property (nonatomic, copy) NSString * mobile;

@property (nonatomic, strong) RACCommand * loginActionCmd;

@end

NS_ASSUME_NONNULL_END
