//
//  ViewController.swift
//  swiftWB
//
//  Created by apple-gaofangqiu on 2017/12/4.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numTextF1 : UITextField?
    var numTextF2 : UITextField?
    var resultL : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
       
    }
    
    
    
    
    func test7(){
        /// <swiftWB.Person: 0x1c400c1f0>  命名空间  就是项目名  同一个命名空间下
        
        let p = Person()
        
        let s = Student()
        
        print(p.name + "-----" + s.number)
    }
    
    
    func test6() {
        let tf1 = UITextField(frame: CGRect(x: 20, y: 20, width: 100, height: 30))
        numTextF1 = tf1
        tf1.borderStyle = .roundedRect
        tf1.text = "0"
        view.addSubview(tf1)
        
        let tf2 = UITextField(frame: CGRect(x: 140, y: 20, width: 100, height: 30))
        numTextF2 = tf2
        tf2.borderStyle = .roundedRect
        tf2.text = "0"
        view.addSubview(tf2)
        
        let l1 = UILabel(frame: CGRect(x: 120, y: 20, width: 20, height: 30))
        l1.text = "+"
        l1.textAlignment = .center
        view.addSubview(l1)
        
        let l2 = UILabel(frame: CGRect(x: 240, y: 20, width: 20, height: 30))
        l2.text = "="
        l2.textAlignment = .center
        view.addSubview(l2)
        
        let l3 = UILabel(frame: CGRect(x: 240, y: 20, width: 60, height: 30))
        l3.text = "0"
        resultL = l3
        l3.textAlignment = .right
        view.addSubview(l3)
        
        let button = UIButton()
        button.setTitle("计算", for: .normal)
        button.sizeToFit()
        button.setTitleColor(UIColor.black, for: .normal)
        button.center = view.center
        view.addSubview(button)
        button.addTarget(self, action: #selector(calc), for: .touchUpInside)
    }
    
    @objc func calc()  {
        
        print(#function)
        print("\(String(describing: numTextF1?.text))----\(String(describing: numTextF2?.text)) ")
        
//        let num1 = Int(numTextF1?.text ?? "0")
//        let num2 = Int(numTextF2?.text ?? "0")
//
        guard let num1 = Int(numTextF1?.text ?? ""),let num2 = Int(numTextF2?.text ?? "") else {
            print("必须是数字")
            return
        }
        resultL?.text = "\(num1 + num2)"
      
    }
    
    @objc func clickMe(sender:UIButton) -> () {
        print("hahaha")
        print(#function)
        print(sender)
    }
    
    func test5(){
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

