//
//  Person.swift
//  swiftWB
//
//  Created by apple-gaofangqiu on 2017/12/7.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name : String
    
    override init() {
        name = "zhang"
        print("person init")

        super.init()
    }
    /// 1.给当前的属性初始化  2.给父类的属性初始化  
    
    
    
}
