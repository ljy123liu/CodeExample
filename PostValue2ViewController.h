//
//  PostValue2ViewController.h
//  CodeExmple
//
//  Created by LIUYONG on 2/26/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  代理协议
 */
@protocol postValueDelegate
@optional
- (void)changeLabelText:(NSString *)text;
@end

/**
 *  block定义
 *
 *  @param str <#str description#>
 */
typedef void(^postValueBlock)(NSString *str);
@interface PostValue2ViewController : UIViewController
/**
 *  代理
 */
@property (nonatomic, weak) id <postValueDelegate>delegate;

/**
 *  block
 */
@property (nonatomic, copy) postValueBlock textBlock;
/**
 *  KVO
 */
@property (weak, nonatomic) IBOutlet UITextField *KVOtextFeild;
@property (nonatomic, strong) NSString *KVO;
@end
