//
//  FQMeFootModel.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/6.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQMeFootModel: NSObject {
    var icon = ""
    var name = ""
    var url = ""
    init(_ dic: [String: Any]) {
        guard let name = dic["name"] as? String, let icon = dic["icon"] as? String, let url = dic["url"] as? String else {
            return
        }
        self.name = name
        self.icon = icon
        self.url = url
    }
}
