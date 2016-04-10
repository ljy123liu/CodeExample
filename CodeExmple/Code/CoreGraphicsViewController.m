//
//  CoreGraphicsViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 3/20/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//  绘图

/**
 *  iOS 主要的绘图系统有 UIKit, Core Graphics(Quartz), Core Animation, Core Image, OpenGL ES
 *
 *
 *
 *  @return <#return value description#>
 */

#import "CoreGraphicsViewController.h"
#import "DrawRectView.h"
#import "FlowerView.h"

@interface CoreGraphicsViewController ()
@property (nonatomic, assign,getter=isBtnClick) BOOL btnClick;
@end

@implementation CoreGraphicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"绘图";
    self.view.backgroundColor = [UIColor whiteColor];
    self.btnClick = NO;
    
    UIButton *drawRectButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 80, 100, 30)];
    drawRectButton.backgroundColor = [UIColor blueColor];
    drawRectButton.layer.cornerRadius = 5;
    drawRectButton.clipsToBounds = YES;
    [drawRectButton setTitle:@"drawRect" forState:UIControlStateNormal];
    [self.view addSubview:drawRectButton];
    [drawRectButton addTarget:self action:@selector(drawRectMethod) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *flowerButton = [[UIButton alloc]initWithFrame:CGRectMake(15, 120, 100, 30)];
    flowerButton.backgroundColor = [UIColor blueColor];
    flowerButton.layer.cornerRadius = 5;
    flowerButton.clipsToBounds = YES;
    [flowerButton setTitle:@"drawFlower" forState:UIControlStateNormal];
    [self.view addSubview:flowerButton];
    [flowerButton addTarget:self action:@selector(drawFlower) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  drawRect
 */
- (void)drawRectMethod {
    self.btnClick = !self.btnClick;
    if (self.btnClick) {
        //DrawRectView调用drawRect方法
        DrawRectView *drawRectView = [[DrawRectView alloc] initWithFrame:CGRectMake(150, 100, 50, 50)];
        drawRectView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:drawRectView];

    } else {
        for (UIView *view in self.view.subviews) {
            if ([view isKindOfClass:[DrawRectView class]]) {
                [view removeFromSuperview];
            }
        }
    }
}

- (void)drawFlower {
    self.btnClick = !self.btnClick;
    if (self.btnClick) {
        //DrawRectView调用drawRect方法
        FlowerView *drawFlower = [[FlowerView alloc] initWithFrame:CGRectMake(0, 150, SCREEN_SIZE_WIDTH, SCREEN_SIZE_WIDTH)];
        drawFlower.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:drawFlower];
        
    } else {
        for (UIView *view in self.view.subviews) {
            if ([view isKindOfClass:[FlowerView class]]) {
                [view removeFromSuperview];
            }
        }
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
