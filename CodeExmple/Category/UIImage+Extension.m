//
//  UIImage+Extension.m
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)imageWithName:(NSString *)name
{
//    UIImage *image = nil;
//    if (iOS7) { // 处理iOS7的情况
//        NSString *newName = [name stringByAppendingString:@"_os7"];
//        image = [UIImage imageNamed:newName];
//    }
//    
//    if (image == nil) {
//        image = [UIImage imageNamed:name];
//    }
//    return image;
    return nil;
}

+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

- (UIImage *)imageWithRoundedCornersAndSize:(CGSize)sizeToFit andCornerRadius:(CGFloat)radius
{
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return output;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGFloat imageW = size.width;
    CGFloat imageH = size.height;
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

//添加圆角
- (UIImage *)addCornerRadius:(CGFloat)cornerRadius {
    CGFloat scale = [UIScreen mainScreen].scale;
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, scale);
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect
                                                    cornerRadius:cornerRadius];
    CGContextAddPath(c, path.CGPath);
    
    CGContextClip(c);
    [self drawInRect:rect];
    CGContextDrawPath(c, kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


// 非等比缩放
- (UIImage *)unequalScaleImageToSize:(CGSize)size {
    CGFloat scale =  [UIScreen mainScreen].scale;
    
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 等比缩放截取图片
+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGSize)reSize
{
    reSize = CGSizeMake(reSize.width*2.0, reSize.height*2.0);
    //先按要显示的大小去比例缩放下图片
    UIImage *scaledImage = [self zoomImage:image toScale:reSize];
    
    //计算截取位置。这里我们考虑一般拍照边界位置可能存在全白或全黑的情况，多数重要的会在中间位置。所以计算下截取是重绘图片的中间位置
    float drawW = 0.0;
    float drawH = 0.0;
    
    CGSize size_new = scaledImage.size;
    
    if (size_new.width > reSize.width) {
        drawW = (size_new.width - reSize.width)/2.0;
    }
    if (size_new.height > reSize.height) {
        drawH = (size_new.height - reSize.height)/2.0;
    }
    
    //截取截取大小为需要显示的大小。取图片中间位置截取
    CGRect myImageRect = CGRectMake(drawW, drawH, reSize.width, reSize.height);
    UIImage* bigImage= scaledImage;
    scaledImage = nil;
    CGImageRef imageRef = bigImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    
    UIGraphicsBeginImageContext(reSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    CGImageRelease(subImageRef);
    return smallImage;
}

+ (UIImage *)zoomImage:(UIImage *)image toScale:(CGSize)reSize
{
    //根据要显示的大小等比例算出缩放后的图片大小
    CGSize size_new = CGSizeMake(reSize.width, image.size.height/image.size.width*reSize.width);
    
    //绘制这个大小的图片
    UIGraphicsBeginImageContext(size_new);
    [image drawInRect:CGRectMake(0,0, size_new.width, size_new.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}






@end
