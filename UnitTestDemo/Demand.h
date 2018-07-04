//
//  Demand.h
//  UnitTestDemo
//
//  Created by Oliver on 2018/7/4.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

typedef NS_ENUM(NSUInteger, TimePeriodEnum) {
    TimePeriodEnumWorkDaytime = 1,
    TimePeriodEnumWorkNight = 2,
    TimePeriodEnumWeekend = 3
};
@class Demand;

@interface Demand : NSObject

@property (nonatomic, strong) Movie *movie;
@property (nonatomic, assign) int timePeriod;

- (id)initWithMovie:(Movie *)movie timePeriod:(TimePeriodEnum)timePeriod;

@end
