//
//  BasicRequest.m
//  CustomerService
//
//  Created by 天智 on 16/6/29.
//  Copyright © 2016年 天智. All rights reserved.
//

#import "BasicRequest.h"
#import "NSMutableDictionary+Value.h"
#import "UIDevice+TZ.h"

#define TimeoutInterval 10.f //请求超时时间


@implementation BasicRequest
+ (AFHTTPSessionManager *)shareSessionManager {
    static AFHTTPSessionManager * manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    
    return manager;
}


+ (void)postNormalWithURL:(NSString *)url params:(NSDictionary *)params success:(Success)success failure:(Failure)failure; {
    
    AFHTTPSessionManager *manager = [BasicRequest shareSessionManager];
    manager.requestSerializer.timeoutInterval = TimeoutInterval;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求URL：%@***请求参数：%@***请求成功返回数据：%@",url,params,responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求URL：%@***请求参数：%@***请求失败返回数据：%@",url,params,error.description);
        failure(error);
    }];
    
}
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(Success)success failure:(Failure)failure; {

    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
    NSString *version = [[NSBundle mainBundle]infoDictionary][@"CFBundleShortVersionString"];
    NSString *ua = [NSString stringWithFormat:@"%@/%@;%@ %@;Apple;%@",TZAppClientId,version,[UIDevice currentDevice].systemName,[UIDevice currentDevice].systemVersion,[UIDevice platform]];
    [dic setObject:ua forKey:@"ua"];

    AFHTTPSessionManager *manager = [BasicRequest shareSessionManager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = TimeoutInterval;
    [manager POST:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"\n***请求URL：%@\n***请求参数：%@\n***请求成功返回数据：%@",url,dic,responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"] ;
        NSString *errorStr = [[ NSString alloc ] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"\n***请求URL：%@\n***请求参数：%@\n***请求失败返回数据：%@",url,dic,errorStr);
        failure(error);
    }];

}
+ (void)postTokenWithURL:(NSString *)url params:(NSDictionary *)params success:(Success)success failure:(Failure)failure; {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setNotNULLObject:params forKey:@"data"];
//    [param setNotNULLObject:USERTOKEN forKey:@"access_token"];
    
    AFHTTPSessionManager *manager = [BasicRequest shareSessionManager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = TimeoutInterval;
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    
    [manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求URL：%@***请求参数：%@***请求成功返回数据：%@",url,params,responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求URL：%@***请求参数：%@***请求失败返回数据：%@",url,params,error.description);
        failure(error);
    }];
    
}
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(Success)success failure:(Failure)failure; {
    
    AFHTTPSessionManager *manager = [BasicRequest shareSessionManager];
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求URL：%@***请求参数：%@***请求成功返回数据：%@",url,params,responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        NSLog(@"请求URL：%@***请求参数：%@***请求失败返回数据：%@",url,params,error.description);
    }];
}
+ (void)postUploadImageWithURL:(NSString *)url imageData:(NSData *)imageData success:(Success)success failure:(Failure)failure; {
    
    AFHTTPSessionManager *manager = [BasicRequest shareSessionManager];
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        // 上传文件
        NSDateFormatter *formatter      =   [[NSDateFormatter alloc] init];
        formatter.dateFormat            =   @"yyyyMMddHHmmss";
        NSString *str                   =   [formatter stringFromDate:[NSDate date]];
        NSString *fileName              =   [NSString stringWithFormat:@"%@.jpg", str];
        
        [formData appendPartWithFileData:imageData name:@"photo" fileName:fileName mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求URL：%@***请求成功返回数据：%@",url,responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        NSLog(@"请求URL：%@***请求失败返回数据：%@",url,error.description);
    }];
}
@end
