//
//  DataSource.m
//  CodeExmple
//
//  Created by LIUYONG on 2/27/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

+(DataSource *)shareDataSource {
    static DataSource *dataSource = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataSource = [DataSource new];
    });
    return dataSource;
}
@end
