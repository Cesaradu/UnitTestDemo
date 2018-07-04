//
//  Movie.h
//  UnitTestDemo
//
//  Created by Oliver on 2018/7/4.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, MovieEnum) {
    MovieEnumChildrens = 2,
    MovieEnumRegular = 0,
    MovieEnumNewRelease = 1
};
@class Movie;
@interface Movie : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int priceCode;
- (id)initWithTitle:(NSString *)title priceCode:(int)priceCode;

@end
