//
//  TZCompanyListDataModel.m
//  TianZhiClouod
//
//  Created by casic on 2019/4/24.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "TZCompanyListDataModel.h"

@implementation TZCompanyListDataModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"openId" : @"data.openId",
             @"companys" : @"data.companys"
             };
}
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"companys" : [TZCompanyListModel class]};
}

@end
