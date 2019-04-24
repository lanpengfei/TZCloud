//
//  TZLoginCheckPhoneViewModel.m
//  TianZhiClouod
//
//  Created by casic on 2019/4/24.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "TZLoginCheckPhoneViewModel.h"
#import "TZHTTPRequest.h"

typedef enum : NSUInteger {
    kAccountCodeActivated = 2050,   //用户已存在，直接登录
    kAccountCodeNotExisted = 2051   //用户不存在
} kAccountCode;
@implementation TZLoginCheckPhoneViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initCommand];
    }
    return self;
}
- (void)initCommand {
    self.checkPhoneCmd = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [self racForCheckPhone];
    }];
}

/**
 检查手机号
 */
- (RACSignal *)racForCheckPhone {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [TZHTTPRequest postCheckPhoneWithPhone:self.mobile success:^(NSDictionary *response) {
            TZCheckPhoneModel *model = [TZCheckPhoneModel mj_objectWithKeyValues:response];
            switch (model.errorCode) {
                case kAccountCodeActivated:
                    [subscriber sendNext:model];
                    break;
                case kAccountCodeNotExisted:
                {
                    ALERT(model.error);
                }
                    break;
                default:
                {
                    ALERT(model.error);
                }
                    break;
            }
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}
@end
