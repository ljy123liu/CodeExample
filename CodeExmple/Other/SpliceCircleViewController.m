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
    [self showCircle:20 x1:self.view.centerX y1:self.view.centerY];
}

- (void)showCircle:(int)n x1:(double)x1 y1:(double)y1 {
    //l:间距
    double l = 32;
    double someR = l * sin((n-2) * M_PI / (2*n)) / sin(2*M_PI/n);
    
    for (int i = 0; i < n; ++i) {
        double x = someR * sin(i*2*M_PI/n);
        double y = someR * cos(i*2*M_PI/n);
        double r = i % 2 ? 10 : 20;
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 2*r, 2*r)];
        view.center = CGPointMake(x+x1, y+y1);
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
