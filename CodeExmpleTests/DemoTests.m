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


//断言
-(void)testAssert {
    
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
    
//    XCTAssertThrowsSpecific(<#expression#>, <#exception_class, ...#>)当expression发生specificException异常时通过；如果发生发生其它异常，或者不发生异常的时候均不通过
//    XCTAssertThrowsSpecificNamed(<#expression#>, <#exception_class#>, <#exception_name, ...#>)当expression发生具体异常名称的异常通过测试，反之不通过
    
//    XCTAssertNoThrowSpecific(<#expression#>, <#exception_class, ...#>)当expression没有发生具体异常名称的异常时通过测试，反之不通过
//    XCTAssertNoThrowSpecificNamed(<#expression#>, <#exception_class#>, <#exception_name, ...#>)当expression没有发生具体异常名称的异常时通过测试，反之不通过
    
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
    XCTAssertEqual(expected,result,@"add方法不相等");
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








@end
