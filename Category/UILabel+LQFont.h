//
//  UILabel+LQFont.h
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 项目字体大小屏幕适配，包括XIB，Storyboard，纯代码
 */
@interface UILabel (LQFont)

#warning  改变字体后，系统所以的字体都被更改，会导致xib中字体的加粗效果失效，要用代码设置字体的加粗效果

@end
