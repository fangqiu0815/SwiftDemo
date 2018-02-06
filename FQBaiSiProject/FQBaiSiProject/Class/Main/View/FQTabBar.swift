//
//  FQTabBar.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/2.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQTabBar: UITabBar {

    lazy var publishBtn : UIButton = {
        
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), for: .normal)
        button.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), for: .highlighted)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addTarget(self, action: #selector(clickPublishButton), for: .touchUpInside)
        return button
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(publishBtn)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if yj_height > kTabBarHeight {
            yj_height = kTabBarHeight
        }
        
        let btnW = yj_width / 5
        let btnH = yj_height
        let btnY: CGFloat = 0
        var index: CGFloat = 0
        publishBtn.center = yj_center
        for view in subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!){
                let buttonX = (index < 2) ? index * btnW : (index + 1) * btnW
                view.frame = CGRect(x: buttonX, y: btnY, width: btnW, height: btnH)
                index += 1
            }
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) 没创建")
    }

}

extension FQTabBar
{
    @objc fileprivate func clickPublishButton(){
        let publishVC = FQPublishViewController()
        
        UIApplication.shared.keyWindow?.rootViewController?.present(publishVC, animated: false, completion: nil)
        
    }
    
}











