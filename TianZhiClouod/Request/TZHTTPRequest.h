//
//  TZHTTPRequest.h
//  CustomerService
//
//  Created by 天智 on 16/6/29.
//  Copyright © 2016年 天智. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicRequest.h"



@interface TZHTTPRequest : NSObject
#pragma mark - 登录
/**
 检查手机号

 @param phone 手机号
 */
+ (void)postCheckPhoneWithPhone:(NSString *)phone success:(Success)success failure:(Failure)failure;

/**
 登录

 @param userName 用户名
 @param password 密码
 @param deviceId 设备id
 */
+ (void)postLoginWithUserName:(NSString *)userName
                     password:(NSString *)password
                     deviceId:(NSString *)deviceId
                   deviceType:(NSString *)deviceType
                  appClientId:(NSString *)appClientId
                      success:(Success)success
                      failure:(Failure)failure;

@end
