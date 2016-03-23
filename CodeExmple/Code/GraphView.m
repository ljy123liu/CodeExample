//
//  GraphView.m
//  CodeExmple
//
//  Created by LIUYONG on 3/21/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "GraphView.h"
/**
 *  Cored Graphics绘制
 */
@interface GraphView()

@property (nonatomic, readwrite, strong) NSMutableArray *values;
@property (nonatomic, readwrite, strong) dispatch_source_t timer;
@end



@implementation GraphView
const CGFloat kXScale = 5.0;
const CGFloat kYScale = 100.0;

static inline CGAffineTransform
CGAffineTransformMakeScaleTranslate(CGFloat sx, CGFloat sy,
                                    CGFloat dx, CGFloat dy) {
    return CGAffineTransformMake(sx, 0.f, 0.f, sy, dx, dy);

}

- (void)awakeFromNib {
    [self setContentMode:UIViewContentModeRight];
    self.values = [NSMutableArray array];
    
    __weak id weakSelf = self;
    double delayInSeconds = 0.25;
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), (unsigned)(delayInSeconds * NSEC_PER_SEC), 0);
    
    dispatch_source_set_event_handler(self.timer, ^{

    });
    dispatch_resume(self.timer);
}

- (void)updateValues {
    
}































@end
