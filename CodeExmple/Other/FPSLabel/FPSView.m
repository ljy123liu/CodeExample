//
//  FPSView.m
//  CodeExmple
//
//  Created by LIUYONG on 3/1/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "FPSView.h"

@implementation FPSView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)selectedButton:(UIButton *)sender {
    LLog(@"selected");
    if (sender.selected == YES) {
        sender.selected = NO;
    }else {
        sender.selected = YES;
    }
    
}

@end
