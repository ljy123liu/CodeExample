//
//  ViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/18/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "ViewController.h"
#import "ActivityIndicatorViewController.h"
#import "AlertControllerViewController.h"
#import "LPFPSLabel.h"
@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) UILabel *testLable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
    [self dataTitle];
    /**
     *  safiri隐藏方式
     */
    self.navigationController.hidesBarsOnSwipe = YES;
//    for (int i = 1; i < 10; i++) {
//        LLog(@"测试log");
//    }
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    button.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//    
//    self.testLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 20)];
//    self.testLable.text = @"12345";
//    self.testLable.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:self.testLable];
}

- (void)buttonClick {
    self.testLable.text = @"放假克拉的风景";

}

- (void)addUI {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
   
//    LPFPSLabel *fps = [[LPFPSLabel alloc]initWithFrame:CGRectMake(20, SCREEN_SIZE_HEIGHT - 100, 50, 30)];
//    [self.view addSubview:fps];
}

- (void)dataTitle {
    
    self.dataArray = [NSArray array];
    self.dataArray = @[@"ActivityIndicatorViewController",@"AlertControllerViewController",@"DatePickerViewController",@"PickerViewViewController"];
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
    
    NSString *className = self.dataArray[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _dataArray[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    //取消返回时候的选中高亮状态
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
