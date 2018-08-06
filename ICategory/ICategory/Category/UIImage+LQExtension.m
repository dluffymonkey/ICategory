//
//  UIImage+LQExtension.m
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import "UIImage+LQExtension.h"

@implementation UIImage (LQExtension)


/**
 view转化成uiimage

 @param view 要转化的view
 @return 转化得到的image
 */
+ (UIImage*)imageWithUIView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0f);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage *tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}

/// 进行绘图剪裁，可以实现歌词缓慢出现效果
- (UIImage *)croppedImage:(UIImage *)image cutRect:(NSInteger)width {
    if (image) {
        float min = MIN(image.size.width,image.size.height);
        CGRect rectMAX = CGRectMake(0, 0, width, min);
        CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rectMAX);
        UIGraphicsBeginImageContext(rectMAX.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextDrawImage(context, CGRectMake(0, 0, width, min), subImageRef);
        UIImage *viewImage = [UIImage imageWithCGImage:subImageRef];
        UIGraphicsEndImageContext();
        CGImageRelease(subImageRef);
        return viewImage;
    }
    
    return nil;
}


/**
 通过颜色创建图片

 @param color 要创建图片的颜色
 @return 返回创建好的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f,0.0f, 1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


/**
 对灰色图片进行着色处理

 @param tintColor 颜色
 @return 着色后的图片
 */
- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor {
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode {
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}

@end
