//
//  UILabel+Image.m
//  CustomView
//
//  Created by tsou on 16/7/19.
//  Copyright © 2016年 lv. All rights reserved.
//

#import "UILabel+Image.h"
#import <objc/runtime.h>

static const NSString *SideImageKey = @"SideImageKey";
static const NSString *SideImageAlignmentKey = @"SideImageAlignmentKey";
static const NSString *SideImageSizeKey = @"SideImageSizeKey";

@implementation UILabel (Image)

- (UIImage *) SideImage
{
    return objc_getAssociatedObject(self, &SideImageKey);
}

- (void) setSideImage:(UIImage *)SideImage
{
    objc_setAssociatedObject(self, &SideImageKey, SideImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self makeSideImage];
}

- (NSTextAlignment) SideImageAlignment
{
    NSNumber *number = objc_getAssociatedObject(self, &SideImageAlignmentKey);
    return [number integerValue];
}

- (void) setSideImageAlignment:(NSTextAlignment)SideImageAlignment
{
    NSNumber *number = [NSNumber numberWithInteger: SideImageAlignment];
    objc_setAssociatedObject(self, &SideImageAlignmentKey, number, OBJC_ASSOCIATION_ASSIGN);
    
    [self makeSideImage];
}

- (CGFloat) SideImageSize
{
    NSNumber *sizeNumber = objc_getAssociatedObject(self, &SideImageSizeKey);
    if (sizeNumber)
    {
        return [sizeNumber floatValue];
    }
    else
    {
        return 15.f;
    }
}

- (void) setSideImageSize:(CGFloat)SideImageSize
{
    NSNumber *sizeNumber = [NSNumber numberWithFloat: SideImageSize];
    objc_setAssociatedObject(self, &SideImageSizeKey, sizeNumber, OBJC_ASSOCIATION_RETAIN);
    
    [self makeSideImage];
}

- (void) makeSideImage
{
    for (UIView *tempView in [self subviews])
    {
        [tempView removeFromSuperview];
    }
    
    NSString *labelStr = self.text;
    
    NSMutableAttributedString *
    attrString = [[NSMutableAttributedString alloc] initWithString: labelStr];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = self.textAlignment;

    if (self.SideImageAlignment == NSTextAlignmentRight)
    {
        style.tailIndent = -self.SideImageSize;
        style.firstLineHeadIndent = 0;//首行头缩进

        UIImageView *sideImgView = [[UIImageView alloc] initWithFrame: CGRectMake( self.frame.size.width-self.SideImageSize, (self.frame.size.height-self.SideImageSize)/2, self.SideImageSize, self.SideImageSize)];
        [sideImgView setBackgroundColor: [UIColor clearColor]];
        sideImgView.image = self.SideImage;
        [self addSubview: sideImgView];
    }
    else if (self.SideImageAlignment == NSTextAlignmentLeft)
    {
        style.headIndent = self.SideImageSize;
        style.firstLineHeadIndent = self.SideImageSize;//首行头缩进

        UIImageView *sideImgView = [[UIImageView alloc] initWithFrame: CGRectMake( 0, (self.frame.size.height-self.SideImageSize)/2, self.SideImageSize, self.SideImageSize)];
        [sideImgView setBackgroundColor: [UIColor clearColor]];
        sideImgView.image = self.SideImage;
        [self addSubview: sideImgView];
    }
    else if (self.SideImageAlignment == NSTextAlignmentCenter)
    {
        style.headIndent = self.SideImageSize;
        style.firstLineHeadIndent = self.SideImageSize;//首行头缩进

        style.tailIndent = -self.SideImageSize;
        
        UIImageView *sideImgView = [[UIImageView alloc] initWithFrame: CGRectMake( 0, (self.frame.size.height-self.SideImageSize)/2, self.SideImageSize, self.SideImageSize)];
        sideImgView.image = self.SideImage;
        [self addSubview: sideImgView];
        
        UIImageView *sideImgView2 = [[UIImageView alloc] initWithFrame: CGRectMake( self.frame.size.width-self.SideImageSize, (self.frame.size.height-self.SideImageSize)/2, self.SideImageSize, self.SideImageSize)];
        sideImgView2.image = self.SideImage;
        [self addSubview: sideImgView2];
    }
    else
    {
        style.tailIndent = -self.SideImageSize;
        style.firstLineHeadIndent = 0;//首行头缩进

        UIImageView *sideImgView = [[UIImageView alloc] initWithFrame: CGRectMake( self.frame.size.width-self.SideImageSize, (self.frame.size.height-self.SideImageSize)/2, self.SideImageSize, self.SideImageSize)];
        [sideImgView setBackgroundColor: [UIColor clearColor]];
        sideImgView.image = self.SideImage;
        [self addSubview: sideImgView];
    }
    
    [attrString addAttribute: NSParagraphStyleAttributeName
                       value: style
                       range: NSMakeRange(0, [labelStr length])];
    self.attributedText = attrString;
}

- (void) Cancellation
{
    objc_removeAssociatedObjects(self);
}

@end
