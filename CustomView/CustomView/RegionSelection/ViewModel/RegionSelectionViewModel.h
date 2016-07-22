//
//  RegionSelectionViewModel.h
//  CustomView
//
//  Created by tsou on 16/7/19.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegionSelectionViewModel : NSObject

/**
 *   获取当前城市区域信息
 *
 *  @param cityInfo 选择的城市信息
 *
 *  @return 当前城市的所有区县信息
 */
- (NSMutableArray *) gainRegionArrayWithCity: (NSDictionary *)cityInfo;

@end
