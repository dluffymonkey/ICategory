//
//  UIView+LQExtension.h
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LQExtension)
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable UIColor *borderColor;

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

- (void)clipWithcornerRadius:(CGFloat)cornerRadius;

/// 使用纯代码创建分隔线view
+ (UIView *)viewWithSeparateLineFrame:(CGRect)frame color:(UIColor *)color;

/// 获取视图所对应的控制器 -- 下一个相应者
- (UIViewController *)viewController;
@end
