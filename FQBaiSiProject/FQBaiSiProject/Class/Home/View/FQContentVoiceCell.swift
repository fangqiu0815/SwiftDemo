//
//  FQContentVoiceCell.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQContentVoiceCell: UIView {
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var playCountLab: UILabel!
    
    @IBOutlet weak var voiceTimeLab: UILabel!
    
    @IBOutlet weak var playVoiceBtn: UIButton!
    
    
    static func voiceView() -> FQContentVoiceCell {
        return Bundle.main.loadNibNamed("FQContentVoiceCell", owner: nil, options: nil)!.last as! FQContentVoiceCell
    }
    
    
    public func setupView(_ content: FQContentModel) {
        
        let url = URL(string: content.large_image)
        
        pictureView.kf.setImage(with: url!)
        
        playCountLab.text = "\(content.playcount)播放"
        
        let min = content.voicetime / 60
        
        let second = content.voicetime % 60
        
        voiceTimeLab.text = "\(min):\(second)"
    }
    
    @IBAction func playClick(_ sender: Any) {
        print("点击了播放")
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
}
