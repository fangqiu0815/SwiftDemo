//
//  FQContentCell.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQContentCell: UITableViewCell {

    @IBOutlet weak var isVipImage: UIImageView!
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var nameLab: UILabel!
    
    @IBOutlet weak var timeLab: UILabel!
    
    @IBOutlet weak var contentLab: UILabel!
    
    @IBOutlet weak var dingButton: UIButton!
    
    @IBOutlet weak var caiButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var hotCommentView: UIView!
    
    @IBOutlet weak var commentTitleLab: UILabel!
    
    @IBOutlet weak var commentContentLab: UILabel!
    
    lazy var pictureView: FQContentPictureCell = {
        let view = FQContentPictureCell.picture()
        self.contentView.addSubview(view)
        return view
    }()
    lazy var voiceView: FQContentVoiceCell = {
        
        let view = FQContentVoiceCell.voiceView()
        self.contentView.addSubview(view)
        return view
    }()
    lazy var videoView: FQContentVideoCell = {
        let view = FQContentVideoCell.contentVideo()
        self.contentView.addSubview(view)
        return view
    }()
    var content: FQContentModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    func setupUI() {
        
        headerImageView.setHeaderImage(content.profile_image)
        
        nameLab.text = content.name
        timeLab.text = countTime(content.create_time)
        contentLab.numberOfLines = 0
        contentLab.text = content.text
        
        setButtonText(dingButton, content.ding, "顶")
        setButtonText(caiButton, content.cai, "踩")
        setButtonText(shareButton, content.repost, "分享")
        setButtonText(commentButton, content.comment, "评论")
        
        if content.type == ContentType.picture.rawValue {
            pictureView.isHidden = false
            voiceView.isHidden = true
            videoView.isHidden = true
            pictureView.setupView(content)
            if let f = content.pictureFrame {
                pictureView.frame = f
            }
        } else if content.type == ContentType.voice.rawValue {
            pictureView.isHidden = true
            voiceView.isHidden = false
            videoView.isHidden = true
            voiceView.setupView(content)
            if let f = content.voiceFrame {
                voiceView.frame = f
            }
        } else if content.type == ContentType.video.rawValue {
            pictureView.isHidden = true
            voiceView.isHidden = true
            videoView.isHidden = false
            videoView.setupView(withContent: content)
            if let f = content.videoFrame {
                videoView.frame = f
            }
        } else {
            pictureView.isHidden = true
            voiceView.isHidden = true
            videoView.isHidden = true
        }
        
        if let coment = content.top_cmt {
            hotCommentView.isHidden = false
            commentContentLab.text = coment.content
        } else {
            hotCommentView.isHidden = true
        }
    }
    
    fileprivate func setButtonText(_ button: UIButton, _ count: Int,_ placeholder: String)  {
        
        var placeholder = placeholder
        if count >= 1000 {
            placeholder = "\(count / 1000)" + "\(count % 1000)" + " 万"
        }
        else if (count > 0) {
            placeholder = "\(count)"
        }
        button.setTitle(placeholder, for: .normal)
    }
    
    fileprivate func countTime(_ creatTime: String) -> String {
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formater.date(from: creatTime) else {
            return "error"
        }
        if date.isThisYear() {
            let coms = Date().daltaFrom(date)
            if date.isToday() {
                if coms.hour! >= 1 {
                    return "\(coms.hour!)小时之前"
                }
                else if coms.minute! > 1 {
                    return "\(coms.minute!)分钟之前"
                }
                else {
                    return "刚刚"
                }
            }
            else if (date.isYesToday()) {
                formater.dateFormat = "昨天HH:mm:ss";
                return formater.string(from: date)
            }
            else {
                formater.dateFormat = "YY-dd HH:mm:ss";
                return formater.string(from: date)
            }
        }
        else {
            return creatTime
        }
    }
    
}
