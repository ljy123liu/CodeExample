//
//  DataSource.h
//  CodeExmple
//
//  Created by LIUYONG on 2/27/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject
@property (nonatomic, strong)NSString *value;
+ (DataSource *)shareDataSource;
- (NSUInteger)addMethodWith:(NSUInteger)a b:(NSUInteger)b;
@end
