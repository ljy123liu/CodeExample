//
//  UIViewAutoAdaptToScreenController.m
//  CodeExmple
//
//  Created by LIUYONG on 16/6/17.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "UIViewAutoAdaptToScreenController.h"
#import "UIButton+SelectedType.h"
@interface UIViewAutoAdaptToScreenController ()

@end
#define DEF_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

@implementation UIViewAutoAdaptToScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"1.放大快乐",@"2.大家看",@"3.引发",@"4.减肥咯儿童",@"5.杰里科附近卡",@"6.副卡了",@"7.加快放辣椒",@"8.的老骥伏枥大",@"9.的老骥伏枥大房间里卡的房间看啦",@"10.的老骥伏枥大的接口发掘",@"11.飞机啊可怜",@"12.发",@"13.发放发"];
    [self initButtonsWithOriginX:15 originY:100 spaceX:10 spaceY:20 font:12 titleColor:[UIColor blueColor] cornerRadius:3.0 borderWidth:0.5 borderColor:[UIColor redColor] titles:titles];
}

- (void)initButtonsWithOriginX:(CGFloat)originX
                       originY:(CGFloat)originY
                        spaceX:(CGFloat)spaceX
                        spaceY:(CGFloat)spaceY
                          font:(CGFloat)font
                    titleColor:(UIColor *)titleColor
                  cornerRadius:(CGFloat)cornerRadius
                   borderWidth:(CGFloat)borderWidth
                   borderColor:(UIColor *)borderColor
                        titles:(NSArray *)titles {
    
    for (int i = 0; i < titles.count; i++) {
        CGSize titleSize = [titles[i] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        UIButton *preBtn = [self.view viewWithTag:i+100-1];
        
        CGFloat preBtnMaxX = CGRectGetMaxX(preBtn.frame);
        CGFloat preBtnMinY = CGRectGetMinY(preBtn.frame);
        CGFloat spaceX1 = spaceX;
        CGFloat spaceY1 = spaceY;
        
        if (i == 0) {
            spaceX1 = originX;
        }else {
            originY = 0;
        }
        
        CGFloat currentX = preBtnMaxX + spaceX1;
        CGFloat currentY = preBtnMinY;
        
        if (preBtnMaxX + spaceX1 + titleSize.width > DEF_SCREEN_WIDTH) {
            currentX = originX;
            currentY = preBtnMinY + titleSize.height + spaceY1;
        }
        
        UIButton *button = [UIButton initRoundRectButtonWithFrame:CGRectMake(currentX, currentY + originY, titleSize.width + 5, titleSize.height+5) title:titles[i] titleFont:12 titleColor:[UIColor blueColor] cornerRadius:3 borderWidth:1 borderColor:[UIColor redColor]];
        button.tag = i + 100;
        [self.view addSubview:button];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
