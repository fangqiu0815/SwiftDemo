//
//  UIButton+FQExtension.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

extension UIButton
{
    
    public static func button(title: String? = nil, titleColor: UIColor,imageName: String, backgroundColor: UIColor, highlightedColor: UIColor? = nil, cornerRadius: CGFloat = 0, fontsize:CGFloat = 0) -> UIButton {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontsize)
        button.setup(title: title, titleColor: titleColor, imageName:imageName, backgroundColor: backgroundColor, highlightedColor: highlightedColor, cornerRadius: cornerRadius)
        return button
    }
    
    public func setup(title: String? = nil, titleColor: UIColor,imageName: String, backgroundColor: UIColor, highlightedColor: UIColor? = nil, cornerRadius: CGFloat = 0) {
        guard buttonType == .custom else { return assertionFailure("Please set buttonType .custom") }
        setTitle(title, for: .normal)
        if imageName.count != 0 {
            setImage(UIImage(named: imageName), for: .normal)
        }
        setTitleColor(titleColor, for: .normal)
        setBackgroundColor(color: backgroundColor, highlightedColor: highlightedColor)
        setCornerRadius(radius: cornerRadius)
    }
    
    public func setBackgroundColor(color: UIColor, for state: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return assertionFailure("Failed to get current context") }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = context.makeImage().map { UIImage(cgImage: $0) }
        setBackgroundImage(image, for: state)
    }
    
    public func setCornerRadius(radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    
    public func setBackgroundColor(color: UIColor, highlightedColor: UIColor? = nil) {
        setBackgroundColor(color: color, for: .normal)
        if let highlightedcolor = highlightedColor {
            setBackgroundColor(color: highlightedcolor, for: .highlighted)
        } else {
            let highlightedColor = color.isLight ? color.darken(delta: 0.2) : color.lighten(delta: 0.2)
            setBackgroundColor(color: highlightedColor, for: .highlighted)
        }
    }
    
}

extension UIButton
{
//    /// button.cs_accpetEventInterval = 0.0 这个方法是不需要实现防止重复点击的属性
//
//    private struct cs_associatedKeys {
//        static var accpetEventInterval = "cs_acceptEventInterval"
//        static var acceptEventTime = "cs_acceptEventTime"
//    }
//    /**
//     重复点击的时间间隔--自己手动随意设置
//     利用运行时机制 将accpetEventInterval值修改
//     */
//    var cs_accpetEventInterval: TimeInterval {
//        get {
//            if let accpetEventInterval = objc_getAssociatedObject(self, &cs_associatedKeys.accpetEventInterval) as? TimeInterval {
//                return accpetEventInterval
//            }
//            return 1.0
//        }
//        set {
//            objc_setAssociatedObject(self, &cs_associatedKeys.accpetEventInterval, newValue as TimeInterval, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//    /**
//     重复点击的时间间隔--自己手动随意设置
//     利用运行时机制 将acceptEventTime值修改
//     */
//    var cs_acceptEventTime : TimeInterval {
//        get {
//            if let acceptEventTime = objc_getAssociatedObject(self, &cs_associatedKeys.acceptEventTime) as? TimeInterval {
//                return acceptEventTime
//            }
//            return 1.0
//        }
//        set {
//            objc_setAssociatedObject(self, &cs_associatedKeys.acceptEventTime, newValue as TimeInterval, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
//    /**
//     重写初始化方法,在这个方法中实现在运行时方法替换
//     */
//    override open class func initialize() {
//        let changeBefore: Method = class_getInstanceMethod(self, #selector(UIButton.sendAction(_:to:for:)))!
//        let changeAfter: Method = class_getInstanceMethod(self, #selector(UIButton.cs_sendAction(action:to:for:)))!
//        method_exchangeImplementations(changeBefore, changeAfter)
//    }
//    /**
//     在这个方法中判断接收到当前事件的时间间隔是否满足我们所设定的间隔,会一直循环调用到满足才会return
//     */
//    @objc func cs_sendAction(action: Selector, to target: AnyObject?, for event: UIEvent?) {
//        if NSDate().timeIntervalSince1970 - self.cs_acceptEventTime < self.cs_accpetEventInterval {
//            return
//        }
//        if self.cs_accpetEventInterval > 0 {
//            self.cs_acceptEventTime = NSDate().timeIntervalSince1970
//        }
//        self.cs_sendAction(action: action, to: target, for: event)
//    }
    
}


