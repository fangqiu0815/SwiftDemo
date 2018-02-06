//
//  FQNavigationViewController.swift
//  FQDouYuSwift
//
//  Created by apple-gaofangqiu on 2018/1/23.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 0.设置导航栏的颜色
        setUpNavAppearance ()
        
        // 1.创建Pan手势
        let target = navigationController?.interactivePopGestureRecognizer?.delegate
        let pan = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        pan.delegate = self
        self.view.addGestureRecognizer(pan)
        
        // 2.禁止系统的局部返回手势
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        self.delegate = self
    }
    
    // MARK: - 拦截Push操作
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 这里判断是否进入push视图
        if (self.childViewControllers.count > 0) {
            let backBtn = UIButton(image: #imageLiteral(resourceName: "back"), highlightedImage: #imageLiteral(resourceName: "backBarButtonItem"), title: "返回",target: self, action: #selector(popToParent))
            
            // 设置按钮内容左对齐
            backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left;
            // 内边距
            backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            // 隐藏要push的控制器的tabbar
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func popToParent(){
        
        popViewController(animated: true)
    }
    

}

extension FQNavigationViewController:UIGestureRecognizerDelegate
{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        ///判断是否是根控制器
        if self.childViewControllers.count == 1
        {
            return false
        }
        return true
    }
    
}

extension FQNavigationViewController : UINavigationControllerDelegate
{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is FQLiveViewController {
            navigationController.navigationBar.barTintColor = UIColor.yellow
        }else {
            navigationController.navigationBar.barTintColor = UIColor.orange
        }
    }
}


extension FQNavigationViewController
{
    fileprivate func setUpNavAppearance(){
        
        let navBar = UINavigationBar.appearance()
        if(UIDevice.current.systemVersion as NSString).doubleValue > 8.0 {
            navBar.isTranslucent = true
        } else {
            self.navigationBar.isTranslucent  = true
        }
        
        navBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.00)
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 18)]
    }
    
}



