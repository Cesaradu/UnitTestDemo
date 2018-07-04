//
//  Demand.m
//  UnitTestDemo
//
//  Created by Oliver on 2018/7/4.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import "Demand.h"

@implementation Demand

- (id)initWithMovie:(Movie *)movie timePeriod:(TimePeriodEnum)timePeriod {
    if (self = [super init]) {
        self.movie = movie;
        self.timePeriod = timePeriod;
    }
    return self;
}

@end
