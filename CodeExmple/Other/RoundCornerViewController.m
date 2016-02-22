//
//  RoundCornerViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/22/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "RoundCornerViewController.h"

@interface RoundCornerViewController ()

@end

@implementation RoundCornerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //TODO:高性能切圆角
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageView];
    UIImage *image = [UIImage new];
    imageView.image = [image imageWithRoundedCornersAndSize:CGSizeMake(100, 100) andCornerRadius:100];
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
