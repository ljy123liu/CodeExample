//
//  TestAssertDefine.h
//  CodeExmple
//
//  Created by LIUYONG on 5/14/16.
//  Copyright © 2016 WanJianTechnology. All rights reserved.
//

#ifndef TestAssertDefine_h
#define TestAssertDefine_h

#define assertTrue(expr)                      XCTAssertTrue((expr),@"")
#define assertFalse(expr)                     XCTAssertFalse((expr),@"");

#define assertNil(a1)                         XCTAssertNil(a1,@"");
#define assertNotNil(a1)                      XCTAssertNotNil(a1,@"");

//在C语言中，枚举类型、字符型和各种整数的表示形式统一叫做标量类型
#define assertEqual(a1,a2)                    XCTAssertEqual(a1, a2,@"");
#define assertNotEqual(a1,a2)                 XCTAssertNotEqual(a1, a2,@"");

#define assertEqualObject(a1,a2)              XCTAssertEqualObjects(a1, a2,@"");
#define assertNotEqualObjects(a1,a2)          XCTAssertNotEqualObjects(a1, a2,@"");

#define assertAccuracy(a1,a2,acc)             XCTAssertEqualWithAccuracy(n1, n2, accuracy);
#define assertNotEqualWithAccuracy(a1,a2,acc) XCTAssertNotEqualWithAccuracy(n1, n2, accuracy);

#define assertThrows(error)                   XCTAssertThrows(error,@"");
#define assertNotThrow(error)                 XCTAssertNoThrow(error,@"");

#define WAIT                                                            \
do {                                                                    \
[self expectationForNotification:@"LYUnitTest" object:nil handler:nil]; \
[self waitForExpectationsWithTimeout:30 handler:nil];                   \
} while(0);

#define NOTIFY                                                                            \
do {                                                                                      \
                                                                                          \
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LYUnitTest" object:nil]; \
                                                                                          \
} while(0);

#endif /* TestAssertDefine_h */
