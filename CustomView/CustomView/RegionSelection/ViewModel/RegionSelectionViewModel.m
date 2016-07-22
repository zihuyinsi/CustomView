//
//  RegionSelectionViewModel.m
//  CustomView
//
//  Created by tsou on 16/7/19.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "RegionSelectionViewModel.h"

@implementation RegionSelectionViewModel

/**
 *   获取当前城市区域信息
 *
 *  @param cityInfo 选择的城市信息
 *
 *  @return 当前城市的所有区县信息
 */
- (NSMutableArray *) gainRegionArrayWithCity: (NSDictionary *)cityInfo
{
    NSMutableArray *regionArray = [NSMutableArray arrayWithObjects:
                                   @"全城",
                                   @"西湖区",
                                   @"拱墅区",
                                   @"萧山区",
                                   @"江干区",
                                   @"滨江区",
                                   @"余杭区",
                                   @"上城区",
                                   @"临安市",
                                   @"富阳市",
                                   @"桐庐县",
                                   @"下城区",
                                   @"建德市",
                                   @"淳安县",
                                   nil];
    return regionArray;
}

@end
