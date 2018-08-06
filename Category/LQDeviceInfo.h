//
//  LQDeviceInfo.h
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#ifndef LQDeviceInfo_h
#define LQDeviceInfo_h

//******************     打印    ******************//
#ifdef DEBUG
#define NSLog(...) NSLog(@"%d \n %@\n",__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif

//******************     手机屏幕大小    ******************//
#define iSEqualSize(size) ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(size, [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5s iSEqualSize(CGSizeMake(640,1136))
#define iPhone6 iSEqualSize(CGSizeMake(750,1334))
#define iPhone6P iSEqualSize(CGSizeMake(1242,2208))
#define iPhoneX ([UIScreen mainScreen].bounds.size.height == 812.0)
//******************     边距    ******************//
#define lMargin  (iPhone5  ? 20 : 24)
#define tMargin  24

//******************     尺寸    ******************//
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

//******************     字体    ******************//
#define RFont(s) ((SCREEN_WIDTH <= 320.0)?s-2:((SCREEN_WIDTH <= 375.0)?s:s+1))

//******************     iPhoneX适配   ***************//
#define kSafeAreaNavBarHeight (SCREEN_HEIGHT>= 812.0?88:64)
#define kSafeAreaTabBarHeight (SCREEN_HEIGHT>= 812.0?83:49)
#define kSafeAreaBottomHeight (iPhoneX?34:0)

//******************     版本号   ******************//
#define AppSource @"appStore"
#define AppVersion [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]
#define DeviceVersion [[UIDevice currentDevice].systemVersion floatValue]
#define AppName  [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleDisplayName"]

//******************     其他    ******************//
#define UserDefault [NSUserDefaults standardUserDefaults]
#define KEYWindow [UIApplication sharedApplication].keyWindow

//******************     循环引用   ******************//
#define WeakSelf __weak typeof(self) wself = self;
#define StrongSelf __strong typeof(self) sself = weakSelf;

#endif /* LQDeviceInfo_h */
