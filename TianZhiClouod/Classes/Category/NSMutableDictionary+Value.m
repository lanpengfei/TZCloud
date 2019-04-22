//
//  NSMutableDictionary+Value.m
//  CustomerService
//
//  Created by 天智 on 16/7/1.
//  Copyright © 2016年 天智. All rights reserved.
//

#import "NSMutableDictionary+Value.h"


@implementation NSMutableDictionary (Value)

- (void)setNotNULLObject:(id)anObject forKey:(NSString *)aKey {
    if (anObject)
    {
        [self setObject:anObject forKey:aKey];
    }else {
        if (![aKey isEqualToString:@"data"]) {//这个为空时，请求个人信息接口报错
            [self setObject:@"" forKey:aKey];
        }
        
    }
    
}


@end
