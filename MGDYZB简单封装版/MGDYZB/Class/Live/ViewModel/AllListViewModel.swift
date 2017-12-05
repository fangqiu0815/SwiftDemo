//
//  AllListViewModel.swift
//  MGDYZB
//
//  Created by ming on 16/10/30.
//  Copyright © 2016年 ming. All rights reserved.

//  简书：http://www.jianshu.com/users/57b58a39b70e/latest_articles
//  github:  https://github.com/LYM-mg

import UIKit

class AllListViewModel: NSObject {
    // 用于上下拉刷新
    var currentPage = 0
    var rooms: [RoomModel] = []
    fileprivate let tagID: String = "0"
}

extension AllListViewModel {
    func loadAllListData(_ finishedCallback: @escaping () -> ()) {
        let parameters:[String : Any] = ["offset": 20*currentPage, "limit": 20, "time": String(format: "%.0f", Date().timeIntervalSince1970)]
        let url = "http://capi.douyucdn.cn/api/v1/live/" + "\(tagID)?"
        NetWorkTools.requestData(type: .get, urlString: url,parameters: parameters, succeed: { (result, err) in
            // 1.获取到数据
            guard let resultDict = result as? [String: Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String: Any]] else { return }
            
//            debugPrint(dataArray)
            // 2.字典转模型
            for dict in dataArray {
                self.rooms.append(RoomModel(dict: dict))
            }
            // 3.完成回调
            finishedCallback()
        }) { (err) in
            finishedCallback()    
        }
        
        NetWorkTools.requestData(type: .get, urlString: "http://www.douyu.com/api/v1/live/directory",parameters: nil, succeed: { (result, err) in
            // 1.获取到数据
            guard let resultDict = result as? [String: Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String: Any]] else { return }
            
//            debugPrint(dataArray)
            // 2.字典转模型
            for dict in dataArray {
                self.rooms.append(RoomModel(dict: dict))
            }
            // 3.完成回调
            finishedCallback()
        }) { (err) in
            finishedCallback()
        }
        
    }

}
