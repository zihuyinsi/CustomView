//
//  RegionSelectionView.h
//  CustomView
//
//  Created by tsou on 16/7/19.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegionSelectionView : UIView

@property (nonatomic, copy) NSMutableArray *regionArray;                            //区域数据源
@property (nonatomic, copy) NSString *nowCity;                                      //当前城市
@property (nonatomic, copy) NSString *nowRegion;                                    //当前区域

@property (nonatomic, copy) void(^selectionRegion)(id *obj);                        //选择一个区域
@property (nonatomic, copy) void(^changeCity)(id *obj);                             //前往城市选择
@property (nonatomic, copy) void(^removeView)();                                    //remove当前视图


/**
 *  取消RegionSelectionView
 */
- (void) tappedCanncel;

/**
 *  展示regionSelectionView
 */
- (void) regionShow;


@end
