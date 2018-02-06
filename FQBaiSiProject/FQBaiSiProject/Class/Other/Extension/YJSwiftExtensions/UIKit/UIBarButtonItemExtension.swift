//
//  UIBarButtonItemExtension.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

/**
 *  Add closure support to UIBarButtonItem
 */
public extension UIBarButtonItem {
    
    // MARK: - Override convenience methods
    public convenience init(image: UIImage?, style: UIBarButtonItemStyle, callback: ButtonActionCallBack?) {
        self.init(image: image, style: style, target: nil, action: nil)
        self.closureAction = callback
    }
    
    @available(iOS 5.0, *)
    public convenience init(image: UIImage?, landscapeImagePhone: UIImage?, style: UIBarButtonItemStyle, callback: ButtonActionCallBack?) {
        self.init(image: image, landscapeImagePhone: landscapeImagePhone, style: style, target: nil, action: nil)
        self.closureAction = callback
    }
    
    public convenience init(title: String?, style: UIBarButtonItemStyle, callback: ButtonActionCallBack?) {
        self.init(title: title, style: style, target:nil, action: nil)
        self.closureAction = callback
    }
    
    public convenience init(barButtonSystemItem systemItem: UIBarButtonSystemItem, callback: ButtonActionCallBack?) {
        self.init(barButtonSystemItem: systemItem, target:nil, action: nil)
        self.closureAction = callback
    }
    
    // MARK: - closure implement
    typealias ButtonActionCallBack = (Any?) -> ()
    var closureAction: ButtonActionCallBack? {
        set {
            if newValue != nil {
                target = self
                action = #selector(buttonAction(_:))
                self.itmeClosure = UIBarButtonItemClosure(closure: newValue!)
            } else {
                self.itmeClosure = nil
            }
        }
        get {
            return self.itmeClosure?.closure
        }
    }
    
    @objc func buttonAction(_ sender: Any?) {
        self.closureAction?(sender)
    }
}

fileprivate extension UIBarButtonItem {
    
    private struct AssociatedKeys {
        static var closureKey = "com.houmanager.UIBarButtonItem.ClosureKey"
    }
    
    fileprivate var itmeClosure: UIBarButtonItemClosure? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.closureKey) as? UIBarButtonItemClosure
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.closureKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

fileprivate class UIBarButtonItemClosure {
    typealias Closure = UIBarButtonItem.ButtonActionCallBack
    var closure: Closure
    init(closure: @escaping Closure) {
        self.closure = closure
    }
}

