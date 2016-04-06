//
//  SScrollView.h
//  testaaaaaaaa
//
//  Created by Samuel on 15/5/26.
//  Copyright (c) 2015年 HCoder. All rights reserved.
//

typedef enum
{
    none = 0,
    pageContrils = 1,//
    numberShow = 2,
}hintWay;

#import <UIKit/UIKit.h>




@protocol SScrollViewDelegate;
@interface SScrollView : UIView<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *scrollViews;
@property (nonatomic, strong)NSObject<SScrollViewDelegate> *delegate;




/**
 *  重载数据
 */
- (void)reloadData;
/**
 *  跳转到某个view
 *
 *  @param index
 */
- (void)setThePageToIndex:(NSInteger)index;





/**
 *  是否填充整个屏幕
 */
@property (nonatomic, assign)BOOL isFixScreen;
/**
 *  展示滚动下标(超过10个数据源强制选择number显示)
 */
@property (nonatomic,assign)hintWay whichhintWay;
/**
 *  是否打开循环（还没写）
 */
@property (nonatomic ,assign)BOOL openCirculation;
/**
 *  是否打开自动滚动(默认打开)
 */
@property (nonatomic ,assign)BOOL openAutomaticRoll;
/**
 *  滚动时间
 */
@property (nonatomic ,assign)float rollTime;
/**
 *  是否打开放大
 */
@property (nonatomic, assign)BOOL canZoom;
/**
 *  最小放大值
 */
@property (nonatomic, assign)float minimumZoomScale;
/**
 *  最大放大值
 */
@property (nonatomic, assign)float maximumZoomScale;

/**
 *  添加约束
 */
- (void)setConstantBySubView:(UIView*)view;
@end




@protocol SScrollViewDelegate <NSObject>

@required
/**
 *  数量
 *
 *  @param sScrollView
 *
 *  @return
 */
- (NSInteger)numberOfSScrollView:(SScrollView *)sScrollView;
/**
 *  view的尺寸由self的frame决定，点击事件加在scrollView 上，传入view可自带手势
 *
 *  @param sScrollView self
 *  @param index
 *
 *  @return view
 */
- (UIView *)SScrollView:(SScrollView *)sScrollView viewForRowAtIndex:(NSInteger)index;

@optional
- (void)SScrollView:(SScrollView *)sScrollView didSelectRowAtIndex:(NSInteger)index;
- (void)SScrollView:(SScrollView *)sScrollView didScrollRowAtIndex:(NSInteger)index;
@end






