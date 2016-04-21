//
//  NSThreadViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 4/18/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "NSThreadViewController.h"

@implementation NSThreadViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"NSThread";
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

@end
