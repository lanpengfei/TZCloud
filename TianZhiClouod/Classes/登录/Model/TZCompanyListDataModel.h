//
//  TZCompanyListDataModel.h
//  TianZhiClouod
//
//  Created by casic on 2019/4/24.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "BaseModel.h"
#import "TZCompanyListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TZCompanyListDataModel : BaseModel

@property (nonatomic, copy) NSString * openId;

@property (nonatomic, strong) NSArray * companys;

@end

NS_ASSUME_NONNULL_END
