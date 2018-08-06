//
//  UIButton+LQExtension.m
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import "UIButton+LQExtension.h"
#import <objc/runtime.h>

static NSString *keyWithMethod = @"keyWithMethod"; //关联对象的key
static NSString *keyWithBlock = @"keyWithBlock";

@implementation UIButton (LQExtension)

/** 带标题的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title {
    return [UIButton buttonWithTitle:title titleColor:[UIColor blackColor]];;
}

/** 带标题、标题颜色的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor {
    return [UIButton buttonWithTitle:title titleColor:titleColor fontSize:16.f];
}

/** 带标题、标题颜色、标题字体大小的按钮 */
+ (UIButton *)buttonWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    return button;
}

+ (UIButton *)buttonWithtitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize
                  actionBlock:(void (^)(UIButton *sender))completion {
    
    UIButton *button = [UIButton buttonWithTitle:title titleColor:titleColor fontSize:fontSize];
    [button addTarget:button action:@selector(buttonTapAction:) forControlEvents:UIControlEventTouchUpInside];
    
    /*
     *用runtime中的函数通过key关联对象
     *
     *objc_setAssociatedObject(id _Nonnull object, const void * _Nonnull key, id _Nullable value, objc_AssociationPolicy policy)
     *id object                 表示关联者，是一个对象，变量名也是object
     *const void *key           获取被关联者的索引
     *id value                  被关联者，这里是一个block
     *objc_AssociationPolicy    policy 关联时采用的协议，有assign，retain，copy等协议，一般使用OBJC_ASSOCIATION_RETAIN_NONATOMIC
     */
    objc_setAssociatedObject(button, &keyWithMethod, completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return button;
}

+ (UIButton *)button {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:button action:@selector(buttonTapAction:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)setActionBlock:(ActionBlock)actionBlock{
    objc_setAssociatedObject(self, &keyWithBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
}

- (ActionBlock)actionBlock{
    return objc_getAssociatedObject(self ,&keyWithBlock);
}

- (void)buttonTapAction:(UIButton *)button {
    //通过key获取被关联对象
    //objc_getAssociatedObject(id object, const void *key)
    void (^tapBlock)(UIButton *) = objc_getAssociatedObject(button, &keyWithMethod);
    
    if (tapBlock) {
        tapBlock(button);
    }
    
    ActionBlock block2 = (ActionBlock)objc_getAssociatedObject(button, &keyWithBlock);
    if(block2){
        block2(button);
    }
}

@end
