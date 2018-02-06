//
//  FQTabBarViewController.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/2.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 通过 appearance统一设置UITabBarItem的文字属性，属性后面带UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
        let tabBar = UITabBarItem.appearance()
        let attrs_Normal = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.gray]
        let attrs_Select = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        tabBar.setTitleTextAttributes(attrs_Normal, for: .normal)
        tabBar.setTitleTextAttributes(attrs_Select, for: .selected)
        setupTabBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FQTabBarViewController
{
    fileprivate func setupTabBar(){
        setValue(FQTabBar(), forKey: "tabBar")
        
        let vcArray:[UIViewController] = [FQHomeViewController(), FQNewItemViewController(), FQAttentionViewController(), FQProfileViewController()]
        let titleArray = [("精华", "essence"), ("新帖", "new"), ("关注", "friendTrends"), ("我的", "me")]
        for (index, vc) in vcArray.enumerated() {
            vc.tabBarItem.title = titleArray[index].0
            vc.tabBarItem.image = UIImage(named: "tabBar_\(titleArray[index].1)_icon")
            vc.tabBarItem.selectedImage = UIImage(named: "tabBar_\(titleArray[index].1)_click_icon")
            let nav = FQNaviViewController(rootViewController: vc)
            addChildViewController(nav)
        }
        
    }
    
    
}

