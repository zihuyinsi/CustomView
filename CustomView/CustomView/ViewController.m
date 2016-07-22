//
//  ViewController.m
//  CustomView
//
//  Created by tsou on 16/7/19.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "ViewController.h"

//区域选择
#import "RegionSelectionView.h"
#import "RegionSelectionViewModel.h"

//城市列表
#import "CityListViewController.h"

@interface ViewController ()
{
    RegionSelectionView *regionSelectView;
    RegionSelectionViewModel *regionSelectViewModel;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor: [UIColor colorWithWhite: 0.97 alpha: 1.f]];
    
    regionSelectViewModel = [[RegionSelectionViewModel alloc] init];
    
    UIButton *regionBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [regionBtn setFrame: CGRectMake( 100, 199, 100, 40)];
    [regionBtn setTitle: @"区域" forState: UIControlStateNormal];
    [regionBtn.titleLabel setFont: [UIFont systemFontOfSize: iPhoneScaleFloat(15.f)]];
    [regionBtn setTitleColor: [UIColor colorWithHex: @"363636"] forState: UIControlStateNormal];
    [regionBtn addTarget: self
                  action: @selector(regionBtnClick)
        forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: regionBtn];
}

- (void) regionBtnClick
{
    if (!regionSelectView)
    {
        regionSelectView = [[RegionSelectionView alloc] initWithFrame: CGRectMake(0,
                                                                                  64,
                                                                                  iPhoneWidth,
                                                                                  iPhoneHeight)];
        regionSelectView.regionArray = [regionSelectViewModel gainRegionArrayWithCity: nil];
        [self.view addSubview: regionSelectView];
    }
    
    [regionSelectView regionShow];
    
    
    __weak ViewController* weakself = self;
    regionSelectView.changeCity = ^(id *obj)
    {
        //前往城市选择列表
        [weakself goCityListView];
    };
    regionSelectView.removeView = ^()
    {
        regionSelectView = nil;
    };
}

- (void) goCityListView
{
    //前往城市选择列表
    CityListViewController *cityListVC = [[CityListViewController alloc] init];
    cityListVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController: cityListVC animated: YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
