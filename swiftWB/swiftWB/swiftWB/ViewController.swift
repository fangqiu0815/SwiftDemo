//
//  ViewController.swift
//  swiftWB
//
//  Created by apple-gaofangqiu on 2017/12/4.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView(frame: CGRect(x: 100, y: 50, width: 100, height: 100))
        v.backgroundColor = UIColor.red
        v.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.2666666667, alpha: 1) //TODO: 应该设置新的颜色
        self.view.addSubview(v)
        
//        let imgView = UIImageView(image: #imageLiteral(resourceName: "转盘")) //FIXME : 应该设置头像
//        imgView.center = v.center
//        self.view.addSubview(imgView)
        
        let button = UIButton(type: .contactAdd)
        v.addSubview(button)
        button.addTarget(self, action: #selector(clickMe), for: .touchUpInside)
        
        test3()
    }
    
    @objc func clickMe(sender:UIButton) -> () {
        print("hahaha")
        print(#function)
        print(sender)
    }
    
    func test3() {
        let x = 10
        
    }
    
    func test2() {
        // none some
        
        
    }
    
    func test1()  {
        let x = 10
        let y = 10.5
        print(x + Int(y))
        
    }
    
    func test() {
        var x = 10
        x = 20
        
        let y = 10.5
        print(x)
        print(y)
        let view = UIView(frame: CGRect(x: 0, y: 20, width: 50, height: 50))
        self.view.addSubview(view)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

