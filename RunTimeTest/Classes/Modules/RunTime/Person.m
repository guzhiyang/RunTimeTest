//
//  Person.m
//  RunTimeTest
//
//  Created by guzhiyang on 16/2/29.
//  Copyright © 2016年 guzhiyang. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)eat:(NSString *)foodName{
    NSLog(@"%@吃了%@",_name,foodName);
}

void personHaveThing(id self, SEL sel, NSString *userName){
    NSLog(@"%@ %@ %@",self,NSStringFromSelector(sel),userName);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(personHaveThing)) {
        class_addMethod(self, @selector(personHaveThing), personHaveThing, "v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}

+ (void)resolveDict:(NSDictionary *)dict{
    // 拼接属性字符串代码
    NSMutableString *strM = [NSMutableString string];
    
    // 1.遍历字典，把字典中的所有key取出来，生成对应的属性代码
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        // 类型经常变，抽出来
        NSString *type;
        
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            type = @"NSString";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]){
            type = @"NSArray";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            NSString *objString = [NSString stringWithFormat:@"%@",obj];
            NSArray *objArray = [objString componentsSeparatedByString:@"."];

            if(objArray.count > 1)
                type = @"float";
            else
                type = @"int";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
            type = @"NSDictionary";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            type = @"BOOL";
        }else{
            type = @"id";
        }
        
        // 属性字符串
        NSString *str;
        if ([type containsString:@"NS"]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;",type,key];
        }else{
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) %@ %@;",type,key];
        }
        
        // 每生成属性字符串，就自动换行。
        [strM appendFormat:@"\n%@\n",str];
        
    }];
    
    // 把拼接好的字符串打印出来，就好了。
    NSLog(@"%@",strM);
}

@end
