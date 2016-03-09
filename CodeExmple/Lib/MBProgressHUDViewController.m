//
//  MBProgressHUDViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 3/4/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "MBProgressHUDViewController.h"
#import "MBProgressHUD.h"
@interface MBProgressHUDViewController ()


@end
/**
 *  MBProgresHUD遮盖哪个区域
 */
typedef NS_ENUM(NSInteger, OccupyThread) {
    /**
     *  window层
     */
    WindowThread,
    /**
     *  self.view
     */
    ViewControllerThread,
    /**
     *  导航栏
     */
    NavigationControllerThread,
    /**
     *  不遮盖
     */
    CentralHUD
};
@implementation MBProgressHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  simple:占导航栏线程
 */
- (IBAction)simpleOccupyNavbar:(UIButton *)sender {
    MBProgressHUD *mbHUD = [[MBProgressHUD alloc]initWithView:self.navigationController.view];
    [self.navigationController.view addSubview:mbHUD];
    [mbHUD show:YES];
    [mbHUD hide:YES afterDelay:3.0];
}

/**
 *  tabbar实际是window
 */
- (IBAction)textOccupyTabbar:(UIButton *)sender {
    MBProgressHUD *mbHUD = [[MBProgressHUD alloc]initWithView:self.tabBarController.view];
    [self.tabBarController.view addSubview:mbHUD];
    mbHUD.labelText = @"占tabbar线程";
    [mbHUD show:YES];
    [mbHUD hide:YES afterDelay:3.0];
}

- (IBAction)window:(UIButton *)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//    [MBProgressHUD showHUDAddedTo:window animated:YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUDForView:window animated:YES];
//    });
//    MBProgressHUD *HUD = [[MBProgressHUD alloc]initWithView:window];
//    [window addSubview:HUD];
//    [HUD show:YES];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUDForView:window animated:YES];
//    });
//    [MBProgressHUD showHUDAddedTo:window animated:YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideHUDForView:window animated:YES];
//    });
    
//    [self HUDShowInThread:WindowThread viewController:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self HUDHideInThread:WindowThread viewController:self];
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}


- (void)HUDShowInThread:(OccupyThread)thread viewController:(UIViewController *)vc {
    
    MBProgressHUD *mbHUD = nil;
    
    switch (thread) {
        case WindowThread:{

            UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//            UIView *windowView = [[UIView alloc]initWithFrame:window.bounds];
//            windowView.tag = 9999;
//            [window addSubview:windowView];
            mbHUD = [[MBProgressHUD alloc]initWithView:window];
            [window addSubview:mbHUD];
        }
            break;
        case ViewControllerThread:{
            
            mbHUD = [[MBProgressHUD alloc]initWithView:vc.view];
            [vc.view addSubview:mbHUD];
        }
            break;
        case NavigationControllerThread:{
            
            mbHUD = [[MBProgressHUD alloc]initWithView:vc.navigationController.view];
            [vc.navigationController.view addSubview:mbHUD];
        }
            break;
        case CentralHUD:{
            
            UIView *backGround = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
            backGround.tag = 9986;
            backGround.center = vc.view.center;
            [vc.view addSubview:backGround];
            mbHUD = [[MBProgressHUD alloc]initWithView:backGround];
            [backGround addSubview:mbHUD];
        }
        default:
            break;
    }
    
    [mbHUD show:YES];
}

- (void)HUDHideInThread:(OccupyThread)thread viewController:(UIViewController *)vc {
    
    switch (thread) {
        case WindowThread:{
//            UIView *tabView = [self.tabBarController.view viewWithTag:9985];
//            [MBProgressHUD hideHUDForView:self.tabBarController.view animated:YES];
//            [tabView removeFromSuperview];
            
//            UIWindow *window = [[UIApplication sharedApplication] keyWindow];
//            UIView *windowView = (UIView *)[window viewWithTag:9999];
//            [MBProgressHUD hideHUDForView:windowView animated:YES];
//            [windowView removeFromSuperview];
            UIWindow *window = [[UIApplication sharedApplication] keyWindow];
            [MBProgressHUD hideHUDForView:window animated:YES];
        }
            break;
        case ViewControllerThread:{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
            break;
        case NavigationControllerThread:{
            [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
        }
            break;
        case CentralHUD:{
            [MBProgressHUD hideHUDForView:vc.view animated:YES];
                UIView *backGround = [vc.view viewWithTag:9986];
                [backGround removeFromSuperview];
        }
            break;
        default:
            break;
    }
    
}




@end
