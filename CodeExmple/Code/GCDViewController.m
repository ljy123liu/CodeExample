//
//  GCDViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 4/18/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "GCDViewController.h"

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"GCD";
//    [self dispatchBarrierAsyncDemo];
//    [self deadLockCase1];
}

#pragma mark - GCD
- (void)gcdMethod {
    
    //自定义队列
    //串行队列
    dispatch_queue_t serialQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    //并行队列
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    //全局并发队列
    /**
     *  系统提供四个全局并发队列，这四个队列有这对应的优先级，用户是不能够创建全局队列的，只能获取。
     */
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    
    //同步线程
    dispatch_sync(serialQueue, ^{
        
    });
    //异步线程
    dispatch_async(concurrentQueue, ^{
        
    });
    dispatch_async(globalQueue, ^{
        
    });
    
    // 后台执行：
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
    
    // 主线程执行：
    dispatch_async(dispatch_get_main_queue(), ^{
        
    });
    
    // 一次性执行：
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
    });
    
    // 延迟 2 秒执行：
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    });
    
    //执行多少次，5次
    //会阻碍线程
    dispatch_apply(5, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"%zu",index);
    });
    
    
    /**
     *  自定义队列的优先级：可以通过dipatch_queue_attr_make_with_qos_class或dispatch_set_target_queue方法设置队列的优先级
     */
    
    //    //dipatch_queue_attr_make_with_qos_class
    //    dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_UTILITY, -1);
    //    dispatch_queue_t queue = dispatch_queue_create("com.starming.gcddemo.qosqueue", attr);
    //
    //    //dispatch_set_target_queue
    //    dispatch_queue_t queue = dispatch_queue_create("com.starming.gcddemo.settargetqueue",NULL); //需要设置优先级的queue
    //    dispatch_queue_t referQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0); //参考优先级
    //    dispatch_set_target_queue(queue, referQueue); //设置queue和referQueue的优先级一样
    
}

/**
 *  dispatch_set_target_qu eue：可以设置优先级，也可以设置队列层级体系，比如让多个串行和并行队列在统一一个串行队列里串行执行
 */
- (void)gcdTargetQueue {
    
    dispatch_queue_t serialQueue = dispatch_queue_create("serialqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t firstQueue = dispatch_queue_create("firstqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t secondQueue = dispatch_queue_create("secondqueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_set_target_queue(firstQueue, serialQueue);
    dispatch_set_target_queue(secondQueue, serialQueue);
    
    dispatch_async(firstQueue, ^{
        NSLog(@"1");
        [NSThread sleepForTimeInterval:3.f];
    });
    dispatch_async(secondQueue, ^{
        NSLog(@"2");
        [NSThread sleepForTimeInterval:2.f];
    });
    dispatch_async(secondQueue, ^{
        NSLog(@"3");
        [NSThread sleepForTimeInterval:1.f];
    });
}

//Dispatch Barrier解决多线程并发读写同一个资源发生死锁
- (void)dispatchBarrierAsyncDemo {
    //防止文件读写冲突，可以创建一个串行队列，操作都在这个队列中进行，没有更新数据读用并行，写用串行。
    dispatch_queue_t dataQueue = dispatch_queue_create("dispatchBarrier", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(dataQueue, ^{
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"read data:1");
    });
    dispatch_async(dataQueue, ^{
        NSLog(@"read data:2");
    });
    //等待前面的都完成，在执行barrier后面的
    dispatch_barrier_async(dataQueue, ^{
        NSLog(@"writer data:1");
        [NSThread sleepForTimeInterval:1];
    });
    dispatch_async(dataQueue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"read data 3");
    });
    dispatch_async(dataQueue, ^{
        NSLog(@"read data 4");
    });
    NSLog(@"after barrier log 10");
}

//dispatch groups是专门用来监视多个异步任务。dispatch_group_t实例用来追踪不同队列中的不同任务。
/**
 *  当group里所有事件都完成GCD API有两种方式发送通知，第一种是dispatch_group_wait，会阻塞当前进程，等所有任务都完成或等待超时。第二种方法是使用dispatch_group_notify，异步执行闭包，不会阻塞。
 */
- (void)dispatchGroupWait {
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("dispatchGroup", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    //在group中添加队列的block
    dispatch_group_async(group, concurrentQueue, ^{
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"1");
    });
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"2");
    });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);//等待线程走完，再走下面的代码
    NSLog(@"go on");
}

//dispatch_group_notify
- (void)dispatchGroupNotifyDemo {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue",DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"1");
    });
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"2");
    });
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"3");
    });
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"4");
    });
    dispatch_group_async(group, concurrentQueue, ^{
        NSLog(@"5");
    });

    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"end");
    });
    NSLog(@"can continue");//主线程执行
}

//Dispatch Block
- (void)createDispatchBlock {
    //普通
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_block_t block = dispatch_block_create(0, ^{
        NSLog(@"run block");
    });
    dispatch_async(concurrentQueue, block);
    
    dispatch_block_t qosBlock  = dispatch_block_create_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1, ^{
        NSLog(@"run qos block");
    });
    dispatch_async(concurrentQueue, qosBlock);
}

/**
 *  dispatch_block_wait：可以根据dispatch block来设置等待时间，参数DISPATCH_TIME_FOREVER会一直等待block结束
 */
- (void)dispatchBlockWaitDemo {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.starming.gcddemo.serialqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t block = dispatch_block_create(0, ^{
        NSLog(@"star");
        [NSThread sleepForTimeInterval:5.f];
        NSLog(@"end");
    });
    dispatch_async(serialQueue, block);
    //设置DISPATCH_TIME_FOREVER会一直等到前面任务都完成
    dispatch_block_wait(block, DISPATCH_TIME_FOREVER);
    NSLog(@"ok, now can go on");
}

/**
 *  dispatch_block_notify：可以监视指定dispatch block结束，然后再加入一个block到队列中。三个参数分别为，第一个是需要监视的block，第二个参数是需要提交执行的队列，第三个是待加入到队列中的block
 */
- (void)dispatchBlockNotifyDemo {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.starming.gcddemo.serialqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t firstBlock = dispatch_block_create(0, ^{
        NSLog(@"first block start");
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"first block end");
    });
    dispatch_async(serialQueue, firstBlock);
    dispatch_block_t secondBlock = dispatch_block_create(0, ^{
        NSLog(@"second block run");
    });
    //first block执行完才在serial queue中执行second block
    dispatch_block_notify(firstBlock, serialQueue, secondBlock);
}

/**
 *  dispatch_block_cancel：iOS8后GCD支持对dispatch block的取消
 */
- (void)dispatchBlockCancelDemo {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.starming.gcddemo.serialqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t firstBlock = dispatch_block_create(0, ^{
        NSLog(@"first block start");
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"first block end");
    });
    dispatch_block_t secondBlock = dispatch_block_create(0, ^{
        NSLog(@"second block run");
    });
    dispatch_async(serialQueue, firstBlock);
    dispatch_async(serialQueue, secondBlock);
    //取消secondBlock
    dispatch_block_cancel(secondBlock);
}

/**
 *  GCD死锁
 当前串行队列里面同步执行当前串行队列就会死锁，解决的方法就是将同步的串行队列放到另外一个线程就能够解决。
 */
- (void)deadLockCase1 {
    NSLog(@"1");
    //主队列的同步线程，按照FIFO的原则（先入先出），2排在3后面会等3执行完，但因为同步线程，3又要等2执行完，相互等待成为死锁。
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}



























@end
