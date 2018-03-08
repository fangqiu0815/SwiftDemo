//
//  FQCommon.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/2.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

let kCellTextMargin: CGFloat = 15
let kCellHeaderHeight: CGFloat = 65
let kCellFooterHeight: CGFloat = 54
let kCellIamgeMaxH: CGFloat = 1500
let kCellImageBreakHeight: CGFloat = 250
let kStatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
let iPhoneXHeight: CGFloat = 812
let kNavBarHeight:CGFloat = 44.0

/*代替之前的49*/
let kTabBarHeight: CGFloat = (UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0:49.0)

/*代替之前的64*/
let kTopHeight = kStatusBarHeight + kNavBarHeight

let kScreenWidth = UIScreen.main.bounds.width

let kScreenHeight = UIScreen.main.bounds.height

enum ContentType: Int {
    case all = 1
    case picture = 10
    case word = 29
    case voice = 31
    case video = 41
}

// MARK: - 打印方法
func printLog<T>(_ message:T,
                       file: String = #file,
                       method: String = #function,
                       line: Int = #line) {
        #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)],\(method):\(message)")
        #endif
    
}

// MARK: - 字典转json
func dictionaryChangeJSON(dic: NSDictionary) -> NSString {
    do {
        let tpDic = try JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.prettyPrinted)
        let changeStr = NSString(data: tpDic, encoding: String.Encoding.utf8.rawValue)
        return changeStr!
    } catch {
        fatalError("转换失败:\(error)")
    }
}











