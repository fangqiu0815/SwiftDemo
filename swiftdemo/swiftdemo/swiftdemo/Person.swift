//
//  Person.swift
//  swiftdemo
//
//  Created by apple-gaofangqiu on 2017/9/8.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit

class Person: NSObject {

    private var _name : String?
    
    var name : String?{
        get{
        
            return _name
            
        }
        set{
        
            _name = newValue
            
        }
        
    }
    
    var title : String{
        get {
        
        
            return "Mr." + (name ?? "")
        }
    
    }
    //又称为计算型属性
    var title2 : String {
        
        return "Mr.XXX. " + (name ?? "")
        
    }
    
    
    
}
