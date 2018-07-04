//
//  ADTestsModel.m
//  UnitTestDemo
//
//  Created by Oliver on 2018/7/3.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import "ADTestsModel.h"

@implementation ADTestsModel

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.age = dict[@"age"];
        self.flags = [dict[@"flags"] integerValue];
    }
    return self;
}

+ (instancetype)modelWithName:(NSString *)name age:(NSNumber *)age flags:(NSInteger)flags {
    ADTestsModel *model = [[self alloc] init];
    model.name = name;
    model.age = age;
    model.flags = flags;
    return model;
}

@end
