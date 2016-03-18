//
//  LYFPSLabelViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 3/1/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "LYFPSLabelViewController.h"
#import "LPFPSLabel.h"
#import "FPSView.h"
#import "OptimizeRoundCornerViewController.h"
#import "buttonTableViewCell.h"
@interface LYFPSLabelViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation LYFPSLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addUI];
    [self dataTitle];
}

- (void)addUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.delaysContentTouches = NO;
    [self.view addSubview:_tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"buttonTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    UIButton *rightNavItem = [UIButton buttonWithType:UIButtonTypeCustom];
    rightNavItem.frame = CGRectMake(0, 0, 40, 40);
    [rightNavItem setTitle:@"优化" forState:UIControlStateNormal];
    [rightNavItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightNavItem addTarget:self action:@selector(rightBarButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightNavItem];
    self.navigationItem.rightBarButtonItem = rightItem;
    
//    LPFPSLabel *fps = [[LPFPSLabel alloc]initWithFrame:CGRectMake(20, SCREEN_SIZE_HEIGHT - 100, 50, 30)];
////    [self.view addSubview:fps];
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    [window addSubview:fps];
    
    LPFPSLabel *fps = [[LPFPSLabel alloc]initWithFrame:CGRectMake(20, SCREEN_SIZE_HEIGHT - 100, 50, 30)];
    [self.view addSubview:fps];

}

- (void)dataTitle {
    
    self.dataArray = [NSArray array];
    self.dataArray = @[@"ActivityIndicatorViewController",@"AlertControllerViewController",@"DatePickerViewController",@"PickerViewViewController"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    buttonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
- (void)selected:(UIButton *)btn {
//    btn.selected = YES;
}

- (void)rightBarButtonItemClick {
    OptimizeRoundCornerViewController *op = [OptimizeRoundCornerViewController new];
    [self.navigationController pushViewController:op animated:YES];
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
