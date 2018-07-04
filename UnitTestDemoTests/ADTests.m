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

//测试各个断言
- (void)testAssert {
//    XCTFail(format…) 生成一个失败的测试；
//    XCTFail(@"Fail");
//
//
//    XCTAssertNil(a1, format...) 为空判断， a1 为空时通过，反之不通过；
//    XCTAssertNil(@"not nil string", @"string must be nil");
//
//
//    XCTAssertNotNil(a1, format…) 不为空判断，a1不为空时通过，反之不通过；
//    XCTAssertNotNil(@"not nil string", @"string can not be nil");
//
//
//    XCTAssert(expression, format...) 当expression求值为TRUE时通过；
//    XCTAssert((2 > 2), @"expression must be true");
//
//
//    XCTAssertTrue(expression, format...) 当expression求值为TRUE时通过；
//    XCTAssertTrue(1, @"Can not be zero");
//
//
//    XCTAssertFalse(expression, format...) 当expression求值为False时通过；
//    XCTAssertFalse((2 < 2), @"expression must be false");
//
//
//    XCTAssertEqualObjects(a1, a2, format...) 判断相等， [a1 isEqual:a2] 值为TRUE时通过，其中一个不为空时，不通过；
//    XCTAssertEqualObjects(@"1", @"1", @"[a1 isEqual:a2] should return YES");
//    XCTAssertEqualObjects(@"1", @"2", @"[a1 isEqual:a2] should return YES");
//
//
//    XCTAssertNotEqualObjects(a1, a2, format...) 判断不等， [a1 isEqual:a2] 值为False时通过，
//    XCTAssertNotEqualObjects(@"1", @"1", @"[a1 isEqual:a2] should return NO");
//    XCTAssertNotEqualObjects(@"1", @"2", @"[a1 isEqual:a2] should return NO");
//
//
//    XCTAssertEqual(a1, a2, format...) 判断相等（当a1和a2是 C语言标量、结构体或联合体时使用,实际测试发现NSString也可以）；
//    1.比较基本数据类型变量
//    XCTAssertEqual(1, 2, @"a1 = a2 shoud be true"); // 无法通过测试
//    XCTAssertEqual(1, 1, @"a1 = a2 shoud be true"); // 通过测试
//
//    2.比较NSString对象
//    NSString *str1 = @"1";
//    NSString *str2 = @"1";
//    NSString *str3 = str1;
//    XCTAssertEqual(str1, str2, @"a1 and a2 should point to the same object"); // 通过测试
//    XCTAssertEqual(str1, str3, @"a1 and a2 should point to the same object"); // 通过测试
//
//    3.比较NSArray对象
//    NSArray *array1 = @[@1];
//    NSArray *array2 = @[@1];
//    NSArray *array3 = array1;
//    XCTAssertEqual(array1, array2, @"a1 and a2 should point to the same object"); // 无法通过测试
//    XCTAssertEqual(array1, array3, @"a1 and a2 should point to the same object"); // 通过测试
//
//
//    XCTAssertNotEqual(a1, a2, format...) 判断不等（当a1和a2是 C语言标量、结构体或联合体时使用）；
//
//
//    XCTAssertEqualWithAccuracy(a1, a2, accuracy, format...) 判断相等，（double或float类型）提供一个误差范围，当在误差范围（+/- accuracy ）以内相等时通过测试；
//    XCTAssertEqualWithAccuracy(1.0f, 1.5f, 0.25f, @"a1 = a2 in accuracy should return YES");
//
//
//    XCTAssertNotEqualWithAccuracy(a1, a2, accuracy, format...) 判断不等，（double或float类型）提供一个误差范围，当在误差范围以内不等时通过测试；
//    XCTAssertNotEqualWithAccuracy(1.0f, 1.5f, 0.25f, @"a1 = a2 in accuracy should return NO");
//
//
//    XCTAssertThrows(expression, format...) 异常测试，当expression发生异常时通过；反之不通过；（很变态）
//
//
//    XCTAssertThrowsSpecific(expression, specificException, format...) 异常测试，当expression发生 specificException 异常时通过；反之发生其他异常或不发生异常均不通过；
//
//    XCTAssertThrowsSpecificNamed(expression, specificException, exception_name, format...) 异常测试，当expression发生具体异常、具体异常名称的异常时通过测试，反之不通过；
//
//
//    XCTAssertNoThrow(expression, format…) 异常测试，当expression没有发生异常时通过测试；
//
//
//    XCTAssertNoThrowSpecific(expression, specificException, format...)异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过；
//
//
//    XCTAssertNoThrowSpecificNamed(expression, specificException, exception_name, format...) 异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过
}

@end
