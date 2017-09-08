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
//    lazy var label:DemoView = DemoView()
    
    private lazy var label:UILabel = UILabel()
    
//    lazy var label = { () -> DemoView in
//        
//        let l = DemoView()
//        
//        //设置 label 属性
//        
//        return l
//        
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        label.text = "hello"
//        label.sizeToFit()

        test()
        
//        setupUI()

    }

    private lazy var p = Person()
    private func test(){
//        let p = Person()
        
        p.name = "laowang"
        
        print(p.name)
//        print(p._name)
        print(p.title)
        print(p.title2)

//        p.title = "laozhang"
    }
    
    
    private func setupUI(){
        view.addSubview(label)
        label.text = "hello"
        label.sizeToFit()
        label.textColor = UIColor.black
        label.center = view.center
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

