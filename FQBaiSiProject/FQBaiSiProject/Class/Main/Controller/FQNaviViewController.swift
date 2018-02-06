//
//  FQNaviViewController.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/2.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQNaviViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage(named:"navigationbarBackgroundWhite"), for: .default)
        
        // Do any additional setup after loading the view.
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            let button = UIButton(type: .custom)
            button.setTitle("返回", for: .normal)
            button.setImage(UIImage(named:"navigationButtonReturn"), for: .normal)
            button.setImage(UIImage(named:"navigationButtonReturnClick"), for: .highlighted)
            button.addTarget(self, action: #selector(backClick), for: .touchUpInside)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.setTitleColor(UIColor.red, for: .highlighted)
            button.sizeToFit()
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
            button.contentHorizontalAlignment = .left
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            viewController.hidesBottomBarWhenPushed = true
            
        }
        super.pushViewController(viewController, animated: animated)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FQNaviViewController{
    @objc func backClick() {
        popViewController(animated: true)
    }

}

extension FQNaviViewController
{
    fileprivate func setupTapGes(){
        // 手势中所有属性
        guard let targets = interactivePopGestureRecognizer!.value(forKey:  "_targets") as? [NSObject] else { return }
        let targetObjc = targets[0]
        let target = targetObjc.value(forKey: "target")
        let action = Selector(("handleNavigationTransition:"))
        
        let panGes = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(panGes)
    }
}


















