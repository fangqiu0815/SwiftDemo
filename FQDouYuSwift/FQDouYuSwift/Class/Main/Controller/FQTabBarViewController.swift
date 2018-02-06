//
//  FQTabBarViewController.swift
//  FQDouYuSwift
//
//  Created by apple-gaofangqiu on 2018/1/23.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQTabBarViewController: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tabBarAppear = UITabBarItem.appearance()
        tabBarAppear.setTitleTextAttributes([NSAttributedStringKey.foregroundColor:UIColor.orange], for: UIControlState.selected)
        
        setupChildViewController()
        
    }

    fileprivate func setupChildViewController()
    {
        let normalImagesArray = ["btn_home_normal","btn_live_normal","btn_column_normal","btn_user_normal"]
        let selectImagesArray = ["btn_home_selected","btn_live_selected","btn_column_selected","btn_user_selected"]
        setupNaviRootViewController(vc: FQHomeViewController(), title: "首页", imageName: normalImagesArray[0], selectImageName: selectImagesArray[0])
        
        setupNaviRootViewController(vc: FQLiveViewController(), title: "直播", imageName: normalImagesArray[0], selectImageName: selectImagesArray[0])

        setupNaviRootViewController(vc: FQFollowViewController(), title: "关注", imageName: normalImagesArray[0], selectImageName: selectImagesArray[0])

        setupNaviRootViewController(vc: FQProfileViewController(), title: "首页", imageName: normalImagesArray[0], selectImageName: selectImagesArray[0])
        
    }
    
    fileprivate func setupNaviRootViewController(vc: UIViewController, title: String, imageName: String, selectImageName: String)
    {
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: selectImageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    self.addChildViewController(FQNavigationViewController(rootViewController: vc))

    }

}
