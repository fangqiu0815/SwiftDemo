//
//  Student.swift
//  swiftWB
//
//  Created by apple-gaofangqiu on 2017/12/7.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit

class Student: Person {
    var number : String
    
    override init() {
        number = "001"
        print("Student init")

        super.init()
    }
    
}
