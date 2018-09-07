//  CodeCoverageTests.swift
//  Created on 2018/9/6
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

import XCTest
@testable import CodeCoverage

class CodeCoverageTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEqualOneCharacterString() {
        XCTAssert(checkWord(word: "1", isAnagramOfWord: "1"))
    }
    func testDifferentLengthStrings() {
        XCTAssertFalse(checkWord(word: "a", isAnagramOfWord: "bb"))
    }
    
    func testEmptyStrings() {
        XCTAssert(checkWord(word: "", isAnagramOfWord: ""))
    }
    
    func testLongAnagram() {
        XCTAssert(checkWord(word: "chris grant", isAnagramOfWord: "char string"))
    }
    
    func testLongInvalidAnagramWithEqualLengths() {
        XCTAssertFalse(checkWord(word: "apple", isAnagramOfWord: "tests"))
    }
    
    func testNormalAnagram() {
        XCTAssert(checkWord(word: "apple", isAnagramOfWord: "appel"))
    }
}
