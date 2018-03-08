//
//  FQClassFunc.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/6.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQClassFunc: NSObject {

    /// 数据显示格式的转换 - 千分位分隔符显示数据
    ///
    /// - Parameter numStr: 数据
    /// - Returns: 千分位分隔符
    class func thousandsOfSub_spacesForNumber(numStr: String?) -> String{
        if numStr != nil && numStr != "<null>" && numStr != ""  && numStr != "-"{
            
            let num = Double(numStr!)!
            
            if num < 1000 || num < -1000{
                
                let changeNum = String(format: "%.2f", num)
                return changeNum
            }else {
                let numberFormatter = NumberFormatter()
                numberFormatter.positiveFormat = ",###.00;"
                
                let changeNum = numberFormatter.string(from: NSNumber(value: num))
                return changeNum!
            }
        }
        
        return "0.00"
    }
    
    /// 将字符串替换*号 - 隐藏显示的数据
    ///
    /// - Parameters:
    ///   - str: 字符
    ///   - startindex: 开始字符索引
    ///   - endindex: 结束字符索引
    /// - Returns: 替换后的字符串
    class func stringByX(_ str:String,startindex:Int,endindex:Int) -> String{
        //开始字符索引
        let startIndex = str.characters.index(str.startIndex, offsetBy: startindex)
        //结束字符索引
        let endIndex = str.characters.index(str.startIndex, offsetBy: endindex)
        let range = Range<String.Index>(startIndex..<endIndex)
        var s = String()
        for _ in 0..<endindex - startindex{
            s += "*"
        }
        return str.replacingCharacters(in: range, with: s)
    }
    
    /// 获取随机颜色
    ///
    /// - Returns: 获取随机颜色
    class func randomColorShow() -> UIColor{
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        
        let color = UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: 1)
        return color
    }
    
    
    ///  获取图片的尺寸大小
    ///
    /// - Parameter img: 传入的图片
    /// - Returns: 图片尺寸
    class func getImagePicReallySize(_ img: UIImage) -> CGSize {
        // 找出图片与屏幕的宽高比例，依照先到达为准
        var scale: CGFloat = 0;
        let scaleX = UIScreen.main.bounds.width / img.size.width
        let scaleY = UIScreen.main.bounds.height / img.size.height
        scale = (scaleX > scaleY) ? scaleY : scaleX
        
        // 按比例修改Size
        let size = CGSize(width: img.size.width * scale, height: img.size.height * scale)
        return size
    }
    
    /// 获取字符串的宽度和高度size
    ///
    /// - Parameters:
    ///   - text: 文字
    ///   - font: 文字大小
    ///   - size: 文字尺寸
    /// - Returns: 字符串的宽度和高度size
    class func getTextReallyRectSize(_ text:NSString, font:UIFont, size:CGSize) -> CGRect {
        let attributes = [NSAttributedStringKey.font:font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect
    }
    

    ///     /**获取文字的行数 */
    ///
    /// - Parameters:
    ///   - strW:
    ///   - lagerW:
    /// - Returns:
    class func getHangNumberWithTextString(strW: CGFloat, lagerW: CGFloat) -> Int {
        
        var hang: Int = 1
        if strW.truncatingRemainder(dividingBy: lagerW) == 0.0 {
            hang = Int(strW / lagerW)
        }else {
            hang = Int(strW / lagerW + 1)
        }
        return hang
    }
    
    /// 字符串截取
    ///
    /// - Parameters:
    ///   - words: 字符
    ///   - start: 开始位置
    ///   - end: 结束文职
    /// - Returns: 返回新的字符串
    class func stringBySeperate(_ words: String, start: Int, end: Int) -> String {
        if words == "<null>" {
            return "-"
        }
        let index = words.characters.index(words.startIndex, offsetBy: start)
        let index2 = words.characters.index(words.startIndex, offsetBy: end)
        let range = index ..< index2
        // Range<String.Index>(start: index, end: index2)
        let rangeStr = words.substring(with: range)
        return rangeStr
    }
    
    /// 富文本设置数值与百分号
    ///
    /// - Parameters:
    ///   - textStr: 文字文本
    ///   - textFont: 文字字体大小
    ///   - textLab: 指定label
    ///   - textColor: label字体颜色
    class func settingPercentAndValueForDesign(_ textStr: String, textFont: UIFont, textLab: UILabel, textColor: UIColor) {
        
        
        let color = textColor
        
        let strLength = textStr.count
        if strLength == 0 || textStr == "-"{
            textLab.text = "-"
        }else {
            let mutableAttrStr = NSMutableAttributedString(string: textStr)
            //8.54
            mutableAttrStr.addAttributes([NSAttributedStringKey.font: textFont, NSAttributedStringKey.foregroundColor: color], range: NSMakeRange(0,strLength - 1))
            
            //%
            mutableAttrStr.addAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: color], range: NSMakeRange(strLength - 1,1))
            
            // 富文本显示lab的内容
            textLab.attributedText = mutableAttrStr
        }
    }
    
    //指定年月的开始日期 - //注意这个直接返回的date是0时区的，需要formate转换成字符串，获取当前时区的，才是正确的结果
    class func startOfMonth(year: Int, month: Int) -> NSDate {
        
        let calendar = NSCalendar.current
        let startComps = NSDateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        let startDate = calendar.date(from: startComps as DateComponents)!
        
        return startDate as NSDate
    }
    
    //指定年月的结束日期
    class func endOfMonth(year: Int, month: Int, returnEndTime:Bool = false) -> NSDate {
        let calendar = NSCalendar.current
        let components = NSDateComponents()
        components.month = 1
        if returnEndTime {
            components.second = -1
        } else {
            components.day = -1
        }
        
        let endOfYear = calendar.date(byAdding: components as DateComponents, to: startOfMonth(year: year, month: month) as Date)!
        return endOfYear as NSDate
    }
    
    /// 字典转换成json - 请求时 传送参数-需要传递一个json字符串给服务器
    ///
    /// - Parameter dic: 传入字典
    /// - Returns: json
    class func dictionaryChangeJSON(dic: NSDictionary) -> NSString {
        do {
            let tpDic = try JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.prettyPrinted)
            let changeStr = NSString(data: tpDic, encoding: String.Encoding.utf8.rawValue)
            return changeStr!
        } catch {
            fatalError("转换失败:\(error)")
        }
    }
    
    /// 时间显示
    ///
    /// - Parameter dateTime: <#dateTime description#>
    /// - Returns: <#return value description#>
