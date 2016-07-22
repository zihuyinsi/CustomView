//
//  UIColor+Hex.h
//  CustomView
//
//  Created by tsou on 16/7/19.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHex:(NSString *)color alpha:(CGFloat)alpha;

@end
