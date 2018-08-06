//
//  UILabel+LQExtension.m
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import "UILabel+LQExtension.h"

@implementation UILabel (LQExtension)


/** 带单行文本的标签 */
+ (UILabel *)labelWithText:(NSString *)text {
    return [UILabel labelWithText:text textColor:[UIColor blackColor]];
}

/** 带单行文本、文本颜色的标签 */
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor {
    return [UILabel labelWithText:text textColor:[UIColor blackColor] fontSize:16.f];;
}

/** 带单行文本、文本颜色的标签 字体大小*/
+ (UILabel *)labelWithText:(NSString *)text
                 textColor:(UIColor *)textColor
                  fontSize:(CGFloat)size {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

/**
 *  设置label的属性
 *
 *  @param attributes 字符串属性
 *  @param range      范围
 */
- (void)setAttributes:(NSDictionary<NSString *, id> *)attributes range:(NSRange)range
{
    NSMutableAttributedString *attributesString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributesString setAttributes:attributes range:range];
    [self setAttributedText:attributesString];
}

@end
