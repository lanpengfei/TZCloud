//
//  TZRequestURL.h
//  CASICloud
//
//  Created by 天智 on 16/6/29.
//  Copyright © 2016年 天智. All rights reserved.
//

#ifndef TZRequestURL_h
#define TZRequestURL_h


#define URLDICTIONARY [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"URL" ofType:@"plist"]]
#define MainHTTP URLDICTIONARY[@"MainHTTP"]


#pragma mark - 登陆
#define URL_PHONE_CHECK [MainHTTP stringByAppendingPathComponent:@"openaccess/user/phonecheck_new"] //检查手机号

#define URL_LOGIN [MainHTTP stringByAppendingPathComponent:@"openaccess/user/login"] //登录


#endif /* TZRequestURL_h */
