//
//  ViewController.m
//  RunTimeTest
//
//  Created by guzhiyang on 16/2/29.
//  Copyright © 2016年 guzhiyang. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+RunTime.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _testImage.image = [UIImage imageNamed:@"ants.jpg"];
//    [_testImage seta]
    
    UIImage *image = [[UIImage alloc] init];
    image.name = @"ants";
    NSLog(@"图片名称:%@",image.name);
    
    Person *testPerson = [Person new];
    testPerson.name = @"小明";
    [testPerson performSelector:@selector(eat:) withObject:@"shit"];
    
    [testPerson performSelector:@selector(personHaveThing)];
    
    int a[5]= {1,2,3,4,5};
    int *ptr = (int *)(&a+1);
    NSLog(@"%d,%d",*(a+1),*(ptr-1));
    
    NSObject *obj1 = [[[NSObject alloc] init] autorelease];
    NSObject *obj2 = obj1;
    [obj2 retain];
    [obj1 release];
    
    NSLog(@"%i",[obj1 retainCount]);
    
    NSMutableString *testMulString = [NSMutableString stringWithFormat:@"hehe"];
    NSMutableArray *testArray = [NSMutableArray arrayWithObjects:testMulString,@"test", nil];
//    [testMulString appendString:@"wolegequ"];
    testMulString = [NSMutableString stringWithFormat:@"gai"];

    NSArray *copyArray = [testArray copy];
    NSArray *muCopyArray = [testArray mutableCopy];
    NSLog(@"%@ %@ %@",testArray,copyArray,muCopyArray);
    
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@1,@2, nil];
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@1, nil];
    
    NSSet *set = [NSSet setWithObjects:arr1,arr2,nil];
    [arr2 addObject:@2];
    BOOL isHas = [set containsObject:@[@1,@2]];
    
    NSEnumerator *enumerator = [set objectEnumerator];
    [enumerator allObjects];
    [enumerator nextObject];
    NSLog(@"set %@",set);
    
    NSDictionary *testDic = @{@"name":@"zhang",
                              @"sex":@1.2,
                              @"hasMerried":@YES
                              };
    [Person resolveDict:testDic];
}

- (void)dealloc{
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
