//
//  NewPerson.swift
//  swiftWB
//
//  Created by apple-gaofangqiu on 2017/12/12.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit

class NewPerson: NSObject {

    var name : String?
    var age : Int = 0
    init(dict: [String : AnyObject]) {
        super.init()
        
        // kvc
        setValuesForKeys(dict)
        
    }
}
