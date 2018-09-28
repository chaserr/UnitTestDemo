//  DelegateUnitTestTests.swift
//  Created on 2018/9/28
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

import XCTest

@testable import DelegateUnitTest

class DelegateUnitTestTests: XCTestCase, SomethingWithNumberDelegate {
    func somethingWithDelegate(results: Int) {
        self.results = results
        numbersExpectation.fulfill()
    }
    
    private var numbersExpectation: XCTestExpectation!
    private var results: Int!

    func testAsynchronousNumber() {
        numbersExpectation = XCTestExpectation (description: "Numbers")
        let numbers = SomethingWithNumbers()
        numbers.delegate = self
        numbers.doAsyncStuffWithNumbers(number: 123)
        // 异步单元测试
        waitForExpectations(timeout: 20) { (error) in
            //等待20秒，若该测试未结束（未收到 fulfill方法）则测试结果为失败
        }
        XCTAssertEqual(self.results, 123)
    }
    
    
}
