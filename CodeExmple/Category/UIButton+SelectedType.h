//
//  UIButton+SelectedType.h
//  Baletu
//
//  Created by LIUYONG on 16/6/1.
//  Copyright © 2016年 朱 亮亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SelectedType)
+ (UIButton *)initRoundRectButtonWithFrame:(CGRect)frame title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

+ (UIButton *)initSquareRectButtonWithFrame:(CGRect)frame title:(NSString *)title titleFont:(CGFloat)titleFont titleColor:(UIColor *)titleColor borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
