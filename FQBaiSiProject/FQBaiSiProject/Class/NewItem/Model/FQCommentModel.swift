//
//  FQCommentModel.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQCommentModel: NSObject {
    
    var ID: String = ""
    var voicetime: Int = 0
    var voiceurl: String = ""
    var content: String = ""
    var like_count = 0
    var user: FQUserModel!
    
    init(dict: [String: Any]) {
        ID = dict["id"] as? String ?? ""
        voicetime = dict["voicetime"] as? Int ?? 0
        content = dict["content"] as? String ?? ""
        voiceurl = dict["voiceurl"] as? String ?? ""
        like_count = dict["like_count"] as? Int ?? 0
        user = FQUserModel(dict: dict["user"] as! [String : Any])
    }
    
    
}
