//
//  FQRecommendTag.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQRecommendTag: NSObject {
    var image_list: String = ""
    var theme_name: String = ""
    var sub_number: Int = 0
    init(dict: [String: Any]) {
        super.init()
        image_list = dict["image_list"] as? String ?? ""
        theme_name = dict["theme_name"] as? String ?? ""
        sub_number = Int((dict["sub_number"] as? NSString ?? "0").intValue)
        
    }
}
