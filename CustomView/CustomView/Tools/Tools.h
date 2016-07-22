//
//  Tools.h
//  CardPackage
//
//  Created by lv on 16/7/15.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

/**
 *  获取比例，以320为基准
 *
 *  @return 返回比例
 */
+ (CGFloat) gainScale;

/**
 *  根据比例返回一个新的float
 *
 *  @param oldFloat 原有size
 *
 *  @return 新的float
 */
+ (CGFloat) scaleFloatWithFloat: (CGFloat)oldFloat;

@end
