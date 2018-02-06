//
//  FQEssenceDataModel.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit
import Alamofire

class FQEssenceDataModel: NSObject {
    
    fileprivate static var userTempDic = [String: String]()
    
    class func loadContentsNow(a: String, type:Int, page: Int = 1, maxTime: String = "", finishedBlock:@escaping ((success:Bool, mTime: String, array :[FQContentModel]))->()) {
        
        var parameter = [String: String]()
        parameter["a"] = a
        parameter["c"] = "data"
        parameter["page"] = "\(page)"
        parameter["type"] = "\(type)"
        parameter["maxtime"] = maxTime
        userTempDic = parameter
        let url = URL(string: "http://api.budejie.com/api/api_open.php")
        Alamofire.request(url!, method: .get, parameters: parameter).responseJSON { (response) in
            
            if userTempDic != parameter {
                return
            }
            switch response.result {
                
            case let .success(value):
                guard let dict = value as? [String: Any] else {
                    return
                }
                guard let datas = dict["list"] as? [[String: Any]] else {
                    return
                }
                var mmTime = ""
                if let lastTime = dict["info"] as? [String: Any] {
                    mmTime  = (lastTime["maxtime"] as? String) ?? ""
                }
                var data = [FQContentModel]()
                for dic in datas {
                    data.append(FQContentModel(dict: dic))
                }
                finishedBlock((true, mmTime, data))
            case let .failure(error):
                finishedBlock((false, "", [FQContentModel]()))
                print("load content \(error)")
            }
        }
    }

    
    
}
