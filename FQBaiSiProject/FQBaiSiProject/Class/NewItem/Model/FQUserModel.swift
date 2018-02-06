//
//  FQUserModel.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQUserModel: NSObject {
    var username: String = ""
    var sex: String = ""
    var profile_image: String = ""
    
    init(dict: [String: Any]) {
        username = dict["username"] as? String ?? ""
        sex = dict["sex"] as? String ?? ""
        profile_image = dict["profile_image"] as? String ?? ""
    }
    
}
