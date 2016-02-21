//
//  ActivityIndicatorViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/21/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "ActivityIndicatorViewController.h"

@interface ActivityIndicatorViewController ()
@property (nonatomic,strong)UIActivityIndicatorView *grayStyleActivityIndicatorView;
@property (nonatomic,strong)UIActivityIndicatorView *tintedActivityIndicatorView;
@end

@implementation ActivityIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self configureUI];
    [self configureGrayStyleActivityIndicatorView];
    [self configureTintedStyleActivityIndicatorView];
}

- (void)configureUI {
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 50, 50)];
    [button setTitle:@"停/开" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick {
    if (_grayStyleActivityIndicatorView.isAnimating) {
        [_grayStyleActivityIndicatorView stopAnimating];
    }else {
        [_grayStyleActivityIndicatorView startAnimating];
    }
}

- (void)configureGrayStyleActivityIndicatorView{
    _grayStyleActivityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _grayStyleActivityIndicatorView.frame = CGRectMake(100, 100, 10, 10);
    [_grayStyleActivityIndicatorView startAnimating];
    _grayStyleActivityIndicatorView.hidesWhenStopped = YES;
    [self.view addSubview:_grayStyleActivityIndicatorView];
}

- (void)configureTintedStyleActivityIndicatorView{
    _tintedActivityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _tintedActivityIndicatorView.frame = CGRectMake(100, 200, 10, 10);
    _tintedActivityIndicatorView.color = [UIColor redColor];
    [_tintedActivityIndicatorView startAnimating];
    [self.view addSubview:_tintedActivityIndicatorView];
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
