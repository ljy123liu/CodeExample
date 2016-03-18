//
//  buttonTableViewCell.m
//  CodeExmple
//
//  Created by LIUYONG on 3/1/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "buttonTableViewCell.h"
#import "UIImageView+RoundRect.h"
@implementation buttonTableViewCell

- (void)awakeFromNib {

    UIImageView *button = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    button.image = [UIImage imageNamed:@"1"];
    button.layer.cornerRadius = 20;
    button.clipsToBounds = YES;
    
    UIImageView *button2 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 0, 40, 40)];
    button2.image = [UIImage imageNamed:@"2"];
    button2.layer.cornerRadius = 20;
    button2.clipsToBounds = YES;
    
    UIImageView *button3 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 0, 40, 40)];
    button3.image = [UIImage imageNamed:@"3"];
    button3.layer.cornerRadius = 20;
    button3.clipsToBounds = YES;
    
    UIImageView *button4 = [[UIImageView alloc]initWithFrame:CGRectMake(150, 0, 40, 40)];
    button4.image = [UIImage imageNamed:@"4"];
    button4.layer.cornerRadius = 20;
    button4.clipsToBounds = YES;
    
    
    UIImageView *button5 = [[UIImageView alloc]initWithFrame:CGRectMake(200, 0, 40, 40)];
    button5.image = [UIImage imageNamed:@"5"];
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
