//
//  TZLoginViewModel.h
//  TianZhiClouod
//
//  Created by casic on 2018/11/1.
//  Copyright © 2018年 CASICloud. All rights reserved.
//

#import "BaseViewModel.h"
#import "TZCompanyListDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TZLoginViewModel : BaseViewModel

@property (nonatomic, copy) NSString * password;

@property (nonatomic, strong) RACCommand * loginActionCmd;



@end

NS_ASSUME_NONNULL_END
