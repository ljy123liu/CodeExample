//
//  UIButton+SelectedType.m
//  Baletu
//
//  Created by LIUYONG on 16/6/1.
//  Copyright © 2016年 朱 亮亮. All rights reserved.
//

#import "UIButton+SelectedType.h"
@implementation UIButton (SelectedType)
+ (UIButton *)initRoundRectButtonWithFrame:(CGRect)frame title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    UIImage *backGroundImage = [self imageWithColor:[UIColor redColor] imageWidth:frame.size.width imageHeight:frame.size.height];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setBackgroundImage:backGroundImage forState:UIControlStateSelected];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    button.layer.borderWidth = borderWidth;
    button.layer.borderColor = borderColor.CGColor;
    return button;
}

+ (UIButton *)initSquareRectButtonWithFrame:(CGRect)frame title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    UIImage *backGroundImage = [self imageWithColor:[UIColor redColor] imageWidth:frame.size.width imageHeight:frame.size.height];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [button setBackgroundImage:backGroundImage forState:UIControlStateSelected];
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = borderWidth;
    button.layer.borderColor = borderColor.CGColor;
    return button;
}

+ (UIImage *)imageWithColor:(UIColor *)color imageWidth:(CGFloat)imageWidth imageHeight:(CGFloat)imageHeight {
    CGFloat imageW = imageHeight;
    CGFloat imageH = imageHeight;
    // 1.开启基于位图的图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);
    // 2.画一个color颜色的矩形框
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));
    // 3.拿到图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

@end
