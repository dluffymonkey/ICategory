//
//  NSArray+LQExtension.m
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import "NSArray+LQExtension.h"

@implementation NSArray (LQExtension)

- (NSString *)safeStringWithIndex:(NSInteger)index {
    if(!self || index < 0) return @"";
    if(self.count <= index) return @"";
    id object = [self objectAtIndex:index];
    if([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@", object];
    }
    return @"";
}

- (id)safeObjectWithIndex:(NSInteger)index {
    if(!self || index < 0) return nil;
    if(self.count <= index) return nil;
    return [self objectAtIndex:index];
}

@end
