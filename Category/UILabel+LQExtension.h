//
//  UILabel+LQExtension.h
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LQExtension)

/** 带单行文本的标签 */
+ (UILabel *)labelWithText:(NSString *)text;

/** 带单行文本、文本颜色的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor;

/** 带单行文本、文本颜色的标签 字体大小*/
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat)size;

/**
 *  设置label的属性
 *
 *  @param attributes 字符串属性
 *  @param range      范围
 */
- (void)setAttributes:(NSDictionary<NSString *, id> *)attributes range:(NSRange)range;

@end
