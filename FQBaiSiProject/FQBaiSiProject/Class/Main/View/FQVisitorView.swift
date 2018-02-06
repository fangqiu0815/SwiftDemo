//
//  FQVisitorView.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQVisitorView: UIView {

    //注册按钮
    lazy var registerBtn: UIButton  = UIButton.button(title: "注册", titleColor: UIColor.orange, imageName: "common_button_white_disable", backgroundColor: UIColor.clear, highlightedColor: UIColor.clear, cornerRadius: 0, fontsize: 16)
    //登录按钮
    lazy var loginBtn: UIButton  = UIButton.button(title: "登录", titleColor: UIColor.darkGray, imageName: "common_button_white_disable", backgroundColor: UIColor.clear, highlightedColor: UIColor.clear, cornerRadius: 0, fontsize: 16)
    
    /// 根据字典设置访客视图信息
    ///
    /// - parameter dic: ：[imageName/message]
    var visitorInfo:[String: String]?{
        
        didSet{
            //取字典信息
            guard  let imageName = visitorInfo?["imageName"],
                let message = visitorInfo?["message"] else{
                    return
            }
            //设置消息
            tipLabel.text = message
            //首页默认已有 不需要 设置图像
            if imageName == "" {
                //首页 图标转动
                startAnimation()
                return
            }
            iconView.image = UIImage(named: imageName)
            //其他访客视图不要显示小房子和遮罩视图
            houseIconView.isHidden = true
            maskIconView.isHidden = true
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 开启动画旋转
    // MARK: - 开启动画旋转
    fileprivate func startAnimation(){
        
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2 * Double.pi
        anim.repeatCount = MAXFLOAT
        anim.duration = 15
        //完成之后是否删除 如果iconView 被释放 动画会一起销毁
        anim.isRemovedOnCompletion = false
        //将动画添加到图层
        iconView.layer.add(anim, forKey: nil)
    }
    
    // MARK: - 私有控件
    //懒加载属性 主要调用 UIkit 控件的在指定构造函数 其他都需要使用类型
    fileprivate lazy var iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //小房子
    fileprivate lazy var houseIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //提示标签
    fileprivate lazy var tipLabel:UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.darkGray
        label.text = "关注一些人，回这里看看有什么惊喜"
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    //遮罩
    fileprivate lazy var maskIconView = UIImageView(image: UIImage(named:"visitordiscover_feed_mask_smallicon"))
    
    
}

extension FQVisitorView
{
    func initVisitorUI() {
        backgroundColor = UIColor.white
        
        //添加控件
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(houseIconView)
        addSubview(tipLabel)
        addSubview(registerBtn)
        addSubview(loginBtn)
        
        tipLabel.textAlignment = .center
        
        //取消 autoresizing
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let _:CGFloat = 20.0
        
        
        
    }
    
    
}



