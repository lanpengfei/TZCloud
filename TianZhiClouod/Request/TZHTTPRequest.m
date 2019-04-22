//
//  TZHTTPRequest.m
//  CustomerService
//
//  Created by 天智 on 16/6/29.
//  Copyright © 2016年 天智. All rights reserved.
//

#import "TZHTTPRequest.h"
#import "NSMutableDictionary+Value.h"
#import "TZRequestURL.h"

@implementation TZHTTPRequest
#pragma mark - 登录
+ (void)postCheckPhoneWithPhone:(NSString *)phone success:(Success)success failure:(Failure)failure {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setNotNULLObject:phone forKey:@"phone"];
    [BasicRequest postWithURL:URL_PHONE_CHECK params:param success:^(NSDictionary *response) {
        success(response);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
