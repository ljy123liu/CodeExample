//
//  DemoTests.m
//  CodeExmple
//
//  Created by LIUYONG on 5/10/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking.h>
@interface DemoTests : XCTestCase
@property (nonatomic, strong) UIButton *button;
@end

@implementation DemoTests

//每个测试方法执行之前调用，适合将一些初始化代码和全局变量写在这里
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

//每个测试方法执行完成调用，适合将测试完成后需要销毁的内容写在这里，保证下面内容不受影响
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

//普通测试方法
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}

//性能测试 measureBlock：主要针对某个代码块执行的时长，通过测试block中方法执行的时间，比对设定的标准值和偏差觉得是否可以通过测试
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        for (int i = 0; i < 10000000; i++) {
            
        }
    }];
}

//禁止一个测试用例，只需要在方法名字前加 DISABLED
//断言
-(void)DISABLED_testAssert {
    
    NSString *a1;
    NSString *a2;
    int n1;
    int n2;
    float accuracy = 0.5;//double,精确度
    BOOL isRight;
    NSError *error;
    
/**
 *  通用断言
 */
    XCTAssert(isRight,@"isRight为true的时候通过测试");
    
/**
 *  常用断言
 */
    XCTAssertTrue(a1,@"成功描述");
    XCTAssertFalse(a2,@"失败描述");
    
    //在C语言中，枚举类型、字符型和各种整数的表示形式统一叫做标量类型
    XCTAssertEqual(a1, a2,@"当a1和a2是 C语言标量、结构体或联合体时使用, 判断的是变量的地址,相等");
    XCTAssertNotEqual(a1, a2,@"当a1和a2是 C语言标量、结构体或联合体时使用, 判断的是变量的地址，不相等");
    
    XCTAssertEqualWithAccuracy(n1, n2, accuracy,@"+,-accuracy范围内相等的描述");
    XCTAssertNotEqualWithAccuracy(n1, n2, accuracy,@"+,-accuracy范围内不相等的描述");
    
    XCTAssertEqualObjects(a1, a2,@"[a1 isEqual:a2]值为true时通过");
    XCTAssertNotEqualObjects(a1, a2,@"[a1 isEqual:a2]值为false时通过]");
    
    XCTAssertNil(a1,@"a1为空的时候通过测试");
    XCTAssertNotNil(a1,@"a1不为空的时候通过测试");
    
    XCTAssertThrows(error,@"异常测试，发生异常通过，当error != nil的时候不通过");
    XCTAssertNoThrow(error,@"异常测试，当error == nil没有发生异常时通过测试");
    
//    XCTAssertThrowsSpecific(<#expression#>, <#exception_class, ...#>)当expression针对指定类不抛出异常时报错
//    XCTAssertThrowsSpecificNamed(<#expression#>, <#exception_class#>, <#exception_name, ...#>)当expression针对特定类和特定名字不抛出异常时报错
    
//    XCTAssertNoThrowSpecific(<#expression#>, <#exception_class, ...#>)当expression针对指定类抛出异常时报错。任意其他异常都可以；也就是说它不会报错
//    XCTAssertNoThrowSpecificNamed(<#expression#>, <#exception_class#>, <#exception_name, ...#>)当expression针对特定类和特定名字抛出异常时报错
    
    XCTFail(@"直接失败断言");
}


/**
 *  测试的三个步骤：（Given/When/Then）
 *  1、Given：构建整个测试上下文，建立相关模型
 *  2、When:需要测试的业务逻辑，一般情况只调用一个方法
 *  3、Then检查一下测试结果是否符合预期
 */
- (void)testAddDemo {
    
    //Given
    //设置变量和设置预期值
    NSUInteger a = 10;
    NSUInteger b = 15;
    NSUInteger expected = 25;
    //When
    NSUInteger result = [self add:a b:b];
    //Then
    XCTAssertEqual(expected,result,@"a、b相等");
}

- (NSUInteger)add:(NSUInteger)a b:(NSUInteger)b {
    return a + b;
}

//测试异步任务1：expectationWithDescription
- (void)testAsynExample {

    XCTestExpectation *exp = [self expectationWithDescription:@"这里可以是操作出错的原因描述"];
    NSOperationQueue *queue = [NSOperationQueue new];
    [queue addOperationWithBlock:^{
        //模拟这个异步操作需要2秒后才能获取结果，比如一个异步网络请求
        sleep(2);
        //模拟获取的异步操作后，获取结果，判断异步方法的结果是否正确
        XCTAssertEqual(@"a", @"a");
        //如果断言没问题，就调用fulfill宣布测试满足，fulfill表示满足期望
        [exp fulfill];
    }];
    
    //设置延迟多少秒后，如果没有满足测试条件就报错
    [self waitForExpectationsWithTimeout:3 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error:%@",error);
        }
    }];
}

