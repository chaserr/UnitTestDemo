//  NotificationUnitTestTests.swift
//  Created on 2018/9/28
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

import XCTest
@testable import NotificationUnitTest

class NotificationUnitTestTests: XCTestCase {
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        //credit: Matt Neuberg - http://stackoverflow.com/questions/24034544/dispatch-after-gcd-in-swift/24318861#24318861
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func testShouldSubscribeToNotification() {
        weak var expection = self.expectation(description: "testShouldSubscribeToNotification")
        let viewController = ViewController()
        // 这一步是为了能够调用viewController的viewDidLoad从而能够add通知
        let _ = viewController.view
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: nil, userInfo: nil)
        delay(2) {
            print("result=\(viewController.didReceiveNotification)")
            //if the view controller was properly subscribed, this should be true
            XCTAssertTrue(viewController.didReceiveNotification)
            expection?.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
    }
    
}
