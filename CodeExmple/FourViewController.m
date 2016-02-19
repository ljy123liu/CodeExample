//
//  FourViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/18/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "FourViewController.h"
#import "SpliceCircleViewController.h"
#import "HideNavBarAndTabBarViewController.h"
@interface FourViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *dataArray;
@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
    [self dataTitle];
}

- (void)addUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)dataTitle {
    
    self.dataArray = [NSArray array];
    
//    NSString *str1 = @"SpliceCircle";
//    NSString *str2 = @"HideNavBarAndTabBar";
//    [self.dataArray addObject:str1];
//    [self.dataArray addObject:str2];
    self.dataArray = @[@"SpliceCircle",@"HideNavBarAndTabBar"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *iden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    NSString *str = _dataArray[indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    switch (indexPath.row) {
//        case SpliceCircle:
//            <#statements#>
//            break;
//            
//        default:
//            break;
//    }
    if (indexPath.row == 0) {
        SpliceCircleViewController *sc = [SpliceCircleViewController new];
        [self.navigationController pushViewController:sc animated:YES];
    }else if (indexPath.row == 1) {
        HideNavBarAndTabBarViewController *hide = [HideNavBarAndTabBarViewController new];
        [self.navigationController pushViewController:hide animated:YES];
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
