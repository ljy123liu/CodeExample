//
//  SpliceCircleViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/18/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "SpliceCircleViewController.h"

@interface SpliceCircleViewController ()

@end

@implementation SpliceCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SpliceCircle";
    self.view.backgroundColor = [UIColor whiteColor];
    [self showCircle:20 d1:20 d2:40];
}
//只选两种圆的情况
- (void)showCircle:(int)n d1:(double)d1 d2:(double)d2 {
    
    double r1 = d1/2;
    double r2 = d2/2;
    //l:间距
    double l = r1+r2+1;
    //大圆半径
    double someR = l * sin((n-2) * M_PI / (2*n)) / sin(2*M_PI/n);
//    NSLog(@"%f",someR);
    
    for (int i = 0; i < n; ++i) {
        
        double x = someR * sin(i*2*M_PI/n);
        double y = someR * cos(i*2*M_PI/n);
        double r = i % 2 ? r1 : r2;
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2*r, 2*r)];
        view.center = CGPointMake(x+self.view.centerX, y+self.view.centerY);
        view.clipsToBounds = YES;
        view.layer.cornerRadius = r;
        view.backgroundColor = [UIColor redColor];
        if (i%2==1) {
            view.backgroundColor = [UIColor blueColor];
        }
        [self.view addSubview:view];
    }
    
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
