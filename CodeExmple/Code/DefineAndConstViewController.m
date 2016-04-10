//
//  DefineAndConstViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 4/9/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "DefineAndConstViewController.h"

@implementation DefineAndConstViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"宏与常量";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@",kUserName);
    NSLog(@"%@",kUserName2);
}
@end
