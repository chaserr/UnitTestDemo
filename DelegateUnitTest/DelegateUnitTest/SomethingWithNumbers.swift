//  SomethingWithNumbers.swift
//  Created on 2018/9/28
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

import Foundation

class SomethingWithNumbers {
    var delegate: SomethingWithNumberDelegate? = nil
    
    func doAsyncStuffWithNumbers(number: Int) {

        delegate?.somethingWithDelegate(results: number)
        
    }
}

