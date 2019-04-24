//
//  TZLoginViewModel.m
//  TianZhiClouod
//
//  Created by casic on 2018/11/1.
//  Copyright © 2018年 CASICloud. All rights reserved.
//

#import "TZLoginViewModel.h"
#import "TZHTTPRequest.h"
#import "UIDevice+TZ.h"
#import "AlgorithmHelper.h"

@implementation TZLoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initCommand];
    }
    return self;
}
- (void)initCommand {
    self.loginActionCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [self racForlogin];
    }];
    
}

/**
 登录
 */
- (RACSignal *)racForlogin {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSString *password = [AlgorithmHelper des_Encrypt:self.password key:[TZUserManager shareManager].mobile];
        [TZHTTPRequest postLoginWithUserName:[TZUserManager shareManager].mobile
                                    password:password
                                    deviceId:[UIDevice getUUID]
                                  deviceType:[[UIDevice currentDevice] model]
                                 appClientId:TZAppClientId
                                     success:^(NSDictionary *response) {
                                         TZCompanyListDataModel *model = [TZCompanyListDataModel mj_objectWithKeyValues:response];
                            
                                         [subscriber sendNext:model];
                                         [subscriber sendCompleted];
                                     } failure:^(NSError *error) {
                                         [subscriber sendCompleted];
                                     }];
        return nil;
    }];
}
@end
