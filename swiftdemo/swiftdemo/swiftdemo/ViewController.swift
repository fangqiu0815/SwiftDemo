//
//  ViewController.swift
//  swiftdemo
//
//  Created by apple-gaofangqiu on 2017/9/7.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //初始化并且分配空间label 会提前创建 延迟加载 减少内存消耗
    lazy var label:DemoView = DemoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        
    }

    
    private func setupUI(){
        view.addSubview(label)
        label.text = "hello"
        label.sizeToFit()
        label.textColor = UIColor.black
        label.center = view.center
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

