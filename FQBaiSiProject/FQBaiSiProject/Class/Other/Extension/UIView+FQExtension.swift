//
//  UIView+FQExtension.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/2.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

extension UIView {

    func isShowingOnKeyWindow() -> Bool {
        guard let keyWindow = UIApplication.shared.keyWindow else { return false }
        
        let frame = keyWindow.convert(self.frame, from: self.superview)
        
        //判断主窗口的bounds和self的范围是否有重叠
        let isIntersects = frame.intersects(keyWindow.bounds)
        return isIntersects && !self.isHidden && self.alpha > 0 && self.window == keyWindow
        
    }

}

extension UIView
{
    
    var yj_x : CGFloat {
        get {
            return frame.origin.x
        }
        set{
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
        
    }
    
    var yj_y : CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
        
    }
    
    var yj_width : CGFloat {
        
        get {
            return frame.size.width
        }
        set (newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
        
    }
    
    var yj_height: CGFloat {
        get {
            return frame.size.height
        }
        set (newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
        
    }
    
    var yj_left: CGFloat {
        get {
            return yj_x
        }
        set (newValue) {
            yj_x = newValue
        }
    }
    
    var yj_right: CGFloat {
        
        get {
            return yj_x + yj_width
        }
        set (newValue) {
            yj_y = newValue - yj_width
        }
        
    }
    
    var yj_bottom: CGFloat {
        
        get {
            return yj_y + yj_height
        }
        set (newValue) {
            yj_y = newValue - yj_height
        }
        
    }
    
    var yj_center: CGPoint {
        get {
            return CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
        }
        set {
            center = CGPoint(x: newValue.x, y: newValue.y)
        }
    }
    
    //中心点x
    var yj_centerX : CGFloat {
        get {
            return center.x
        }
        
        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    //中心点y
    var yj_centerY : CGFloat {
        get {
            return center.y
        }
        
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
    
    
    
}

extension UIView {
    
    public func viewController() -> UIViewController? {
        var next = self.next
        while next != nil {
            if (next?.isKind(of: UIViewController.superclass()!)) != nil {
                return next as? UIViewController
            }
            next = next?.next
        }
        
        return nil
    }
    
}




