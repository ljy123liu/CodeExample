//
//  ThreadViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 3/20/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//
/**
 *  多线程
 *  简单来说相当于cpu在10个线程之间来回切换，造成一个多任务处理的假象。
 */

/**
 *  多线程与但线程操作
 *  并行队列异步执行才能在多线程，并行队列同步执行只会在主线程执行
 */


/**
 *  基本概念
 *  1.进程和线程
 *  进程：(1）每一个运行的程序都占用一个系统进程（一个app）;（2）一个进程包含N个线程;(3)进程主要是存放数据、以及内部子线程的容器
 *  线程：(1) 一个线程就是在进程的一个执行代码的路径;（2）线程主要是做具体事情的
 */

/**
 *  Serial vs Concurrent 串行 vs 并发
 *  串行就是每次只有一个任务被执行，既所有任务都放在一条线上，顺序执行。并发就是在同一时间可以有多个任务被执行。
 */

/**
 *  Synchronous vs. Asynchronous 同步 vs. 异步
 *  同步函数只在完成了它预定的任务后才返回，等待操作完成后再继续执行下一个任务，会阻塞主线程。
 异步函数，刚好相反，会立即返回，预定的任务会完成但不会等它完成。因此，一个异步函数不会阻塞当前线程，去执行下一个函数。
 */

/**
 *  队列 vs 线程
 *  队列：串行队列 ＋ 并发队列
 *  一个程序只有一个主队列，主队列为串行队列，在主线程执行任务。并行队列，N条线程。
 */

/**
 *  并发 vs 并行
 *  并发： 指现象，多个任务同时发生
 *  并行： 指技术，同时处理多个任务的技术
 */

/**
 *  开辟线程的3种方式
 *  1、NSThread: 手动管理，无法利用多核技术
    2、GCD: 苹果公司用C语言封装的线程库，应用广泛
    3、NSOPeration: 苹果公司对GCD封装
 */

#import "ThreadViewController.h"
#import "AccountManager.h"
@interface ThreadViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation ThreadViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"多线程";
    [self addUI];
    [self dataTitle];
}

- (void)addUI {
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

- (void)dataTitle {
    
    self.dataArray = [NSArray array];
    self.dataArray = @[@"NSThreadViewController",@"GCDViewController"];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
