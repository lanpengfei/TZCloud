//
//  NSObject+Log.m
//  CASICloud
//
//  Created by 天智 on 2016/12/5.
//  Copyright © 2016年 天智. All rights reserved.
//

#import "NSObject+Log.h"
#import <objc/runtime.h>


static inline void TZ_swizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@implementation NSObject (Log)
// 自动打印属性字符串
+ (void)resolveDict:(NSDictionary *)dict{
    
    // 拼接属性字符串代码
    NSMutableString *strM = [NSMutableString string];
    
    // 1.遍历字典，把字典中的所有key取出来，生成对应的属性代码
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        // 类型经常变，抽出来
        NSString *type;
        
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")] || [obj isKindOfClass:NSClassFromString(@"NSTaggedPointerString")]) {
            type = @"NSString";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")] || [obj isKindOfClass:NSClassFromString(@"__NSSingleObjectArrayI")]){
            type = @"NSArray";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            type = @"NSInteger";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
            type = @"NSDictionary";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            type = @"BOOL";
        }
        
        
        // 属性字符串
        NSString *str;
        if ([type isEqualToString:@"NSString"]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, copy) %@ * %@;",type,key];
            
        }else if ([type isEqualToString:@"NSArray"] || [type isEqualToString:@"NSDictionary"]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ * %@;",type,key];
            
        }else{
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) %@  %@;",type,key];
        }
        
        // 每生成属性字符串，就自动换行。
        [strM appendFormat:@"\n%@\n",str];
        
    }];
    
    // 把拼接好的字符串打印出来，就好了。
    NSLog(@"%@",strM);
    
}

@end



@implementation NSString (TZUnicode)

- (NSString *)stringByReplaceUnicode {
    NSMutableString *convertedString = [self mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U"
                                     withString:@"\\u"
                                        options:0
                                          range:NSMakeRange(0, convertedString.length)];
    
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}

@end

@implementation NSArray (TZUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        TZ_swizzleSelector(class, @selector(description), @selector(TZ_description));
        TZ_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(TZ_descriptionWithLocale:));
        TZ_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(TZ_descriptionWithLocale:indent:));
    });
}

/**
 *  我觉得
 *  可以把以下的方法放到一个NSObject的category中
 *  然后在需要的类中进行swizzle
 *  但是又觉得这样太粗暴了。。。。
 */

- (NSString *)TZ_description {
    return [[self TZ_description] stringByReplaceUnicode];
}

- (NSString *)TZ_descriptionWithLocale:(nullable id)locale {
    return [[self TZ_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)TZ_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self TZ_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSDictionary (TZUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        TZ_swizzleSelector(class, @selector(description), @selector(TZ_description));
        TZ_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(TZ_descriptionWithLocale:));
        TZ_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(TZ_descriptionWithLocale:indent:));
    });
}

- (NSString *)TZ_description {
    return [[self TZ_description] stringByReplaceUnicode];
}

- (NSString *)TZ_descriptionWithLocale:(nullable id)locale {
    return [[self TZ_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)TZ_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self TZ_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}

@end

@implementation NSSet (TZUnicode)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        TZ_swizzleSelector(class, @selector(description), @selector(TZ_description));
        TZ_swizzleSelector(class, @selector(descriptionWithLocale:), @selector(TZ_descriptionWithLocale:));
        TZ_swizzleSelector(class, @selector(descriptionWithLocale:indent:), @selector(TZ_descriptionWithLocale:indent:));
    });
}

- (NSString *)TZ_description {
    return [[self TZ_description] stringByReplaceUnicode];
}

- (NSString *)TZ_descriptionWithLocale:(nullable id)locale {
    return [[self TZ_descriptionWithLocale:locale] stringByReplaceUnicode];
}

- (NSString *)TZ_descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [[self TZ_descriptionWithLocale:locale indent:level] stringByReplaceUnicode];
}
@end
