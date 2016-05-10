//
//  CoreAnimationViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 3/20/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "CoreAnimationViewController.h"

@interface CoreAnimationViewController ()

@end

@implementation CoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"核心动画";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"11"];
    self.view.layer.contentsScale = [[UIScreen mainScreen] scale];
    self.view.layer.contentsGravity = kCAGravityCenter;
    self.view.layer.contents = (id)[image CGImage];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"请输入文字";
    
    self.navigationItem.titleView = textField;
    
    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 300, 40)];
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.placeholder = @"副科级阿里看风景啊";
    [self.view addSubview:textField2];
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
