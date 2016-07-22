//
//  UILabel+Image.h
//  CustomView
//
//  Created by tsou on 16/7/19.
//  Copyright © 2016年 lv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Image)

@property (nonatomic, strong) UIImage *SideImage;
@property (nonatomic, assign) NSTextAlignment SideImageAlignment;
@property (nonatomic, assign) CGFloat SideImageSize;

- (void) Cancellation;

@end
