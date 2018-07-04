//
//  Movie.m
//  UnitTestDemo
//
//  Created by Oliver on 2018/7/4.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)initWithTitle:(NSString *)title priceCode:(int)priceCode {
    if (self = [super init]) {
        self.title = title;
        self.priceCode = priceCode;
    }
    return self;
}

@end
