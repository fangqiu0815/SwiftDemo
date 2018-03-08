//
//  AppDelegate.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/1.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit
import SnapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        initWindowData()
        
        return true
    }

    func initWindowData() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let tabBarVC = FQTabBarViewController()
        tabBarVC.delegate = self
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
        
    }
    
    
}

extension AppDelegate:UITabBarControllerDelegate
{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("\(viewController)")
    }
}





