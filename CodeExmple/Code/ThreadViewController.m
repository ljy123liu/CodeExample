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
@interface ThreadViewController ()

@end

@implementation ThreadViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"多线程";
    self.view.backgroundColor = [UIColor whiteColor];
    /**
     *  NSThread
     */
    [self NSThreadClassMethod];
    [self NSThreadInstanceMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSThread
/**
 *  实例方法创建线程
 */
- (void)NSThreadInstanceMethod {
    NSThread *myThread = [[NSThread alloc] initWithTarget:self selector:@selector(NSThreadDoSomeThingWithInstanceMethod) object:nil];
    [myThread start];
}

/**
 *  类方法创建新线程
 */
- (void)NSThreadClassMethod {
    [NSThread detachNewThreadSelector:@selector(NSThreadDoSomeThingWithClassMethod:) toTarget:self withObject:@"sendValue:NSThread"];
}

- (void)NSThreadDoSomeThingWithInstanceMethod {
    NSLog(@"NSThread - Instance Method");
}

- (void)NSThreadDoSomeThingWithClassMethod:(id)object {
    NSLog(@"%@",object);
    NSLog(@"NSThread - Class Method");
}

/**
 *  不显式创建线程,（可以取消线程操作）
 */
- (void)NSObjectMethodWithPerformSelector {
    //在主线程更新UI
    [self performSelectorOnMainThread:@selector(doSomeThingOnMainThread) withObject:nil waitUntilDone:YES];
    //后台线程
    [self performSelectorInBackground:@selector(doSomeThingInBackGround) withObject:nil];
    //延时执行
    [self performSelector:@selector(doSomeDelay) withObject:nil afterDelay:2.0];
    //取消线程操作
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
}

- (void)doSomeThingOnMainThread {
    NSLog(@"performSelectorOnMainThread");
}

- (void)doSomeThingInBackGround {
    NSLog(@"performSelectorInBackground");
}

- (void)doSomeDelay {
    NSLog(@"performSelector:afterDelay");
}


#pragma mark - GCD
/**
 *  单例
 */
+ (AccountManager *)shareManager {
    static AccountManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AccountManager new];
    });
    return manager;
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
