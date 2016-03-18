//
//  UIImageView+RoundRect.m
//  CodeExmple
//
//  Created by LIUYONG on 2/28/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "UIImageView+RoundRect.h"

@implementation UIImageView (RoundRect)

+ (UIImageView *)roundedRectInitWithFrame:(CGRect)frame imageNamed:(NSString *)imageName {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    UIImage *image = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, image.scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:frame.size.width / 2] addClip];
    [image drawInRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageView;
}

+ (UIImageView *)roundedRectWithImageView:(UIImageView *)imageView imageNamed:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius {
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:cornerRadius] addClip];
    [image drawInRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageView;
}

@end