//测试异步任务2：expectationForPredicate
//- (void)testThatBackgroundImageChanges {

//    XCTAssertNil([self.button backgroundImageForState:UIControlStateNormal]);
//    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(UIButton  *_Nonnull button, NSDictionary<NSString *,id> * _Nullable bindings) {
//        return [button backgroundImageForState:UIControlStateNormal] != nil;
//    }];
//    
//    [self expectationForPredicate:predicate
//              evaluatedWithObject:self.button
//                          handler:nil];
//    
//    [self waitForExpectationsWithTimeout:20 handler:nil];
//}

//测试异步任务3：expectationForNotification
- (void)testAsynNotification {
    
    [self expectationForNotification:@"通知名称" object:nil handler:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"通知名称" object:nil];
    
    //设置延迟多少秒后，如果没有满足测试条件就报错
    [self waitForExpectationsWithTimeout:3 handler:nil];
}

//因为测试方法在主线程执行完就会结束，所以需要在方法结束前设置等待，回调的时候让她它继续执行，否则看不到block里面的结果
- (void)testAFN {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    [manager GET:@"http://www.weather.com.cn/adat/sk/101110101.html" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"response:%@",responseObject);
        XCTAssertNotNil(responseObject,@"返回出错");
        [[NSNotificationCenter defaultCenter]postNotificationName:@"RSBaseTest" object:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            XCTFail(@"网络请求失败");
            [[NSNotificationCenter defaultCenter]postNotificationName:@"RSBaseTest" object:nil];
        }
    }];
    
    [self expectationForNotification:@"RSBaseTest" object:nil handler:nil];
    [self waitForExpectationsWithTimeout:30 handler:nil];
}

/**
 *  注意：XCTAssertEqual  和  XCTAssertEqualObjects 区别
 *  1、XCTAssertEqual:判断条件 a1 == a2（指针指向的地址相等）, XCTAssertEqualObjects:判断条件 [a1 isEqual a2]（值相等）
 *  2、对于NSString，Xcode会对部分字符串做优化，相同的字符串会使用同一份拷贝。NSString和基本数据类型，两种断言一样
 */
- (void)testAssertEqual {
    
    int n1 = 1;
    int n2 = 1;
    int n3 = n1;
    XCTAssertEqual(n1, n2);//通过
    XCTAssertEqual(n1, n3);//通过
    
    NSString *s1 = @"1";
    NSString *s2 = @"1";
    NSString *s3 = s1;

    XCTAssertEqual(s1, s2);//通过
    XCTAssertEqual(s1, s3);//通过
    
    NSArray *a1 = @[@"1"];
    NSArray *a2 = @[@"1"];
    NSArray *a3 = a1;
    XCTAssertEqual(a1, a2);//不通过
    XCTAssertEqual(a1, a3);//通过
    
    NSDictionary *d1 = @{@"1":@1};
    NSDictionary *d2 = @{@"1":@1};
    NSDictionary *d3 = d1;
    XCTAssertEqual(d1, d2);//不通过
    XCTAssertEqual(d1, d3);//通过
}

- (void)testAssertEqualObjects {
    
    int n1 = 1;
    int n2 = 1;
    int n3 = n1;
    XCTAssertEqual(n1, n2);//通过
    XCTAssertEqual(n1, n3);//通过
    
    NSString *s1 = @"1";
    NSString *s2 = @"1";
    NSString *s3 = s1;
    XCTAssertEqualObjects(s1, s2);//通过
    XCTAssertEqualObjects(s1, s3);//通过
    
    NSArray *a1 = @[@"1"];
    NSArray *a2 = @[@"1"];
    NSArray *a3 = a1;
    XCTAssertEqualObjects(a1, a2);//通过
    XCTAssertEqualObjects(a1, a3);//通过

    NSDictionary *d1 = @{@"1":@1};
    NSDictionary *d2 = @{@"1":@1};
    NSDictionary *d3 = d1;
    XCTAssertEqualObjects(d1, d2);//通过
    XCTAssertEqualObjects(d1, d3);//通过
}








@end
