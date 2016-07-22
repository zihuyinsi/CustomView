//
//  Tools.m
//  CardPackage
//
//  Created by lv on 16/7/15.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "Tools.h"

@implementation Tools

/**
 *  获取比例，以320为基准
 *
 *  @return 返回比例
 */
+ (CGFloat) gainScale
{
    CGFloat scale = iPhoneWidth/320.f;
    return scale;
}

/**
 *  根据比例返回一个新的float
 *
 *  @param oldFloat 原有size
 *
 *  @return 新的float
 */
+ (CGFloat) scaleFloatWithFloat: (CGFloat)oldFloat
{
    CGFloat newFloat = oldFloat * [Tools gainScale];
    return newFloat;
}

@end
