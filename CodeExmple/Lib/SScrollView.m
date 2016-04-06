//
//  SScrollView.m
//  testaaaaaaaa
//
//  Created by Samuel on 15/5/26.
//  Copyright (c) 2015年 HCoder. All rights reserved.
//

#import "SScrollView.h"

const float defaultTime=3;

@implementation SScrollView
{
    UILabel *labelForCount;
    
    UIPageControl *pageControls;
    
    NSInteger currentCount;
    
    UIScrollView *preScrollView;
    UIScrollView *currentScrollView;
    UIScrollView *nextScrollView;
//    UIView *preImageView;
//    UIView *currentImageView;
//    UIView *nextImageView;
    
    NSTimer *aniTimer;
}

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        [self commonInitWithFrame:frame];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self commonInitWithFrame:CGRectZero];
        /**
         *  循环开关默认打开
         */
        self.openCirculation = YES;
    }
    
    return self;
}
- (void)setConstantBySubView:(UIView*)view;
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:|[self]|"] options:0 metrics:0 views:NSDictionaryOfVariableBindings(self)]];
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[self]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(self)]];
}
- (void)commonInitWithFrame:(CGRect)frame
{
    self.maximumZoomScale = 3.;
    self.minimumZoomScale = 1.;
    /**
     *  初始化空间布局
     */
    self.scrollViews = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.scrollViews.showsHorizontalScrollIndicator = NO;
    self.scrollViews.showsVerticalScrollIndicator = NO;
    self.scrollViews.pagingEnabled = YES;
    self.scrollViews.delegate = self;
    self.scrollViews.contentSize = CGSizeMake(self.frame.size.width*3, self.frame.size.height);
    self.scrollViews.contentOffset = CGPointMake(self.frame.size.width, 0);
    [self.scrollViews setBackgroundColor: [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    preScrollView = [[UIScrollView alloc]initWithFrame:self.scrollViews.frame];
    currentScrollView = [[UIScrollView alloc]initWithFrame:self.scrollViews.frame];
    nextScrollView = [[UIScrollView alloc]initWithFrame:self.scrollViews.frame];
    preScrollView.delegate = self;
    currentScrollView.delegate = self;
    nextScrollView.delegate = self;
//    preImageView = [[UIView alloc]initWithFrame:self.scrollViews.frame];
//    currentImageView = [[UIView alloc]initWithFrame:self.scrollViews.frame];
//    nextImageView = [[UIView alloc]initWithFrame:self.scrollViews.frame];
//    preImageView.frame = currentImageView.frame = nextImageView.frame = self.scrollViews.frame;
//    [preScrollView addSubview:preImageView];
//    [preScrollView setContentSize:preImageView.bounds.size];
//    [currentScrollView addSubview:currentImageView];
//    [currentScrollView setContentSize:currentImageView.bounds.size];
//    [nextScrollView addSubview:nextImageView];
//    [nextScrollView setContentSize:nextImageView.bounds.size];
    [currentScrollView setCenter:CGPointMake(CGRectGetWidth(currentScrollView.frame)*1.5, currentScrollView.center.y)];
    [nextScrollView setCenter:CGPointMake(CGRectGetWidth(nextScrollView.frame)*2.5, nextScrollView.center.y)];
    [self.scrollViews addSubview:preScrollView];
    [self.scrollViews addSubview:currentScrollView];
    [self.scrollViews addSubview:nextScrollView];
    
//    [currentImageView setCenter:CGPointMake(CGRectGetWidth(currentImageView.frame)*1.5, currentImageView.center.y)];
//    [nextImageView setCenter:CGPointMake(CGRectGetWidth(nextImageView.frame)*2.5, nextImageView.center.y)];
//    [self.scrollViews addSubview:preImageView];
//    [self.scrollViews addSubview:currentImageView];
//    [self.scrollViews addSubview:nextImageView];
    [self addSubview:self.scrollViews];
    /**
     *  点击事件
     *
     *  @param tapViews:
     *
     *  @return
     */
    UITapGestureRecognizer *taps = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapViews:)];
    [self.scrollViews addGestureRecognizer:taps];
}

- (void)setCanZoom:(BOOL)canZoom {
    _canZoom = canZoom;
    preScrollView.minimumZoomScale = self.minimumZoomScale;
    preScrollView.maximumZoomScale = self.maximumZoomScale;
    currentScrollView.minimumZoomScale = self.minimumZoomScale;
    currentScrollView.maximumZoomScale = self.maximumZoomScale;
    nextScrollView.minimumZoomScale = self.minimumZoomScale;
    nextScrollView.maximumZoomScale = self.maximumZoomScale;
}

