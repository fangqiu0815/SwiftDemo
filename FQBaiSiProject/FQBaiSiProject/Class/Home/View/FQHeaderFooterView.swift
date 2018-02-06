//
//  FQHeaderFooterView.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQHeaderFooterView: UITableViewHeaderFooterView {

    lazy var titleLab : UILabel = {
        let label = UILabel(frame: CGRect(x: 5, y: 0, width: 300, height: 30))
        label.textColor = UIColor.lightGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    /// 设置页面
    private func setupUI() {
        contentView.addSubview(titleLab)
        contentView.backgroundColor = UIColor(222, 222, 222, 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
