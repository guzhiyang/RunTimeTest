//
//  UIImage+RunTime.h
//  RunTimeTest
//
//  Created by guzhiyang on 16/2/29.
//  Copyright © 2016年 guzhiyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RunTime)

+ (instancetype)loadImageWithName:(NSString *)name;

- (NSString *)name;
- (void)setName:(NSString *)name;
@end
