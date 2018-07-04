//
//  ADTestsModel.h
//  UnitTestDemo
//
//  Created by Oliver on 2018/7/3.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADTestsModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, assign) NSInteger flags;

+ (instancetype)modelWithName:(NSString *)name age:(NSNumber *)age flags:(NSInteger)flags;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
