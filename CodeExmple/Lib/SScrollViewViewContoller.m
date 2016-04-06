
//
//  SScrollViewViewContoller.m
//  CodeExmple
//
//  Created by LIUYONG on 4/5/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "SScrollViewViewContoller.h"
#import "SScrollView.h"
@interface SScrollViewViewContoller () <SScrollViewDelegate>
@property (strong, nonatomic) SScrollView *sscrollView;
@property (strong, nonatomic) NSArray *dataArray;
@end
@implementation SScrollViewViewContoller

#pragma mark - Life Cycle
- (void)viewDidLoad {
    
    self.navigationItem.title = @"轮播图";
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.sscrollView.delegate = self;
}

#pragma mark - Setter And Getter
-(SScrollView *)sscrollView {
    
    if (!_sscrollView) {
        _sscrollView = [[SScrollView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT / 4)];
        [_sscrollView setOpenAutomaticRoll:YES];
        _sscrollView.isFixScreen = YES;
        [self.view addSubview:_sscrollView];
    }
    return _sscrollView;
}

-(NSArray *)dataArray {
    
    if (!_dataArray) {
        _dataArray = @[@"1",@"2",@"3"];
    }
    return _dataArray;
}

#pragma mark - SScrollViewDelegate
- (NSInteger)numberOfSScrollView:(SScrollView *)sScrollView {
    
    return self.dataArray.count;
}

- (UIView *)SScrollView:(SScrollView *)sScrollView viewForRowAtIndex:(NSInteger)index {
    
    UIImageView *imageView;
//    for (int i = 0 ; i < self.dataArray.count; i++) {
        imageView = [[UIImageView alloc] init];
        imageView.size = CGSizeMake(SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT / 4);
//        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
//    }
    if (index == 0) {
        imageView.backgroundColor = [UIColor redColor];
    }else if (index == 1) {
        imageView.backgroundColor= [UIColor yellowColor];
    }else if (index == 2) {
        imageView.backgroundColor= [UIColor blueColor];
    }
    return imageView;
}

- (void)injected{

    
}
@end
