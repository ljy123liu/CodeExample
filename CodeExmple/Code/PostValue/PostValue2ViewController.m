//
//  PostValue2ViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/26/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "PostValue2ViewController.h"
#import "DataSource.h"
@interface PostValue2ViewController ()<UITextViewDelegate>
//@property (nonatomic, strong) PostValue2ViewController *vc2;

@end

@implementation PostValue2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"传值";
    
}

- (IBAction)notificationCenterStyle:(UIButton *)sender {
    NSDictionary *dict = @{@"str":@"通知传值"};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"notificationCenter" object:nil userInfo:dict];
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)delegateStyle:(UIButton *)sender {
    [self.delegate changeLabelText:@"代理传值"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)blockStyle:(UIButton *)sender {
    self.textBlock(@"block传值");
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)userDefaultStyle:(UIButton *)sender {
    
    [[NSUserDefaults standardUserDefaults] setObject:self.KVOtextFeild.text forKey:@"userDefault"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)singletonStyle:(UIButton *)sender {
    DataSource *dataSource = [DataSource shareDataSource];
    dataSource.value = self.KVOtextFeild.text;
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)KVO:(UIButton *)sender {
    self.KVO = self.KVOtextFeild.text;
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

//- (void)textViewDidEndEditing:(UITextView *)textView {
//    self.KVO = self.KVOtextFeild.text;
//    
//}

- (void)dealloc {
    LLog(@"PostValue2ViewController dealloc");
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
