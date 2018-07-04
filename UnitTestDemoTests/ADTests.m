//
//  PersonalInfomationTests.m
//  UnitTestDemoTests
//
//  Created by Oliver on 2018/7/3.
//  Copyright © 2018年 Oliver. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ADTestsModel.h"
#import "ADBaseRequest.h"

//waitForExpectationsWithTimeout是等待时间，超过了就不再等待往下执行。
#define WAIT do {\
[self expectationForNotification:@"ADBaseTest" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:30 handler:nil];\
} while (0);

#define NOTIFY \
[[NSNotificationCenter defaultCenter]postNotificationName:@"ADBaseTest" object:nil];

@interface ADTests : XCTestCase

@end

@implementation ADTests

/** 单元测试开始前调用 */
- (void)setUp {
    [super setUp];
    NSLog(@"单元测试开始");
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

/** 单元测试结束前调用 */
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"单元测试结束");
}

/** 测试代码可以写到以test开头的方法中 并且test开头的方法左边会生成一个菱形图标，点击即可运行检测当前test方法内的代码 */
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

//性能测试
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        //测试for循环执行时间
        NSMutableArray * mutArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 9999; i++) {
            NSObject * object = [[NSObject alloc] init];
            [mutArray addObject:object];
        }
    }];
}

//检查年龄是否合法
- (void)testAge {
    ADTestsModel *model = [[ADTestsModel alloc] init];
    model.age = @30;
//    model.age = @"130";
//    model.age = @"-1";
    XCTAssert([model.age integerValue] > 0, @"姓名小于0岁-非法");
    XCTAssert([model.age integerValue] < 100, @"姓名大于100岁-非法");
}

//检查模型转换
- (void)testModelConvert {
    NSString *json = @"{\"name\":\"Tom\",\"age\":27,\"flags\":987654321}";
    NSMutableDictionary *dict = [[NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil] mutableCopy];
    
    ADTestsModel *model = [[ADTestsModel alloc] initWithDictionary:dict];
    XCTAssertNotNil(model);
    XCTAssertTrue([model.name isEqualToString:@"Tom"]);
    XCTAssertTrue([model.age isEqual:@(27)]);
    XCTAssertEqual(model.flags, 987654321);
    XCTAssertTrue([model isKindOfClass:[ADTestsModel class]]);
    
    model = [ADTestsModel modelWithName:@"Cesar" age:dict[@"age"] flags:562525];
    XCTAssertNotNil(model);
    XCTAssertTrue([model.name isEqualToString:@"Cesar"]);
    XCTAssertTrue([model.age isEqual:dict[@"age"]]);
    XCTAssertEqual(model.flags, 562525);
}

//检查请求接口
- (void)testRequest {
    [ADBaseRequest getRequest:nil AndUrl:@"http://www.weather.com.cn/adat/sk/101110101.html" success:^(id responseDict) {
        NSLog(@"接口返回结果 = %@", responseDict);
        XCTAssertNotNil(responseDict, @"返回出错");
        NOTIFY //继续执行
    } fail:^(NSError *error) {
        XCTAssertNil(error, @"请求出错");
        NOTIFY //继续执行
    }];
    WAIT  //暂停
}

@end