//    class func friendlyTime(_ dateTime: String) -> String {
//        
//        //日期格式 yyyy年MM月dd日 HH:mm:ss
//        let dateFormatter: DateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        
//        if let date = dateFormatter.date(from: dateTime) {
//            let delta = Date().timeIntervalSince(date)//获得秒数
//            if delta < 3600 { //一个小时内
//                if delta <= 0 {
//                    return Language.getStrings(name: time_just) //刚刚
//                }else if (delta < 60) { //几秒以前
//                    return "\(Int(delta)) "+Language.getStrings(name: time_SecondAgo)
//                }else{ //几分钟以前
//                    return "\(Int(delta / 60)) " + Language.getStrings(name: time_MinuteAgo)
//                }
//            }else if delta == 3600 { //1小时
//                return "1 " + Language.getStrings(name: time_Hour)
//            }else{
//                let calendar = Calendar.current
//                let unitFlags: NSCalendar.Unit = [NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day, NSCalendar.Unit.hour, NSCalendar.Unit.minute, NSCalendar.Unit.second]
//                let comp = (calendar as NSCalendar).components(unitFlags,from:Date())
//                let currentYear = comp.year!
//                let currentMonth = comp.month!
//                let currentDay = comp.day!
//                let currentHour = comp.hour!
//                
//                let compSec = (calendar as NSCalendar).components(unitFlags,from: date)
//                let year = compSec.year!
//                let month = compSec.month!
//                let day = compSec.day!
//                let hour = compSec.hour!
//                var minute = compSec.minute!
//                
//                //设置分为两位 16:7--16:07
//                if compSec.minute! < 10 {
//                    let temp = "0\(minute)"
//                    minute = Int(temp)!
//                }
//                
//                //检查是不是在同一天
//                if currentYear == year && currentMonth == month && currentDay == day {
//                    let divHour = currentHour - hour
//                    return "\(divHour) " + Language.getStrings(name: time_HourAgo)
//                }else{//不在同一天
//                    if currentYear == year && currentMonth == month {
//                        let divDay = currentDay - day
//                        if divDay == 1 {
//                            return Language.getStrings(name: time_Yesterday) + " \(hour):\(minute)"
//                        }else{
//                            return "\(year)-\(month)-\(day) \(hour):\(minute)"
//                        }
//                    }else{
//                        let divMonth = currentMonth - month
//                        if currentDay == 1 && (divMonth == 1 || (currentMonth == 1 && month == 12)){
//                            return Language.getStrings(name: time_Yesterday) + " \(hour):\(minute)"
//                        }else{
//                            return "\(year)-\(month)-\(day) \(hour):\(minute)"
//                        }
//                    }
//                }
//            }
//        }
//        return ""
//    }
    
    /** 绘制左上角和右上角的两个圆角 */
    class func drawTopCorner(rect: CGRect, vi: UIView, borderColor: UIColor) {
        //切左上右上圆角
        let maskPath = UIBezierPath(roundedRect:vi.bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 5.0, height: 5.0))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = vi.bounds
        maskLayer.path = maskPath.cgPath
        vi.layer.mask = maskLayer
        
        //添加border
        let borderLayer = CAShapeLayer()
        borderLayer.frame = vi.bounds
        borderLayer.path = maskPath.cgPath
        borderLayer.lineWidth = 0.5
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        
        let layers:NSArray = vi.layer.sublayers! as NSArray
        
        if (((layers.lastObject! as! CALayer).isKind(of: CAShapeLayer.self))) {
            (layers.lastObject as AnyObject).removeFromSuperlayer()
        }
        vi.layer.addSublayer(borderLayer)
    }
    
    /** 绘制左下角和右下角的两个圆角 */
    class func drawBottomCorner(rect: CGRect, vi: UIView, borderColor: UIColor) {
        //切左下右下圆角
        let maskPath = UIBezierPath(roundedRect:vi.bounds, byRoundingCorners:[.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 5.0, height: 5.0))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = vi.bounds
        maskLayer.path = maskPath.cgPath
        vi.layer.mask = maskLayer
        
        
        //添加border
        let borderLayer = CAShapeLayer()
        borderLayer.frame = vi.bounds
        borderLayer.path = maskPath.cgPath
        borderLayer.lineWidth = 0.5
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        
        let layers:NSArray = vi.layer.sublayers! as NSArray
        
        if (((layers.lastObject! as! CALayer).isKind(of: CAShapeLayer.self))) {
            (layers.lastObject as AnyObject).removeFromSuperlayer()
        }
        vi.layer.addSublayer(borderLayer)
    }
    
    
    
    
    
}
