//
//  AppDelegate.swift
//  swiftdemo
//
//  Created by apple-gaofangqiu on 2017/9/7.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit
import Pods_swiftdemo

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    /**
     1.知道swift中有命名空间
     在同一个命名空间下 全局共享
     第三方框架最好使用cocoapods 
     
     2. 为了封装 解耦
        搜索反射机制和工厂方法
     
    
     
     **/
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        
        window?.backgroundColor = UIColor.white
        
        print(Bundle.main.infoDictionary)
        
        //获取 info.plist 里面的 CFBundleName的值 并转化为字符串 
//        let ns = Bundle.main.namespace()
//        let clsName = Bundle.main.namespace() + "." + "ViewController"

        // 反射 机制  抽取对象函数 获取命名空间
        let clsName = Bundle.main.namespace + "." + "ViewController"
        
        let cls = NSClassFromString(clsName) as? UIViewController.Type
        let vc = cls?.init()
        
//        let vc = ViewController()
        
        window?.rootViewController = vc
        
        window?.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

