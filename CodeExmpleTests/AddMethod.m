//
//  AddMethod.m
//  CodeExmple
//
//  Created by LIUYONG on 5/11/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCTestsViewController.h"
#import "DataSource.h"
#import "TestAssertDefine.h"
@interface AddMethod : XCTestCase

@end

@implementation AddMethod

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSUInteger a = 10;
    NSUInteger b = 20;
    NSUInteger r = 30;
    XCTestsViewController *test = [XCTestsViewController new];
    if (r != [test addMethodWith:a b:b]) {
        XCTFail(@"add error");
    }
    
    DataSource *data = [DataSource shareDataSource];
    if (r != [data addMethodWith:a b:b]) {
        XCTFail(@"add error");
    }
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
