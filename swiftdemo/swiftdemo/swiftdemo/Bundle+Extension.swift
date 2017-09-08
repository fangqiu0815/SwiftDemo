//
//  Bundle+Extension.swift
//  swiftdemo
//
//  Created by apple-gaofangqiu on 2017/9/8.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import Foundation

extension Bundle {

//    func namespace() -> String {
//        
////        return  Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
//        return  infoDictionary?["CFBundleName"] as? String ?? ""
//        
//    }

    //计算型属性
    var namespace: String{
        return  infoDictionary?["CFBundleName"] as? String ?? ""
    }
    
}
