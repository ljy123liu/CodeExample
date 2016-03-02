//
//  buttonTableViewCell.m
//  CodeExmple
//
//  Created by LIUYONG on 3/1/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "buttonTableViewCell.h"

@implementation buttonTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    [self.sButton setBackgroundImage:[UIImage imageNamed:@"0"] forState:UIControlStateHighlighted];
//    
//    
//    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    button.backgroundColor = [UIColor lightGrayColor];
    [button setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    button.layer.cornerRadius = 20;
    button.clipsToBounds = YES;
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(50, 0, 40, 40)];
    button2.backgroundColor = [UIColor lightGrayColor];
    [button2 setBackgroundImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    button2.layer.cornerRadius = 20;
    button2.clipsToBounds = YES;
    
    UIButton *button3 = [[UIButton alloc]initWithFrame:CGRectMake(100, 0, 40, 40)];
    button3.backgroundColor = [UIColor lightGrayColor];
    [button3 setBackgroundImage:[UIImage imageNamed:@"3"] forState:UIControlStateNormal];
    button3.layer.cornerRadius = 20;
    button3.clipsToBounds = YES;
    
    UIButton *button4 = [[UIButton alloc]initWithFrame:CGRectMake(150, 0, 40, 40)];
    button4.backgroundColor = [UIColor lightGrayColor];
    [button4 setBackgroundImage:[UIImage imageNamed:@"4"] forState:UIControlStateNormal];
    button4.layer.cornerRadius = 20;
    button4.clipsToBounds = YES;
    
    
    UIButton *button5 = [[UIButton alloc]initWithFrame:CGRectMake(200, 0, 40, 40)];
    button5.backgroundColor = [UIColor lightGrayColor];
    [button5 setBackgroundImage:[UIImage imageNamed:@"5"] forState:UIControlStateNormal];
    button5.layer.cornerRadius = 20;
    button5.clipsToBounds = YES;
    
    [self addSubview:button];
    [self addSubview:button2];
    [self addSubview:button3];
    [self addSubview:button4];
    [self addSubview:button5];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
