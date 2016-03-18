//
//  OptimizeRoundCornerTableViewCell.m
//  CodeExmple
//
//  Created by LIUYONG on 3/2/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "OptimizeRoundCornerTableViewCell.h"
#import "UIImageView+RoundRect.m"
#import "UIImageView+CornerRadius.h"
@implementation OptimizeRoundCornerTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    UIImageView *button = [[UIImageView alloc]init];
//    [button zy_cornerRadiusRoundingRect];
//    button.frame = CGRectMake(0, 0, 40, 40);
//    button.image = [UIImage imageNamed:@"1"];
//    
//    UIImageView *button2 = [[UIImageView alloc]init];
//    [button2 zy_cornerRadiusRoundingRect];
//    button2.frame = CGRectMake(50, 0, 40, 40);
//    button2.image = [UIImage imageNamed:@"2"];
//
//    UIImageView *button3 = [[UIImageView alloc]init];
//    [button3 zy_cornerRadiusRoundingRect];
//    button3.frame = CGRectMake(100, 0, 40, 40);
//    button3.image = [UIImage imageNamed:@"3"];
//
//    UIImageView *button4 = [[UIImageView alloc]init];
//    [button4 zy_cornerRadiusRoundingRect];
//    button4.frame = CGRectMake(150, 0, 40, 40);
//    button4.image = [UIImage imageNamed:@"4"];
//
//    UIImageView *button5 = [[UIImageView alloc]init];
//    [button5 zy_cornerRadiusRoundingRect];
//    button5.frame = CGRectMake(200, 0, 40, 40);
//    button5.image = [UIImage imageNamed:@"5"];

    
//    UIImageView *button2 = [UIImageView roundedRectInitWithFrame:CGRectMake(50, 0, 40, 40) imageNamed:@"2"];
//    
//    UIImageView *button3 = [UIImageView roundedRectInitWithFrame:CGRectMake(100, 0, 40, 40) imageNamed:@"3"];
//    
//    UIImageView *button4 = [UIImageView roundedRectInitWithFrame:CGRectMake(150, 0, 40, 40) imageNamed:@"4"];
//    
//    UIImageView *button5 = [UIImageView roundedRectInitWithFrame:CGRectMake(200, 0, 40, 40) imageNamed:@"5"];
    
    
    UIImageView *button = [UIImageView roundedRectInitWithFrame:CGRectMake(0, 0, 40, 40) imageNamed:@"1"];
    
    UIImageView *button2 = [UIImageView roundedRectInitWithFrame:CGRectMake(50, 0, 40, 40) imageNamed:@"2"];
    
    UIImageView *button3 = [UIImageView roundedRectInitWithFrame:CGRectMake(100, 0, 40, 40) imageNamed:@"3"];
    
    UIImageView *button4 = [UIImageView roundedRectInitWithFrame:CGRectMake(150, 0, 40, 40) imageNamed:@"4"];

    UIImageView *button5 = [UIImageView roundedRectInitWithFrame:CGRectMake(200, 0, 40, 40) imageNamed:@"5"];
    
    button.backgroundColor = [UIColor blueColor];
    button2.backgroundColor = [UIColor blueColor];
    button3.backgroundColor = [UIColor blueColor];
    button4.backgroundColor = [UIColor blueColor];
    button5.backgroundColor = [UIColor blueColor];
    
    
//    UIImageView *button = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
//    button.image = [[UIImage imageNamed:@"1"] addCornerRadius:20];
//    
//    UIImageView *button2 = [[UIImageView alloc]initWithFrame:CGRectMake(50, 0, 40, 40)];
//    button2.image = [[UIImage imageNamed:@"2"] addCornerRadius:20];
//    
//    UIImageView *button3 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 0, 40, 40)];
//    button3.image = [[UIImage imageNamed:@"3"] addCornerRadius:20];
//    
//    UIImageView *button4 = [[UIImageView alloc]initWithFrame:CGRectMake(150, 0, 40, 40)];
//    button4.image = [[UIImage imageNamed:@"4"] addCornerRadius:20];
//    
//    UIImageView *button5 = [[UIImageView alloc]initWithFrame:CGRectMake(200, 0, 40, 40)];
//    button5.image = [[UIImage imageNamed:@"5"] addCornerRadius:20];
    
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
