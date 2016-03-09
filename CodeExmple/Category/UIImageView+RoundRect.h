//
//  UIImageView+RoundRect.h
//  CodeExmple
//
//  Created by LIUYONG on 2/28/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RoundRect)
/**
 *  高性能切圆角
 *
 *  @param frame     <#frame description#>
 *  @param imageName <#imageName description#>
 *
 *  @return <#return value description#>
 */
+ (UIImageView *)roundedRectInitWithFrame:(CGRect)frame imageNamed:(NSString *)imageName;
@end
