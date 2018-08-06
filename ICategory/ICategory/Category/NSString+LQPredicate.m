//
//  NSString+LQPredicate.m
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import "NSString+LQPredicate.h"

@implementation NSString (LQPredicate)

+ (NSString *)predicatePhoneNum:(NSString *)phoneNumber {
    if (!phoneNumber || [phoneNumber isEqualToString:@""]) {
        return @"请输入手机号码";
    }
    NSString *phoneRegex = @"^1\\d{10}$";
    
    NSPredicate *phonePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    if (![phonePred evaluateWithObject:phoneNumber]) {
        return @"您输入的手机号有误，请重新输入";
    }
    return nil;
}


+ (NSString *)predicateIdCard:(NSString *)idCard {
    
    NSInteger length = 0;
    if (!idCard || [idCard isEqualToString:@""]) {
        return @"请输入身份证号码";
    }else {
        length = idCard.length;
        if (length != 15 && length !=18) {
            return @"身份证格式错误，请重新输入";
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11", @"12", @"13", @"14", @"15", @"21", @"22", @"23", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"41", @"42", @"43", @"44", @"45", @"46", @"50", @"51", @"52", @"53", @"54", @"61", @"62", @"63", @"64", @"65", @"71", @"81", @"82", @"91"];
    
    NSString *valueStart2 = [idCard substringToIndex:2];
    BOOL areaFlag = NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return @"身份证格式错误，请重新输入";
    }
    
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year = 0;
    switch (length) {
        case 15:
            year = [idCard substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year % 4 ==0 || (year % 100 ==0 && year % 4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];// 测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];// 测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:idCard
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, idCard.length)];
            
            
            if(numberofMatch > 0) {
                return nil;
            }else {
                return @"身份证格式错误，请重新输入";
            }
        case 18:
            
            year = [idCard substringWithRange:NSMakeRange(6,4)].intValue;
            if (year % 4 ==0 || (year % 100 ==0 && year % 4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];// 测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];// 测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:idCard
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, idCard.length)];
            
            
            if(numberofMatch > 0) {
                int S = ([idCard substringWithRange:NSMakeRange(0,1)].intValue +
                         [idCard substringWithRange:NSMakeRange(10,1)].intValue) *7 +
                ([idCard substringWithRange:NSMakeRange(1,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(11,1)].intValue) *9 +
                ([idCard substringWithRange:NSMakeRange(2,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(12,1)].intValue) *10 +
                ([idCard substringWithRange:NSMakeRange(3,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(13,1)].intValue) *5 +
                ([idCard substringWithRange:NSMakeRange(4,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(14,1)].intValue) *8 +
                ([idCard substringWithRange:NSMakeRange(5,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(15,1)].intValue) *4 +
                ([idCard substringWithRange:NSMakeRange(6,1)].intValue +
                 [idCard substringWithRange:NSMakeRange(16,1)].intValue) *2 +
                [idCard substringWithRange:NSMakeRange(7,1)].intValue *1 +
                [idCard substringWithRange:NSMakeRange(8,1)].intValue *6 +
                [idCard substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S % 11;
                NSString *M = @"F";
                NSString *JYM = @"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)]; // 判断校验位
                if ([M isEqualToString:[idCard substringWithRange:NSMakeRange(17,1)]]) {
                    return nil;// 检测ID的校验位
                }else {
                    return @"身份证格式错误，请重新输入";
                }
                
            }else {
                return @"身份证格式错误，请重新输入";
            }
        default:
            return @"身份证格式错误，请重新输入";
    }
}

+ (NSString *)predicateUserName:(NSString *)name {
    if (!name || [name isEqualToString:@""]) {
        return @"请输入姓名";
    }
    
    NSString *nameRegex = @"^([\\u4E00-\\u9FA5\\uf900-\\ufa2d\\·]{2,10})$";
    
    NSPredicate *namePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameRegex];
    if (![namePred evaluateWithObject:name]) {
        return @"姓名格式错误，请重新输入";
    }
    return nil;
}

+ (NSString *)predicateBankCard:(NSString *)bankCard {
    if (!bankCard || [bankCard isEqualToString:@""]) {
        return @"请输入银行卡号";
    }
    
    NSString *nameRegex = @"^([0-9]{16,19})$";
    
    NSPredicate *namePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameRegex];
    if (![namePred evaluateWithObject:bankCard]) {
        return @"银行卡号格式错误，请重新输入";
    }
    return nil;
}

+ (NSString *)predicatePassword:(NSString *)password {
    if (!password || [password isEqualToString:@""]) {
        return @"请输入密码";
    }
    NSString *setPwdRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
    NSPredicate *setPwdPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",setPwdRegex];
    if (![setPwdPred evaluateWithObject:password]) {
        return @"密码格式有误，请重新输入";
    }
    return nil;
}
/**验证邮箱*/
+ (NSString *)predicateEmail:(NSString *)email{
    if (!email || [email isEqualToString:@""]) {
        return @"请输入邮箱号";
    }
    NSString *emailPwdRegex = @"^[a-z0-9]+([._\\-] *[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$";
    NSPredicate *emailPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailPwdRegex];
    if (![emailPred evaluateWithObject:email]) {
        return @"邮箱格式错误，请重新输入";
    }
    return nil;
}

+ (BOOL)isChinese:(NSString *)str {
    if (!str || [str isEqualToString:@""]) {
        return NO;
    }
    NSString *nameRegex = @"[\u4e00-\u9fa5]+";
    NSPredicate *namePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nameRegex];
    if ([namePred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}
@end
