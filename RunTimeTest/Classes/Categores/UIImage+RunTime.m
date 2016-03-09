//
//  UIImage+RunTime.m
//  RunTimeTest
//
//  Created by guzhiyang on 16/2/29.
//  Copyright © 2016年 guzhiyang. All rights reserved.
//

#import "UIImage+RunTime.h"
#import <objc/message.h>

// 动态添加属性
static const char *key = "name";

@implementation UIImage (RunTime)

+ (void)load{
    Method loadImageWithName = class_getClassMethod(self, @selector(loadImageWithName:));
    Method imageNamed = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(loadImageWithName, imageNamed);
}

+ (instancetype)loadImageWithName:(NSString *)name{
    
    UIImage *image = [self loadImageWithName:name];

    if (name == nil) {
        NSLog(@"加载图片为空!");
    }
    
    return image;
}

// 动态添加属性

- (NSString *)name{
    return objc_getAssociatedObject(self, key);
}

- (void)setName:(NSString *)name{
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    objc_setAssociatedObject(self, key, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
