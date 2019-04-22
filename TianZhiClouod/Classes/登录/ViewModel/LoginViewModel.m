//
//  LoginViewModel.m
//  TianZhiClouod
//
//  Created by casic on 2018/11/1.
//  Copyright © 2018年 CASICloud. All rights reserved.
//

#import "LoginViewModel.h"
#import "TZHTTPRequest.h"

@implementation LoginViewModel

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
        return [self racForLogin];
    }];
}
- (RACSignal *)racForLogin {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [TZHTTPRequest postCheckPhoneWithPhone:@"18612039164" success:^(NSDictionary *response) {
            [subscriber sendNext:self];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}
@end
