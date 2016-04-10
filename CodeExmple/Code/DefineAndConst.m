//
//  DefineAndConst.m
//  CodeExmple
//
//  Created by LIUYONG on 4/9/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//
/**
 *  1、宏可以定义函数、基本数据类型。常量只能定义基本数据类型
 *  2、宏不进行类型检查，重复定义会进行替换。常量能进行类型检查，重复定义会有警告
 */
#import "DefineAndConst.h"

@implementation DefineAndConst
NSString * const kUserName = @"ljy";
@end
