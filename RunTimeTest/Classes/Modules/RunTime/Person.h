//
//  Person.h
//  RunTimeTest
//
//  Created by guzhiyang on 16/2/29.
//  Copyright © 2016年 guzhiyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

@interface Person : NSObject

@property (copy, nonatomic) NSString    *name;

- (void)eat:(NSString *)foodName;

+ (void)resolveDict:(NSDictionary *)dict;

@end
