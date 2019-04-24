//
//  TZLoginCheckPhoneViewModel.h
//  TianZhiClouod
//
//  Created by casic on 2019/4/24.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "BaseViewModel.h"
#import "TZCheckPhoneModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TZLoginCheckPhoneViewModel : BaseViewModel

@property (nonatomic, copy) NSString * mobile;

@property (nonatomic, strong) RACCommand * checkPhoneCmd;

@property (nonatomic, strong) TZCheckPhoneModel * checkPhoneModel;
@end

NS_ASSUME_NONNULL_END
