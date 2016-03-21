//
//  DrawRectView.m
//  CodeExmple
//
//  Created by LIUYONG on 3/21/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "DrawRectView.h"

@implementation DrawRectView

- (void)drawRect:(CGRect)rect {
    [[UIColor redColor] setFill];
    UIRectFill(CGRectMake(25, 25, 100, 100));
}
@end
