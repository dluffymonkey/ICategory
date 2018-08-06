//
//  NSDictionary+LQExtension.m
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import "NSDictionary+LQExtension.h"

@implementation NSDictionary (LQExtension)

- (NSString *)safeStringWithKey:(NSString *)key {
    if(!self || !key)return @"";
    if([[self objectForKey:key] isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@", [self objectForKey:key]];
    }
    if([[self objectForKey:key] isKindOfClass:[NSString class]]) {
        return [self objectForKey:key];
    }
    return @"";
}

- (NSArray *)safeArrayWithKey:(NSString *)key {
    if(!self || !key)return @[];
    if([[self objectForKey:key] isKindOfClass:[NSArray class]]) {
        return [self objectForKey:key];
    }
    return @[];
}

@end
