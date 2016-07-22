//
//  CityListViewController.m
//  CustomView
//
//  Created by tsou on 16/7/20.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "CityListViewController.h"
#import "CityListView.h"

@interface CityListViewController ()
{
    CityListView *cityListView;             //城市列表
}
@end

@implementation CityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: [UIColor colorWithWhite: 0.97 alpha: 1.f]];
    // Do any additional setup after loading the view.
    
    UIButton *loadBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [loadBtn setFrame: CGRectMake( 0, 0, 30, 30)];
    [loadBtn setTitle: @"load" forState: UIControlStateNormal];
    [loadBtn.titleLabel setFont: [UIFont systemFontOfSize: 13.f]];
    [loadBtn setTitleColor: [UIColor colorWithHex: @"363636"] forState: UIControlStateNormal];
    [loadBtn addTarget: self action: @selector(load) forControlEvents: UIControlEventTouchUpInside];
    UIBarButtonItem *loadItem = [[UIBarButtonItem alloc] initWithCustomView: loadBtn];
    self.navigationItem.rightBarButtonItem = loadItem;
    
    cityListView =
    [[CityListView alloc] initWithFrame: CGRectMake( 0, 0, iPhoneWidth, iPhoneHeight)];
    cityListView.cityArray = [NSMutableArray arrayWithObjects:
                              @"123123",
                              @"123123",
                              @"123123",
                              @"1233123", nil];
    [self.view addSubview: cityListView];
}

- (void) load
{
    cityListView.cityArray = [NSMutableArray arrayWithObjects:
                              @"asdfasdaf",
                              @"adfasdasf",
                              @"asdfasdfa",
                              @"adsfasdfasdf",
                              @"asdfasd",
                              @"24234132",
                              @"23434", nil];
    [cityListView.cityTableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
