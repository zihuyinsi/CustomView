//
//  MainMacro.h
//  CustomView
//
//  Created by tsou on 16/7/19.
//  Copyright © 2016年 lv. All rights reserved.
//

#ifndef MainMacro_h
#define MainMacro_h

//透明背景色
#define kTransparentBackgroundColor [UIColor colorWithHex: @"232323" alpha: 0.1]
//主色调
#define kMainToneColor [UIColor colorWithHex: @"fe4a27"]

#pragma mark- //地区选择
//地区选择背景色
#define kRegionSelectionBackgroundColor [UIColor colorWithHex: @"ececec"]
//描边颜色
#define kRegionSelectionLineColor [UIColor colorWithHex: @"cbcbcb"]
//字体颜色
#define kRegionSelectionTitleColor [UIColor colorWithHex: @"363636"]
//字体大小
#define kRegionSelectionFont [UIFont]

// 设备大小
#define iPhoneWidth [UIScreen mainScreen].bounds.size.width
#define iPhoneHeight [UIScreen mainScreen].bounds.size.height

//比例
//#define iPhoneScale [Tools gainScale]
#define iPhoneScaleFloat(A) [Tools scaleFloatWithFloat: A]

#endif /* MainMacro_h */
