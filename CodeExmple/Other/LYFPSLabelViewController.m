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

//    te    st.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:test];
}

- (void)addUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.delaysContentTouches = NO;
    [self.view addSubview:_tableView];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"cell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
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
    
    buttonTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"buttonTableViewCell" owner:self options:nil] firstObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
- (void)selected:(UIButton *)btn {
//    btn.selected = YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSString *className = self.dataArray[indexPath.row];
//    Class class = NSClassFromString(className);
//    if (class) {
//        UIViewController *ctrl = class.new;
//        ctrl.title = _dataArray[indexPath.row];
//        [self.navigationController pushViewController:ctrl animated:YES];
//    }
//    //取消返回时候的选中高亮状态
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
