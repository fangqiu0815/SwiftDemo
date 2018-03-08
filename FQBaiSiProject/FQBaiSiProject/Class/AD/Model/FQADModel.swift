//
//  FQADModel.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/6.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQADModel: NSObject {
    var w_picurl = ""
    var ori_curl = ""
    var w : CGFloat = 0
    var h : CGFloat = 0
    init(_ dic: [String: Any]) {
        guard let w_picurl = dic["w_picurl"] as? String, let ori_curl = dic["ori_curl"] as? String, let w = dic["w"] as? CGFloat ,let h = dic["h"] as? CGFloat else {
            return
        }
        self.w_picurl = w_picurl
        self.ori_curl = ori_curl
        self.w = w
        self.h = h
    }
}
