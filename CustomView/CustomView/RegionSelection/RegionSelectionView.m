//
//  RegionSelectionView.m
//  CustomView
//
//  Created by tsou on 16/7/19.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "RegionSelectionView.h"

#define kRowColumn 3

@implementation RegionSelectionView
{
    UIView *selectView;                 //选择区域View
    UIScrollView *regionScrollView;     //地区View
    UIView *cityView;                   //城市View
    UILabel *nowCityLabel;              //当前城市
    UIButton *changeCityBtn;            //更换城市
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self)
    {
    }
    return self;
}

- (void) regionSelectionInitializationWithFrame: (CGRect)frame
{
    [self setBackgroundColor: kTransparentBackgroundColor];
    [self setUserInteractionEnabled: YES];
    
    UITapGestureRecognizer* tapG = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(tappedCanncel)];
    [self addGestureRecognizer:tapG];
    
    //选择区域
    selectView = [[UIView alloc] initWithFrame:CGRectMake(0, -frame.size.width, frame.size.width, 100)];
    selectView.backgroundColor = kRegionSelectionBackgroundColor;
    [self addSubview:selectView];
    
    [UIView animateWithDuration:0.35f animations:^
    {
        selectView.frame = CGRectMake(0, 64, frame.size.width, 100);
    }
                     completion:^(BOOL finished)
    {
    }];
    
    //地区
    regionScrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(12.5,
                                                                       0,
                                                                       selectView.bounds.size.width-25,
                                                                       selectView.bounds.size.height - 65)];
    [regionScrollView setBackgroundColor: [UIColor clearColor]];
    [selectView addSubview: regionScrollView];
    
    //城市
    cityView = [[UIView alloc] initWithFrame: CGRectMake(12.5,
                                                         selectView.bounds.size.height-50,
                                                         selectView.bounds.size.width-25,
                                                         iPhoneScaleFloat(40.f))];
    [cityView setBackgroundColor: [UIColor whiteColor]];
    cityView.layer.masksToBounds = YES;
    cityView.layer.cornerRadius = 3.f;
    cityView.layer.borderColor = kRegionSelectionLineColor.CGColor;
    cityView.layer.borderWidth = 0.5f;
    [selectView addSubview: cityView];
    
    nowCityLabel = [[UILabel alloc] initWithFrame: CGRectMake(12.5,
                                                              (cityView.frame.size.height-20)/2,
                                                              cityView.frame.size.width-100,
                                                              20)];
    [nowCityLabel setText: @"当前城市：杭州"];
    [nowCityLabel setFont: [UIFont systemFontOfSize: iPhoneScaleFloat(14.f)]];
    [cityView addSubview: nowCityLabel];
    
    UILabel *changeLabel = [[UILabel alloc] initWithFrame: CGRectMake(
                                                                      cityView.frame.size.width-87.5,
                                                                      (cityView.frame.size.height-20)/2,
                                                                      75,
                                                                      20)];
    [changeLabel setBackgroundColor: [UIColor clearColor]];
    [changeLabel setText: @"更换"];
    [changeLabel setTextColor: kMainToneColor];
    [changeLabel setTextAlignment: NSTextAlignmentRight];
    [changeLabel setFont: [UIFont systemFontOfSize: iPhoneScaleFloat(14.f)]];
    [changeLabel setSideImageAlignment: NSTextAlignmentRight];
    [changeLabel setSideImageSize: 15.f];
    [changeLabel setSideImage: [UIImage imageNamed: @"right_arrow.png"]];
    [cityView addSubview: changeLabel];

    //更换城市
    changeCityBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [changeCityBtn setFrame: CGRectMake(0,
                                        0,
                                        cityView.frame.size.width,
                                        cityView.frame.size.height)];
    [changeCityBtn setBackgroundColor: [UIColor clearColor]];
    [changeCityBtn addTarget: self action: @selector(changeCityBtnClick) forControlEvents: UIControlEventTouchUpInside];
    [cityView addSubview: changeCityBtn];
}

