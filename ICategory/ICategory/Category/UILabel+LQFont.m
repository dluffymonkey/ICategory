//
//  UILabel+LQFont.m
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import "UILabel+LQFont.h"
#import "LQDeviceInfo.h"
#import <objc/runtime.h>

@implementation UILabel (LQFont)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        //替换三个方法
        SEL originalSelector = @selector(init);
        SEL originalSelector2 = @selector(initWithFrame:);
        SEL originalSelector3 = @selector(awakeFromNib);
        SEL swizzledSelector = @selector(lqBaseInit);
        SEL swizzledSelector2 = @selector(lqBaseInitWithFrame:);
        SEL swizzledSelector3 = @selector(lqBaseAwakeFromNib);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method originalMethod2 = class_getInstanceMethod(class, originalSelector2);
        Method originalMethod3 = class_getInstanceMethod(class, originalSelector3);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        Method swizzledMethod2 = class_getInstanceMethod(class, swizzledSelector2);
        Method swizzledMethod3 = class_getInstanceMethod(class, swizzledSelector3);
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        BOOL didAddMethod2 =
        class_addMethod(class,
                        originalSelector2,
                        method_getImplementation(swizzledMethod2),
                        method_getTypeEncoding(swizzledMethod2));
        BOOL didAddMethod3 =
        class_addMethod(class,
                        originalSelector3,
                        method_getImplementation(swizzledMethod3),
                        method_getTypeEncoding(swizzledMethod3));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
            
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        if (didAddMethod2) {
            class_replaceMethod(class,
                                swizzledSelector2,
                                method_getImplementation(originalMethod2),
                                method_getTypeEncoding(originalMethod2));
        }else {
            method_exchangeImplementations(originalMethod2, swizzledMethod2);
        }
        if (didAddMethod3) {
            class_replaceMethod(class,
                                swizzledSelector3,
                                method_getImplementation(originalMethod3),
                                method_getTypeEncoding(originalMethod3));
        }else {
            method_exchangeImplementations(originalMethod3, swizzledMethod3);
        }
    });
}

/**
 *在这些方法中将你的字体名字换进去
 */
- (instancetype)lqBaseInit
{
    id __self = [self lqBaseInit];
    UIFont *font = [UIFont systemFontOfSize:RFont(self.font.pointSize)];
    if (font) {
        self.font=font;
    }
    return __self;
}

-(instancetype)lqBaseInitWithFrame:(CGRect)rect{
    id __self = [self lqBaseInitWithFrame:rect];
    UIFont *font = [UIFont systemFontOfSize:RFont(self.font.pointSize)];
    if (font) {
        self.font=font;
    }
    return __self;
}

-(void)lqBaseAwakeFromNib{
    [self lqBaseAwakeFromNib];
    UIFont *font = [UIFont systemFontOfSize:RFont(self.font.pointSize)];
    if (font) {
        self.font=font;
    }
    
}

@end
