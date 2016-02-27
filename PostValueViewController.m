//
//  PostValueViewController.m
//  CodeExmple
//
//  Created by LIUYONG on 2/26/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import "PostValueViewController.h"
#import "PostValue2ViewController.h"
@interface PostValueViewController ()<postValueDelegate>
@property (weak, nonatomic) IBOutlet UIButton *delegateLabel;
@property (weak, nonatomic) IBOutlet UIButton *blockLabel;
@property (weak, nonatomic) IBOutlet UIButton *notificationCenter;
@property (weak, nonatomic) IBOutlet UIButton *userDefaultLabel;
@property (weak, nonatomic) IBOutlet UIButton *singletonLabel;
@property (weak, nonatomic) IBOutlet UIButton *KVOLabel;
@property (strong,nonatomic) PostValue2ViewController *vc;
@end

@implementation PostValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"页面传值";
}
- (IBAction)delegateNext:(UIButton *)sender {
    self.vc = [PostValue2ViewController new];
    //设置代理
    self.vc.delegate = self;
    [self.navigationController pushViewController:self.vc animated:YES];
}

- (IBAction)blockNext:(UIButton *)sender {
    self.vc = [PostValue2ViewController new];
    //block
    @weakify(self);
    self.vc.textBlock = ^(NSString *str){
        @strongify(self);
        [self.blockLabel setTitle:str forState:UIControlStateNormal];
    };
    [self.navigationController pushViewController:self.vc animated:YES];
}

- (IBAction)notificationCenter:(UIButton *)sender {
    self.vc = [PostValue2ViewController new];
    //1.通知中心，传值方式一：
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCenterLabel:) name:@"notificationCenter" object:nil];
    
    //2.通知中心，传值方式二：
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"notificationCenter" object:nil queue:queue usingBlock:^(NSNotification * _Nonnull note) {
        [self.notificationCenter setTitle:note.userInfo[@"str"] forState:UIControlStateNormal];
    }];
    [self.navigationController pushViewController:self.vc animated:YES];
}

- (IBAction)KVO:(UIButton *)sender {
    self.vc = [PostValue2ViewController new];
    //KVO
    [self.vc addObserver:self forKeyPath:@"KVO" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:nil];
    [self.navigationController pushViewController:self.vc animated:YES];
}

- (IBAction)NSUserDefaultNext:(UIButton *)sender {
    self.vc = [PostValue2ViewController new];
    [self.navigationController pushViewController:self.vc animated:YES];
}

- (IBAction)singletonNext:(UIButton *)sender {
    self.vc = [PostValue2ViewController new];
    [self.navigationController pushViewController:self.vc animated:YES];
}

/**
 *  代理
 *
 *  @param text
 */
-(void)changeLabelText:(NSString *)text {
    [self.delegateLabel setTitle:text forState:UIControlStateNormal];
}

/**notification
 *  通知中心
 *
 *  @param notification
 */
- (void)notificationCenterLabel:(NSNotification *)notification {
    [self.notificationCenter setTitle:notification.userInfo[@"str"] forState:UIControlStateNormal] ;
    
}

/**
 *  KVO
 */
- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
    if ([keyPath isEqualToString:@"KVO"]) {
        [self.KVOLabel setTitle:self.vc.KVO forState:UIControlStateNormal];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"notificationCenter" object:nil];
    LLog(@"PostValue1 dealloc");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
