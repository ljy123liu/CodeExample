//
//  FourViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/18/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
}

- (void)addUI {
//    self.view.backgroundColor = [UIColor redColor];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
//    self.tableView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_tableView];
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