- (void) regionSelectionLoadData
{
    _nowRegion = [UserDefaults objectForKey: kRegion_NowRegion];
    CGFloat x, y;
    CGFloat w = (regionScrollView.frame.size.width- 25)/kRowColumn;
    CGFloat h = iPhoneScaleFloat(35.f);
    
    //行数
    NSInteger row = 0;
    //余数
    NSInteger remainder = [_regionArray count] % kRowColumn;
    if (remainder == 0)
    {
        row = [_regionArray count]/kRowColumn;
    }
    else
    {
        row = [_regionArray count]/kRowColumn+1;
    }
    
    if (row > 4)
    {
        [selectView setFrame: CGRectMake(0,
                                         0,
                                         self.frame.size.width,
                                         (h + 10) * 4 + 40 + iPhoneScaleFloat(40.f))];
    }
    else
    {
        [selectView setFrame: CGRectMake(0,
                                         0,
                                         self.frame.size.width,
                                         (h + 10) * row + 15 + iPhoneScaleFloat(40.f))];
    }
    [regionScrollView setContentSize: CGSizeMake(regionScrollView.frame.size.width, (h + 10) * row + 10)];
    [regionScrollView setFrame: CGRectMake(12.5,
                                           0,
                                           selectView.bounds.size.width-25,
                                           selectView.bounds.size.height - iPhoneScaleFloat(40.f) - 15)];
    [cityView setFrame: CGRectMake( 12.5,
                                   selectView.bounds.size.height-(iPhoneScaleFloat(40.f) + 10),
                                   selectView.bounds.size.width-25,
                                   iPhoneScaleFloat(40.f))];
    [changeCityBtn setFrame: CGRectMake( 0, 0, cityView.frame.size.width, cityView.frame.size.height)];
    
    for (int i = 0; i < row; i ++)
    {
        x = 12.5;
        y = 10 + i * (h + 10);
        if (i < (row-1))
        {
            for (int j = 0; j < kRowColumn; j ++)
            {
                x = j * (w + 12.5);
                NSString *titStr = _regionArray[j+i*kRowColumn];
                UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
                [btn setFrame: CGRectMake( x, y, w, h)];
                if ([titStr isEqualToString: _nowRegion])
                {
                    [btn setBackgroundColor: [UIColor grayColor]];
                }
                else
                {
                    [btn setBackgroundColor: [UIColor whiteColor]];
                }
                [btn.titleLabel setFont: [UIFont systemFontOfSize: iPhoneScaleFloat(14.f)]];
                [btn setTitle: titStr forState: UIControlStateNormal];
                [btn setTitleColor: [UIColor colorWithHex: @"363636"] forState: UIControlStateNormal];
                btn.tag = j + i * kRowColumn;
                [btn addTarget: self action: @selector(selectionBtnClick:) forControlEvents: UIControlEventTouchUpInside];
                [regionScrollView addSubview: btn];
            }
        }
        else
        {
            if (remainder == 0)
            {
                remainder = kRowColumn;
            }
            for (int j = 0; j < remainder; j ++)
            {
                x = j * (w + 12.5);
                NSString *titStr = _regionArray[j+i*kRowColumn];
                UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
                [btn setFrame: CGRectMake( x, y, w, h)];
                if ([titStr isEqualToString: _nowRegion])
                {
                    [btn setBackgroundColor: [UIColor grayColor]];
                }
                else
                {
                    [btn setBackgroundColor: [UIColor whiteColor]];
                }
                [btn.titleLabel setFont: [UIFont systemFontOfSize: iPhoneScaleFloat(14.f)]];
                [btn setTitle: titStr forState: UIControlStateNormal];
                [btn setTitleColor: [UIColor colorWithHex: @"363636"] forState: UIControlStateNormal];
                btn.tag = j + i * kRowColumn;
                [btn addTarget: self action: @selector(selectionBtnClick:) forControlEvents: UIControlEventTouchUpInside];
                [regionScrollView addSubview: btn];
            }
        }
    }
}

- (void) regionShow
{
    [self regionSelectionInitializationWithFrame: self.frame];
//    [self regionSelectionLoadData];
    
    [UIView animateWithDuration: 0.75f
                          delay: 0.1f
         usingSpringWithDamping: 0.6f
          initialSpringVelocity: 5.f
                        options: UIViewAnimationOptionTransitionNone
                     animations:^
     {
         [self regionSelectionLoadData];
     }
                     completion:^(BOOL finished)
     {
         
     }];
}

#pragma mark - 取消
/**
 *  收起selectView，并removeFromSuperview
 */
- (void) tappedCanncel
{
    NSLog(@"tappedCannel");
    
    if (self.removeView)
    {
        self.removeView();
    }
    
    [UIView animateWithDuration:0.35f animations:^
    {
        [self setBackgroundColor: kTransparentBackgroundColor];
        selectView.frame = CGRectMake(0,
                                      -selectView.bounds.size.height,
                                      selectView.frame.size.width,
                                      selectView.frame.size.height);
    }
                     completion:^(BOOL finished)
    {
        [selectView removeFromSuperview];
        selectView = nil;
        
        [nowCityLabel removeFromSuperview];
        nowCityLabel = nil;
        
        [cityView removeFromSuperview];
        cityView = nil;
        
        [self removeFromSuperview];
    }];
}

#pragma mark - 选择城市
- (void) changeCityBtnClick
{
    if (self.changeCity)
    {
        self.changeCity(nil);
    }
}

#pragma mark - 选择区县
- (void) selectionBtnClick: (id)sender
{
    NSInteger index = ((UIButton *)sender).tag;
    
    NSString *titleStr = _regionArray[index];
    NSLog(@"titleStr = %@", titleStr);
    
    _nowRegion = titleStr;
    [UserDefaults setObject: _nowRegion forKey: kRegion_NowRegion];
    [UserDefaults synchronize];
    
    if (self.selectionRegion)
    {
        self.selectionRegion(nil);
    }
    
    [self tappedCanncel];
}

#pragma mark -

@end
