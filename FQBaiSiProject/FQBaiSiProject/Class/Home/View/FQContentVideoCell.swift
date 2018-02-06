//
//  FQContentVideoCell.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQContentVideoCell: UIView {

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var pictureImgView: UIImageView!
    
    @IBOutlet weak var playVideoBtn: UIButton!
    
    @IBOutlet weak var playCountLab: UILabel!
    
    @IBOutlet weak var videoTimeLab: UILabel!
    
    static public func contentVideo() -> FQContentVideoCell {
        return Bundle.main.loadNibNamed("FQContentVideoCell", owner: nil, options: nil)?.last as! FQContentVideoCell
        
    }
    
    public func setupView(withContent content: FQContentModel) {
        
        let url = URL(string: content.large_image)
        
        pictureImgView.kf.setImage(with: url!)
        
        playCountLab.text = "\(content.playcount)播放"
        
        let min = content.videotime / 60
        
        let second = content.videotime % 60
        
        videoTimeLab.text = String(format: "%02d:%02d", min, second)
        
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playCountLab.layer.cornerRadius = 3;
        videoTimeLab.layer.cornerRadius = 3;
    }

    
    
}
