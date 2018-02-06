//
//  FQCommentCell.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQCommentCell: UITableViewCell {
    @IBOutlet weak var headerImgView: UIImageView!
    
    @IBOutlet weak var maleImgView: UIImageView!
    @IBOutlet weak var nameLab: UILabel!
    
    @IBOutlet weak var dingButton: UIButton!
    
    @IBOutlet weak var dingCountLab: UILabel!
    
    @IBOutlet weak var commentContentLab: UILabel!
    
    public func setupUI(_ comment: FQCommentModel) {
        
        headerImgView.setHeaderImage(comment.user.profile_image)
        
        maleImgView.image = comment.user.sex == "m" ? UIImage(named: "Profile_manIcon") : UIImage(named: "Profile_womanIcon")
        
        nameLab.text = comment.user.username
        
        dingButton.setTitle(comment.content, for: .normal)
        
        dingCountLab.text = "\(comment.like_count)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - 设置为true 让自身成为第一响应者
    override var canBecomeFirstResponder: Bool {
        return true
    }
    // MARK: - 设置为false 不使用系统自带的item
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
}
