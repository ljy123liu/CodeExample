//
//  HideNavBarAndTabBarViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/19/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "HideNavBarAndTabBarViewController.h"
@interface HideNavBarAndTabBarViewController ()<UIScrollViewDelegate>

@end

@implementation HideNavBarAndTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT)];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT+300);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    UIView *TestView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    TestView.backgroundColor = [UIColor redColor];
    [scrollView addSubview:TestView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static float lastOffY  = 0;
    float curOffY = scrollView.contentOffset.y;
    
    if (scrollView.frame.size.height >= scrollView.contentSize.height ||      //内容高度低于scrollView高度，不隐藏
        fabs(curOffY) + SCREEN_SIZE_HEIGHT > scrollView.contentSize.height || //拉至最底部时，不做处理
        curOffY < 0                                                           //拉至最顶部时，不做处理
        )
    {
        return;
    }
    if (curOffY - lastOffY > 40)
    {
        //向上
        lastOffY = curOffY;
        [self hideTabBar];
        
    }
    else if(lastOffY -curOffY >40)
    {
        //向下
        lastOffY = curOffY;
        [self showTabBar];
    }
}


- (void)showTabBar
{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    
    contentView.frame = CGRectMake(contentView.bounds.origin.x,
                                   contentView.bounds.origin.y,
                                   contentView.bounds.size.width,
                                   contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    
    CATransition *animation = [CATransition animation];
    animation.duration = 0.4f;
    animation.type = kCATransitionMoveIn;
    animation.subtype = kCATransitionFromTop;
    self.tabBarController.tabBar.hidden = NO;
    [self.tabBarController.tabBar.layer addAnimation:animation forKey:@"animation2"];
    
    CATransition *animation1 = [CATransition animation];
    animation1.duration = 0.4f;
    animation1.type = kCATransitionMoveIn;
    animation1.subtype = kCATransitionFromBottom;
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController.navigationBar.layer addAnimation:animation1 forKey:@"animation3"];
    
}

- (void)hideTabBar
{
    if (self.tabBarController.tabBar.hidden == YES)
    {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,
                                   contentView.bounds.origin.y,
                                   contentView.bounds.size.width,
                                   contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    
    CATransition *animation1 = [CATransition animation];
    animation1.timingFunction=UIViewAnimationCurveEaseInOut;
    animation1.duration = 0.4f;
    animation1.delegate =self;
    animation1.type = kCATransitionReveal;
    animation1.subtype = kCATransitionFromTop;
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController.navigationBar.layer addAnimation:animation1 forKey:@"animation0"];
    
    //定义个转场动画
    CATransition *animation = [CATransition animation];
    //转场动画持续时间
    animation.duration = 0.4f;
    //计时函数，从头到尾的流畅度？？？
    animation.timingFunction=UIViewAnimationCurveEaseInOut;
    //转场动画类型
    animation.type = kCATransitionReveal;
    //转场动画子类型
    animation.subtype = kCATransitionFromBottom;
    //动画时你需要的实现
    self.tabBarController.tabBar.hidden = YES;
    //添加动画 （转场动画是添加在层上的动画）
    [self.tabBarController.tabBar.layer addAnimation:animation forKey:@"animation1"];
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
