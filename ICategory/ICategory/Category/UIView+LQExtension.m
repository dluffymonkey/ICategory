//
//  UIView+LQExtension.m
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import "UIView+LQExtension.h"

@implementation UIView (LQExtension)

#pragma mark - setter
- (void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (void)setWidth:(CGFloat)width{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (void)setHeight:(CGFloat)height{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (void)setSize:(CGSize)size{
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}


#pragma mark - getter
- (CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}

- (CGFloat)borderWidth{
    return self.layer.borderWidth;
}

- (UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (CGFloat)x{
    return self.frame.origin.x;
}

- (CGFloat)y{
    return self.frame.origin.y;
}

- (CGFloat)width{
    return self.frame.size.width;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (CGSize)size{
    return self.frame.size;
}

- (CGPoint)origin{
    return self.frame.origin;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)clipWithcornerRadius:(CGFloat)cornerRadius {
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.path = bezierPath.CGPath;
    self.layer.mask = maskLayer;
}

+ (UIView *)viewWithSeparateLineFrame:(CGRect)frame color:(UIColor *)color {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

//获取视图所对应的控制器 -- 下一个相应者
- (UIViewController *)viewController {
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        } else {
            next = [next nextResponder];
        }
    } while (next != nil);
    
    return nil;
}

@end
