//
//  UIButton+LQExtension.h
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 UIButton快速创建方法扩展
 */
@interface UIButton (LQExtension)
typedef void (^ActionBlock)(UIButton *button);

/** 带标题的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title;

/** 带标题、标题颜色的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor;

/** 带标题、标题颜色、标题字体大小的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize;

/**
 通过block对Button的点击事件进行封装
 
 @param title 内容
 @param titleColor 内容颜色
 @param completion 点击事件
 @return Button
 */
+ (UIButton *)buttonWithtitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize
                  actionBlock:(void (^)(UIButton *sender))completion;


/**
 通过block对Button的点击事件进行封装
 
 @return 返回初始化后的button
 */
+ (UIButton *)button;

@end
