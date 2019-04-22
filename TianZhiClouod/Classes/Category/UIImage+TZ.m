//
//  UIImage+TZ.m
//  TianZhiClouod
//
//  Created by casic on 2019/4/15.
//  Copyright © 2019 CASICloud. All rights reserved.
//

#import "UIImage+TZ.h"

@implementation UIImage (TZ)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