- (void)setMaximumZoomScale:(float)maximumZoomScale {
    _maximumZoomScale = maximumZoomScale;
    preScrollView.maximumZoomScale = self.maximumZoomScale;
    currentScrollView.maximumZoomScale = self.maximumZoomScale;
    nextScrollView.maximumZoomScale = self.maximumZoomScale;
}

- (void)setMinimumZoomScale:(float)minimumZoomScale {
    _minimumZoomScale = minimumZoomScale;
    preScrollView.minimumZoomScale = self.minimumZoomScale;
    currentScrollView.minimumZoomScale = self.minimumZoomScale;
    nextScrollView.minimumZoomScale = self.minimumZoomScale;
}

- (void)setDelegate:(NSObject<SScrollViewDelegate> *)delegate
{
    _delegate = delegate;
    [self afterDelegateSetting];
}

- (void)afterDelegateSetting
{
    /**
     *  代理设置（包括重载）
     */
    currentCount = 0;
    /**
     *  加载初始的三张图
     */
    UIView *one;
    UIView *two;
    UIView *three;
    if ([self.delegate numberOfSScrollView:self]<3) {
        /**
         *  小于三张的情况
         */
        if ([self.delegate numberOfSScrollView:self]==1) {
            one = [self.delegate SScrollView:self viewForRowAtIndex:0];
            two = [self.delegate SScrollView:self viewForRowAtIndex:0];
            three = [self.delegate SScrollView:self viewForRowAtIndex:0];
        }
        else if([self.delegate numberOfSScrollView:self]==2)
        {
            two =  [self.delegate SScrollView:self viewForRowAtIndex:0];
            one = [self.delegate SScrollView:self viewForRowAtIndex:1];
            three = [self.delegate SScrollView:self viewForRowAtIndex:1];
        }
        else
        {
            return;
        }
    }
    else
    {
        one = [self.delegate SScrollView:self viewForRowAtIndex:[self.delegate numberOfSScrollView:self]-1];
        two = [self.delegate SScrollView:self viewForRowAtIndex:0];
        three = [self.delegate SScrollView:self viewForRowAtIndex:1];
    }
    if(self.isFixScreen)
    {
        one.frame = two.frame = three.frame = self.scrollViews.frame;
    }
    else
    {
        [self setImageViewFrameByImageWithView:one];
        [self setImageViewFrameByImageWithView:two];
        [self setImageViewFrameByImageWithView:three];
    }
//    [preImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    [currentImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    [nextImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    [preImageView addSubview:one];
//    [currentImageView addSubview:two];
//    [nextImageView addSubview:three];
    
    [preScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [currentScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [nextScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [preScrollView addSubview:one];
    [currentScrollView addSubview:two];
    [nextScrollView addSubview:three];
    
    
    if (self.whichhintWay>0) {
        [self creathitWay];
    }
    if (self.openAutomaticRoll == YES) {
        [self creatTimer];
    }
}
- (void)setImageViewFrameByImageWithView:(UIView*)view
{
    if ([view isKindOfClass:[UIImageView class]]) {
        UIImageView *gets = (UIImageView*)view;
        CGSize iSize ;
        iSize.width = (gets.image.size.width>CGRectGetWidth(self.frame))?CGRectGetWidth(self.frame):gets.image.size.width;
        iSize.height = (gets.image.size.height>CGRectGetHeight(self.frame))?CGRectGetHeight(self.frame):gets.image.size.height;
        [gets setFrame:CGRectMake(gets.frame.origin.x, gets.frame.origin.y, iSize.width, iSize.height)];
    }
    else
    {
        for (UIView *getView in view.subviews) {
            if ([getView isKindOfClass:[UIImageView class]]) {
                UIImageView *gets = (UIImageView*)getView;
                CGSize iSize ;
                iSize.width = (gets.image.size.width>CGRectGetWidth(self.frame))?CGRectGetWidth(self.frame):gets.image.size.width;
                iSize.height = (gets.image.size.height>CGRectGetHeight(self.frame))?CGRectGetHeight(self.frame):gets.image.size.height;
                [gets setFrame:CGRectMake(gets.frame.origin.x, gets.frame.origin.y, iSize.width, iSize.height)];
            }
        }
    }
    [view setCenter:self.center];
}
- (void)tapViews:(UITapGestureRecognizer*)sender
{
    /**
     *  点击事件
     *
     */
    if ([self.delegate respondsToSelector:@selector(SScrollView:didSelectRowAtIndex:)]) {
        [self.delegate SScrollView:self didSelectRowAtIndex:currentCount];
    }
}
- (void)reloadData;
{
    [self afterDelegateSetting];
}
- (void)setThePageToIndex:(NSInteger)index;
{
    /**
     *  设置指定index的动态跳转
     */
    float gt = (self.rollTime>0)?self.rollTime:defaultTime;
    /**
     *  开启了定时器
     */
    if ([aniTimer isValid] && self.openAutomaticRoll == YES) {
        [aniTimer setFireDate:[NSDate distantFuture]];
        [self changCurrentCountAndSetting:index];
        [aniTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:gt]];
        return;
    }
    /**
     *  未开启定时器
     */
    [self changCurrentCountAndSetting:index];
}
- (void)changCurrentCountAndSetting:(NSInteger)index
{
    /**
     *  指定index跳转，重新加载view
     */
    currentCount = index;
    UIView *one = [self.delegate SScrollView:self viewForRowAtIndex:[self subOne:currentCount]];
    UIView *two = [self.delegate SScrollView:self viewForRowAtIndex:currentCount];
    UIView *three = [self.delegate SScrollView:self viewForRowAtIndex:[self addOne:currentCount]];
    [self delegatViewSetting:one and:two and:three];
    /**
     *  修改下标
     */
    [self scrollViewDidEndDecelerating:self.scrollViews];
}
#pragma mark -
#pragma mark - HintWay
- (void)setWhichhintWay:(hintWay)whichhintWay
{
    _whichhintWay = whichhintWay;
    /**
     *  下标创建（if防止代理调用和直接调用的冲突）
     */
    if (self.delegate) {
        [self creathitWay];
    }
}
- (void)creathitWay
{
    /**
     *  if用于重载
     */
    if (pageControls) {
        [pageControls removeFromSuperview];
        pageControls = nil;
    }
    if (labelForCount) {
        [labelForCount removeFromSuperview];
        labelForCount = nil;
    }
    /**
     *  创建下标(超过10个数据源强制选择number显示)
     */
    if (self.whichhintWay == pageContrils  && [self.delegate numberOfSScrollView:self]<=10) {
        pageControls = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.frame.size.height-36, self.frame.size.width, 36)];
        pageControls.numberOfPages = [self.delegate numberOfSScrollView:self];
        pageControls.currentPage = 0;
        [pageControls addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        pageControls.userInteractionEnabled = YES;
        
        pageControls.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        pageControls.pageIndicatorTintColor = [UIColor darkGrayColor];
        
        [self addSubview:pageControls];
    }
    else //if(self.whichhintWay == numberShow && !labelForCount)
    {
        labelForCount = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-50, self.frame.size.height-30, 40, 20)];
        labelForCount.textColor = [UIColor whiteColor];
        labelForCount.textAlignment = NSTextAlignmentCenter;
        labelForCount.font = [UIFont systemFontOfSize:11];
        labelForCount.backgroundColor = [UIColor blackColor];
        labelForCount.alpha = .5;
        labelForCount.layer.masksToBounds = YES;
        labelForCount.layer.cornerRadius = 3;
        labelForCount.text = [NSString stringWithFormat:@"1/%ld",(long)[self.delegate numberOfSScrollView:self]];
        [self addSubview:labelForCount];
    }
}
- (void)changePage:(id)sender
{
    /**
     *  UIPageControl主动点击事件
     */
    CGRect rect = self.scrollViews.frame;
    rect.origin.x = 2 * self.scrollViews.frame.size.width;
    rect.origin.y = 0;
    [self.scrollViews scrollRectToVisible:rect animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    /**
     *  每次滚动结束修改下标
     */
    if (labelForCount) {
        labelForCount.text = [NSString stringWithFormat:@"%ld/%ld",(long)currentCount+1,(long)[self.delegate numberOfSScrollView:self]];
    }
    if (pageControls) {
        pageControls.currentPage = currentCount;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(SScrollView:didScrollRowAtIndex:)]) {
        [self.delegate SScrollView:self didScrollRowAtIndex:currentCount+1];
    }
}


