//
//  ThreadViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 3/20/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "ThreadViewController.h"
#import "AccountManager.h"
@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"多线程";
    self.view.backgroundColor = [UIColor whiteColor];
    /**
     *  NSThread
     */
    [self NSThreadClassMethod];
    [self NSThreadInstanceMethod];
    
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
 *  Serial vs Concurrent 串行 vs 并发
 *  任务串行执行就是每次只有一个任务被执行，任务并发执行就是在同一时间可以有多个任务被执行。
 */

/**
 *  Synchronous vs. Asynchronous 同步 vs. 异步
 *  一个同步函数只在完成了它预定的任务后才返回。
    一个异步函数，刚好相反，会立即返回，预定的任务会完成但不会等它完成。因此，一个异步函数不会阻塞当前线程去执行下一个函数。
 */

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
