//
//  CityListView.m
//  CustomView
//
//  Created by tsou on 16/7/22.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "CityListView.h"

@implementation CityListView

- (id) init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self cityListViewInitialization];
    }
    return self;
}

/**
 *  初始化citylistView
 */
- (void) cityListViewInitialization
{
    for (UIView *tempView in [self subviews])
    {
        [tempView removeFromSuperview];
    }
    
    _cityTableView = [[UITableView alloc] initWithFrame: CGRectMake(0,
                                                                   0,
                                                                   CGRectGetWidth(self.frame),
                                                                   CGRectGetHeight(self.frame))];
    _cityTableView.delegate = self;
    _cityTableView.dataSource = self;
    [_cityTableView setBackgroundColor: [UIColor clearColor]];
    [self addSubview: _cityTableView];
}


#pragma mark - UITableViewDelegate / UITableViewDataSource
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_cityArray count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"cityIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: indentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
                                      reuseIdentifier: indentifier];
    }
    
    [cell.textLabel setText: _cityArray[indexPath.row]];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    NSInteger index = indexPath.row;
    NSString *objStr = _cityArray[index];
    if (self.isSelectionCity)
    {
        self.isSelectionCity(objStr);
    }
}

@end
