//
//  UIImage+LQExtension.h
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LQExtension)

+ (UIImage*)imageWithUIView:(UIView *)view;

- (UIImage *)croppedImage:(UIImage *)image cutRect:(NSInteger)width;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

+ (UIImage *)imageWithColor:(UIColor *)color;


@end
