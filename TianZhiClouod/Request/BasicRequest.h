//
//  BasicRequest.h
//  CustomerService
//
//  Created by 天智 on 16/6/29.
//  Copyright © 2016年 天智. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetWorking.h"


typedef void (^Success)(NSDictionary * response);
typedef void (^Failure)(NSError * error);

@interface BasicRequest : NSObject

+ (AFHTTPSessionManager *)shareSessionManager;

+ (void)postNormalWithURL:(NSString *)url params:(NSDictionary *)params success:(Success)success failure:(Failure)failure;
/**
 *  无需登录
 */
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(Success)success failure:(Failure)failure;
/**
 *  需要登录
 */
+ (void)postTokenWithURL:(NSString *)url params:(NSDictionary *)params success:(Success)success failure:(Failure)failure;

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(Success)success failure:(Failure)failure;
/**
 *  上传图片
 */
+ (void)postUploadImageWithURL:(NSString *)url imageData:(NSData *)imageData success:(Success)success failure:(Failure)failure;
@end
