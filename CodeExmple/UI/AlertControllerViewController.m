//
//  AlertControllerViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/21/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "AlertControllerViewController.h"

@interface AlertControllerViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

typedef NS_ENUM(NSInteger, AlertControllerSection) {
    AlertControllerSectionAlert = 0,
    AlertControllerSectionActionSheet
};

// Corresponds to the row in the alert style section.
typedef NS_ENUM(NSInteger, AlertControllerAlertRow) {
    AlertControllerAlertRowSimple = 0,
    AlertControllerAlertRowOkayCancel,
    AlertControllerAlertRowOther,
    AlertControllerAlertRowTextEntry,
    AlertControllerAlertRowTextEntrySecure
};

// Corresponds to the row in the action sheet style section.
typedef NS_ENUM(NSInteger, AlertControllerActionSheetRow) {
    AlertControllerActionSheetRowOkayCancel = 0,
    AlertControllerActionSheetRowOther
};


@implementation AlertControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addUI];
    [self dataTitle];
}

- (void)addUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)dataTitle {
    
    self.dataArray = [NSMutableArray array];
    NSArray *array1 = @[@"simpleAlert",@"showOKAndCancelAlert",@"otherAlert",@"textEntryAlert"];
    NSArray *array2 = @[@"alertSheet"];
    [self.dataArray addObject:array1];
    [self.dataArray addObject:array2];
    
}

- (void)showSimpleAlert {
    
    UIAlertController *simpleAlert = [UIAlertController alertControllerWithTitle:@"警告" message:@"简单弹窗" preferredStyle:UIAlertControllerStyleAlert];
    
    //action
    UIAlertAction *simpleAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    //alert add action
    [simpleAlert addAction:simpleAction];
    [self presentViewController:simpleAlert animated:YES completion:^{
        
    }];
}

- (void)showOKAndCancelAlert {
    
    UIAlertController *okAndCancelAlert = [UIAlertController alertControllerWithTitle:@"确定/取消" message:@"同意执行操作" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LLog(@"同意执行操作");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [okAndCancelAlert addAction:okAction];
    [okAndCancelAlert addAction:cancelAction];
    
    [self presentViewController:okAndCancelAlert animated:YES completion:^{
        
    }];
}

- (void)showOtherAlert {
    UIAlertController *otherAlert = [UIAlertController alertControllerWithTitle:@"多选" message:@"同意执行操作" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LLog(@"同意执行操作1");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LLog(@"同意执行操作2");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [otherAlert addAction:action1];
    [otherAlert addAction:action2];
    [otherAlert addAction:cancelAction];
    
    [self presentViewController:otherAlert animated:YES completion:^{
        
    }];
}

- (void)showTextEntryAlert {
    UIAlertController *textEntryAlert = [UIAlertController alertControllerWithTitle:@"账号" message:@"请输入您的帐号" preferredStyle:UIAlertControllerStyleAlert];\
    
    [textEntryAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        LLog(@"帐号已经输入");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LLog(@"同意执行操作2");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [textEntryAlert addAction:action2];
    [textEntryAlert addAction:cancelAction];
    [self presentViewController:textEntryAlert animated:YES completion:^{
        
    }];
}

- (void)showAlertActionSheet {
    UIAlertController *alertSheet = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否执行操作    " preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        LLog(@"同意执行操作");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertSheet addAction:action];
    [alertSheet addAction:cancelAction];
    [self presentViewController:alertSheet animated:YES completion:^{
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = _dataArray[section];
    return array.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderterInSection:(NSInteger)section {
    if (section == 0) {
        return @"Alert";
    }else {
        return @"AlertActionSheet";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *iden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    NSArray *array = _dataArray[indexPath.section];
    NSString *str = array[indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AlertControllerSection *section = indexPath.section;
    if (section == AlertControllerSectionAlert) {
        AlertControllerAlertRow row = indexPath.row;
        switch (row) {
            case AlertControllerAlertRowSimple:
                [self showSimpleAlert];
                break;
            case AlertControllerAlertRowOkayCancel:
                [self showOKAndCancelAlert];
                break;
            case AlertControllerAlertRowOther:
                [self showOtherAlert];
                break;
            case AlertControllerAlertRowTextEntry:
                [self showTextEntryAlert];
            default:
                break;
        }
    }else {
        AlertControllerActionSheetRow row = indexPath.row;
        switch (row) {
            case AlertControllerActionSheetRowOkayCancel:
                [self showAlertActionSheet];
                break;
                
            default:
                break;
        }
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