#pragma mark -
#pragma mark - Scroll
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    if (![scrollView isEqual:self.scrollViews]) {
        return;
    }
    float offset = self.scrollViews.contentOffset.x;
    UIView *one;
    UIView *two;
    UIView *three;
    /**
     *  向下一个移动
     */
    if(offset >= scrollView.bounds.size.width * 2){
        one = [self.delegate SScrollView:self viewForRowAtIndex:currentCount];
        currentCount = [self addOne:currentCount];
        two = [self.delegate SScrollView:self viewForRowAtIndex:currentCount];
        three = [self.delegate SScrollView:self viewForRowAtIndex:[self addOne:currentCount]];
    }
    /**
     *  向前一个移动
     */
    if (offset <= 0) {
        three = [self.delegate SScrollView:self viewForRowAtIndex:currentCount];
        currentCount = [self subOne:currentCount];
        two = [self.delegate SScrollView:self viewForRowAtIndex:currentCount];
        one = [self.delegate SScrollView:self viewForRowAtIndex:[self subOne:currentCount]];
    }
    if (self.openCirculation && [self addOne:currentCount]!=[self.delegate numberOfSScrollView:self]-1) {
        [self delegatViewSetting:one and:two and:three];
    }
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    for (UIView *subview in scrollView.subviews){
        CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?(scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;
        CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?(scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;
        subview.center = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
    }
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.scrollViews]) {
        return nil;
    }
    for (UIImageView *subview in scrollView.subviews){
        if ([subview isKindOfClass:[UIView class]]) {
            return subview;
        }
    }
    return nil;
    
    //    return mybkScrollView; //返回ScrollView上添加的需要缩放的视图
}
- (void)delegatViewSetting:(UIView*)one and:(UIView*)two and:(UIView*)three
{
    if(self.isFixScreen)
    {
        one.frame = two.frame = three.frame = self.scrollViews.frame;
    }
    else
    {
        [self setImageViewFrameByImageWithView:one];
        [self setImageViewFrameByImageWithView:two];
        [self setImageViewFrameByImageWithView:three];
    }
    preScrollView.zoomScale = 1.;
    currentScrollView.zoomScale = 1.;
    nextScrollView.zoomScale = 1.;
    [preScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [currentScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [nextScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [preScrollView addSubview:one];
    [currentScrollView addSubview:two];
    [nextScrollView addSubview:three];
    self.scrollViews.contentOffset = CGPointMake(self.scrollViews.frame.size.width, 0);
}
- (NSInteger)addOne:(NSInteger)ins
{
    NSInteger i = ins +1;
    if (i == [self.delegate numberOfSScrollView:self]) {
        i = 0;
    }
    return i;
}
- (NSInteger)subOne:(NSInteger)ins
{
    NSInteger i = ins -1;
    if (i <0) {
        i = [self.delegate numberOfSScrollView:self]-1;
    }
    return i;
}


#pragma mark -
#pragma mark - Timer
- (void)setOpenAutomaticRoll:(BOOL)openAutomaticRoll
{
    _openAutomaticRoll = openAutomaticRoll;
    /**
     *  开启和关闭计时器
     */
    if (openAutomaticRoll == YES) {
        if (![aniTimer isValid]) {
            [self creatTimer];
        }
        else
        {
            float gt = (self.rollTime>0)?self.rollTime:defaultTime;
            [aniTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:gt]];
        }
    }
    if (openAutomaticRoll == NO && [aniTimer isValid]) {
        [aniTimer setFireDate:[NSDate distantFuture]];
    }
}
- (void)creatTimer
{
    /**
     *  创建计时器（if用于重载）
     */
    float gt = (self.rollTime>0)?self.rollTime:defaultTime;
    if ([aniTimer isValid]) {
        [aniTimer setFireDate:[NSDate distantFuture]];
        [aniTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:gt]];
        return;
    }
    aniTimer = [NSTimer scheduledTimerWithTimeInterval:gt
                                                target:self
                                              selector:@selector(aniTimerDidFired:)
                                              userInfo:nil
                                               repeats:YES];
    [aniTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:gt]];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    /**
     *  手动滑动时防治自动滚动（if判断是否打开）
     */
    if (self.openAutomaticRoll == YES) {
        if (![aniTimer isValid]) {
            return ;
        }
        [aniTimer setFireDate:[NSDate distantFuture]];
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    /**
     *  手动滑动时防治自动滚动（if判断是否打开）
     */
    if (self.openAutomaticRoll == YES) {
        float gt = (self.rollTime>0)?self.rollTime:defaultTime;
        if (![aniTimer isValid]) {
            return ;
        }
        [aniTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:gt]];
    }
}

- (void)aniTimerDidFired:(NSTimer*)sender
{
    /**
     *  执行自动滚动
     *
     */
    CGPoint newOffset = CGPointMake(self.scrollViews.contentOffset.x + CGRectGetWidth(self.scrollViews.frame), self.scrollViews.contentOffset.y);
    [self.scrollViews setContentOffset:newOffset animated:YES];
    
//    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"HH:mm:ss"];
//    //NSLog(@"%@",[formatter stringFromDate:[NSDate date]]);
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{
    /**
     *  自动滚动结束修改下标
     */
    [self scrollViewDidEndDecelerating:self.scrollViews];
}
@end

