//  NotificationOCUnitTestTests.m
//  Created on 2018/9/28
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

#import <XCTest/XCTest.h>
#import "NotificationUnitTestViewController.h"
#import <OCMock.h>
@interface NotificationOCUnitTestTests : XCTestCase

@end

@implementation NotificationOCUnitTestTests

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
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


/**
 测试mock接受通知
 */
- (void)testShouldSubscribeToNotification {
    id mock = OCMObserverMock();
    NotificationUnitTestViewController *controller = [[NotificationUnitTestViewController alloc] init];
    [[NSNotificationCenter defaultCenter] addMockObserver:mock
                                                     name:@"AVPlayerItemDidPlayToEndTimeNotification"
                                                   object:nil];
    [[mock expect] notificationWithName:@"AVPlayerItemDidPlayToEndTimeNotification"
                                 object:[OCMArg any]
                               userInfo:@{ @"TestString": @"test"}];
    
    [controller postNotificationWithName:@"AVPlayerItemDidPlayToEndTimeNotification"];
    
    [mock verify];

}


/**
 测试发出通知
 */
- (void)testShouldPostToNotification {
    NotificationUnitTestViewController *controller = [[NotificationUnitTestViewController alloc] init];
    controller.view.backgroundColor = [UIColor whiteColor];
    id mock = [OCMockObject partialMockForObject:controller];
    //reject 不允许执行某个方法，防止测试a方法调用b方法，b方法有传参并且参数不是由a方法提供
    [(NotificationUnitTestViewController *)[mock reject] printTestStr:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AVPlayerItemDidPlayToEndTimeNotification" object:nil userInfo:@{ @"TestString": @"test" }];
    [mock verify];
    
}

@end
