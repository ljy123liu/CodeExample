//
//  RoundCornerViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/22/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "RoundCornerViewController.h"
#import "UIImageView+RoundRect.h"
#import "UIImageView+CornerRadius.h"
@interface RoundCornerViewController ()

@end

@implementation RoundCornerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"高性能切圆角";
    // Do any additional setup after loading the view.
    //高性能切圆角
    UIImageView *imageView = [UIImageView roundedRectInitWithFrame:CGRectMake(100, 100, 100, 100) imageNamed:@"2"];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    LLog(@"RoundCornerViewController.h  dealloc  dealloc dealloc");
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
