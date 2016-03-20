//
//  AccountManager.m
//  CodeExmple
//
//  Created by LIUYONG on 3/20/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "AccountManager.h"

@implementation AccountManager
//load：其它类导入本类的头文件时调用（一次）
+ (void)load {
    NSLog(@"AccountManager load");
}

//initialize:初始化对象的时候调用一次
+ (void)initialize {
    NSLog(@"AccountManager initialize");
}
@end
