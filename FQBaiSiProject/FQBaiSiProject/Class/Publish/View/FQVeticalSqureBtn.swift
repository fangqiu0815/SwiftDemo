//
//  FQVeticalSqureBtn.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/6.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit
import Kingfisher

class FQVeticalSqureBtn: UIButton {

    var content: FQMeFootModel? {
        didSet{
            guard let name = content?.name, let icon = content?.icon, let url = URL(string: icon) else {
                return
            }
            setTitleColor(UIColor.darkGray, for: .normal)
            setBackgroundImage(UIImage.init(named: "mainCellBackground"), for: .normal)
            addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
            setTitle(name, for: .normal)
            kf.setImage(with: url, for: .normal)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageViewWH: CGFloat = 50
        let margin: CGFloat = 10
        imageView?.frame = CGRect(x: yj_center.x - imageViewWH / 2.0, y: margin, width: imageViewWH, height: imageViewWH)
        
        titleLabel?.frame = CGRect(x: 0, y: imageViewWH + margin, width: frame.width, height: frame.height - imageViewWH - margin)
    }
    
}


// MARK: - 设置UI
extension FQVeticalSqureBtn {
    
    fileprivate func setupUI() {
        titleLabel?.textAlignment = .center
        
        titleLabel?.font = UIFont.systemFont(ofSize: 13)
        titleLabel?.adjustsFontSizeToFitWidth = true
        
    }
}



// MARK: - 按钮点击事件
extension FQVeticalSqureBtn {
    @objc fileprivate func click(_ btn: FQVeticalSqureBtn){
        
        guard let url = content?.url else {
            return
        }
        
        guard url.hasPrefix("http:") else {
            return
        }
        guard let tab = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController else {
            return
        }
//        let webVC = MeWebViewController()
//        webVC.urlString = url
//        webVC.btnTitle = content?.name ?? ""
//        let vc = tab.childViewControllers[tab.selectedIndex] as! MainNavigationController
//
//        print(vc)
//        vc.pushViewController(webVC, animated: true)
    }
}

