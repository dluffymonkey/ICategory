//
//  NSDictionary+LQExtension.h
//  ICategory
//
//  Created by Leo on 2018/8/6.
//  Copyright © 2018 iLeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (LQExtension)

- (NSString *)safeStringWithKey:(NSString *)key;
- (NSArray *)safeArrayWithKey:(NSString *)key;

@end
