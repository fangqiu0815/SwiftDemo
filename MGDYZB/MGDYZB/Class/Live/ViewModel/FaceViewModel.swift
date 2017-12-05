//
//  FaceViewModel.swift
//  MGDYZB
//
//  Created by i-Techsys.com on 17/2/25.
//  Copyright © 2017年 ming. All rights reserved.
//    http://capi.douyucdn.cn/api/v1/getColumnRoom/8?limit=20&client_sys=ios&offset=0
//    http://capi.douyucdn.cn/api/v1/getColumnRoom/8?limit=20&client_sys=ios&offset=20

import UIKit

class FaceViewModel: NSObject {
    var offset: Int = 0
    
    lazy var faceModels = [FaceModel]()
}

extension FaceViewModel {
    func loadFaceData(finished: @escaping (_ err: Error?)->()) {
        let parameters:[String : Any] = ["limit": 20, "client_sys": "ios","offset": offset]
        let urlStr = "http://capi.douyucdn.cn/api/v1/getColumnRoom/8"
        NetWorkTools.requestData(type: .get, urlString: urlStr, parameters: parameters, succeed: { (result, err) in
            // 1.获取到数据
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArray = resultDict["data"] as? [[String : Any]] else { return }
            
            for model in dataArray {
                self.faceModels.append(FaceModel(dict: model))
            }
            
            finished(nil)
        }) { (err) in
            finished(err)
        }
    }
}
