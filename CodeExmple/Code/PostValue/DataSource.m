//
//  DataSource.m
//  CodeExmple
//
//  Created by LIUYONG on 2/27/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "DataSource.h"
static DataSource *dataSource;
@implementation DataSource
+ (DataSource *)shareDataSource {
    @synchronized(self) {
        
    }
    if (!dataSource) {
//        dataSource = [[DataSource allocWithZone:NULL] init];
        dataSource = [[super alloc] init];
    }
    return dataSource;
}

- (NSUInteger)addMethodWith:(NSUInteger)a b:(NSUInteger)b {
    return a + b;
}

/**
 *  单例
 *
 *  @return
 */
//+(DataSource *)shareDataSource {
//    
//    static DataSource *dataSource = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        dataSource = [DataSource new];
//    });
//    return dataSource;
//}

@end
