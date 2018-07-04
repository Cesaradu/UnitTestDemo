//
//  Customer.h
//  UnitTestDemo
//
//  Created by Oliver on 2018/7/4.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Demand.h"

@interface Customer : NSObject

- (id)initCustomerWithName:(NSString *)name;
- (void)addDemand:(Demand *)demand;
- (NSString *)statement;

@end
