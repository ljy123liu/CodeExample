//
//  SpliceCircleUI.m
//  CodeExmple
//
//  Created by LIUYONG on 2/19/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "SpliceCircleUI.h"

@implementation SpliceCircleUI

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {

//        [self.stepper1 addTarget:self action:@selector(stepperVauleChange) forControlEvents:UIControlEventValueChanged];
//        [self.stepper2 addTarget:self action:@selector(stepperVauleChange) forControlEvents:UIControlEventValueChanged];
//        self.count1.text = [NSString stringWithFormat:@"%f",self.stepper1.value];
        
    }
    return self;
}

- (IBAction)stepperValueChanged:(UIStepper *)sender {
    self.count1.text = [NSString stringWithFormat:@"数量：%ld",(long)self.stepper1.value];
}

- (IBAction)stepper2ValueChanged:(UIStepper *)sender {
    self.count2.text = [NSString stringWithFormat:@"数量：%ld",(long)self.stepper2.value];
}
@end
