//
//  DemoView.swift
//  swiftdemo
//
//  Created by apple-gaofangqiu on 2017/9/8.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit

class DemoView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupUI()
        
    }
    
    
    private func setupUI(){
        print("设置界面")
    }
    
}
