//
//  OptimizeRoundCornerViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 3/2/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "OptimizeRoundCornerViewController.h"
#import "LPFPSLabel.h"
#import "OptimizeRoundCornerTableViewCell.h"
@interface OptimizeRoundCornerViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OptimizeRoundCornerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addUI];
}

- (void)addUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.delaysContentTouches = NO;
    [self.view addSubview:_tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"OptimizeRoundCornerTableViewCell" bundle:nil] forCellReuseIdentifier:@"opCell"];
    
    LPFPSLabel *fps = [[LPFPSLabel alloc]initWithFrame:CGRectMake(20, SCREEN_SIZE_HEIGHT - 100, 50, 30)];
    [self.view addSubview:fps];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    OptimizeRoundCornerTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"OptimizeRoundCornerTableViewCell" owner:self options:nil] firstObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
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
