//
//  ImageViewerViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/28/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "ImageViewerViewController.h"

@interface ImageViewerViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *centerImageView;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, assign) NSInteger imageCount;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation ImageViewerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.imageCount = 6;
    [self configureUI];
    [self setDefaultImage];
}

- (void)configureUI {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(SCREEN_SIZE_WIDTH * self.imageCount, SCREEN_SIZE_HEIGHT);
    [self.scrollView setContentOffset:CGPointMake(SCREEN_SIZE_WIDTH, 0) animated:NO];
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    self.pageControl = [UIPageControl new];
    self.pageControl.center = CGPointMake(SCREEN_SIZE_WIDTH/2, 350);
    self.pageControl.tintColor = [UIColor redColor];
    self.pageControl.numberOfPages = self.imageCount;
    
    self.pageControl.currentPage = self.index;
    [self.view addSubview:self.pageControl];
    
    self.leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT - 49 - 64)];
    [self.scrollView addSubview:self.leftImageView];
    
    self.centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_SIZE_WIDTH, 64, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT - 49 - 64)];
    [self.scrollView addSubview:self.centerImageView];
    
    self.rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_SIZE_WIDTH * 2, 64, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT - 49 - 64)];
    [self.scrollView addSubview:self.rightImageView];
}

- (void)setDefaultImage {
    
    self.leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",self.imageCount - 1]];
    self.centerImageView.image = [UIImage imageNamed:@"0"];
    self.rightImageView.image = [UIImage imageNamed:@"1"];
}

- (void)reloadImage {
    
    NSInteger leftImageIndex,rightImageIndex;
    CGPoint offset = [self.scrollView contentOffset];
    //向右滑
    if (offset.x > SCREEN_SIZE_WIDTH) {
        self.index = (self.index + 1) % self.imageCount;
    }else if (offset.x < SCREEN_SIZE_WIDTH ) {
        //向左滑
        self.index = (self.index + self.imageCount - 1) % self.imageCount;
    }
    self.centerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",self.index]];
    
    //重新设置左右图片
    leftImageIndex = (self.index + self.imageCount - 1) % self.imageCount;
    rightImageIndex = (self.index + 1) % self.imageCount;
    self.leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",leftImageIndex]];
    self.rightImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",rightImageIndex]];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self reloadImage];
    
    [self.scrollView setContentOffset:CGPointMake(SCREEN_SIZE_WIDTH, 0)];
    
    self.pageControl.currentPage = self.index;
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
