//
//  FQADViewController.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/6.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQADViewController: UIViewController {

    /// 懒加载广告view
    lazy var adView:UIImageView = {
        let adContainView = UIView(frame: self.view.bounds)
        adContainView.backgroundColor = UIColor.white
        self.view.addSubview(adContainView)
        let adView = UIImageView(frame:adContainView.bounds)
        adContainView.addSubview(adView)
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        adView.addGestureRecognizer(tapGes)
        self.adView = adView
        return adView
    }()

    /// 广告模型
    var adModel = [FQADModel]()

    /// 定时器
    var timer:Timer!

    /// 跳过按钮
    var jumpBtn : UIButton = {
        let jumpButton = UIButton(type: .custom)
        
        return jumpButton
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
        {
        return .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    deinit {
        printLog("deinit")
    }
    
}

extension FQADViewController{
    @objc func tapClick() {
//        let url = NSURL(string: adModel.ori_curl)
        
        
    }
    
    
}


