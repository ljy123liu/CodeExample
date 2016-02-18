//
//  TabBarViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/18/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController *vc1 = [ViewController new];
    UINavigationController *nv1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    vc1.title = @"主页";
    
    TwoViewController *vc2 = [TwoViewController new];
    UINavigationController *nv2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    vc2.title = @"三方库";
    
    ThreeViewController *vc3 = [ThreeViewController new];
    UINavigationController *nv3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    vc3.title = @"空间";
    
    FourViewController *vc4 = [FourViewController new];
    UINavigationController *nv4 = [[UINavigationController alloc]initWithRootViewController:vc4];
    vc4.title = @"其它";
    
    [self addChildViewController:nv1];
    [self addChildViewController:nv2];
    [self addChildViewController:nv3];
    [self addChildViewController:nv4];
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
