//
//  StretchImageViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/28/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "StretchImageViewController.h"
@interface StretchImageViewController ()
@property (strong, nonatomic) UIImageView *normalImageView;
@property (strong, nonatomic) UIImageView *strectchImageView;

@end

@implementation StretchImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"图片拉伸";
    
    self.normalImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 64, 42)];
    self.normalImageView.image = [UIImage imageNamed:@"strectch"];
    [self.view addSubview:self.normalImageView];
    
    self.strectchImageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 200, 42)];
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 20, 20);
    UIImage *image = [self strectImage:@"strectch" capInsets:insets];
    self.strectchImageView.image = image;
    [self.view addSubview:self.strectchImageView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 260, 200, 42)];
    UIEdgeInsets insets2 = UIEdgeInsetsMake(10, 20, 10, 20);
    UIImage *image2 = [self strectImage:@"strectch" capInsets:insets2];
    imageView.image = image2;
    [self.view addSubview:imageView];
}

- (UIImage *)strectImage:(NSString *)imageName capInsets:(UIEdgeInsets)insets{
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    return image;
}


@end
