//
//  NSString+LQPredicate.h
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 正则表达式校验本地字符
 */
@interface NSString (LQPredicate)

/**验证手机号*/
+ (NSString *)predicatePhoneNum:(NSString *)phoneNumber;
/**验证身份证号码*/
+ (NSString *)predicateIdCard:(NSString *)idCard;
/**验证姓名*/
+ (NSString *)predicateUserName:(NSString *)name;
/**验证银行卡*/
+ (NSString *)predicateBankCard:(NSString *)bankCard;
/**验证密码*/
+ (NSString *)predicatePassword:(NSString *)password;

/**验证邮箱*/
+ (NSString *)predicateEmail:(NSString *)email;
/** 验证中文 */
+ (BOOL)isChinese:(NSString *)str;

@end
