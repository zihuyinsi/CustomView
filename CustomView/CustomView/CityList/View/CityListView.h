//
//  CityListView.h
//  CustomView
//
//  Created by tsou on 16/7/22.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityListView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *cityTableView;       //城市列表
@property (nonatomic, strong) NSMutableArray *cityArray;        //城市列表数据

@property (nonatomic, copy) void (^isCannel)();                 //取消城市选择
@property (nonatomic, copy) void (^isSelectionCity)(NSString *obj);   //选择城市

- (id) init __deprecated_msg("Use initWithFrame:");

@end


