//
//  FQContentPictureCell.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQContentPictureCell: UIView {

    @IBOutlet weak var bgView: UIImageView!
    
    @IBOutlet weak var isGIFImageView: UIImageView!
    
    @IBOutlet weak var progressView: FQProgressView!
    
    @IBOutlet weak var seeBigPicButton: UIButton!
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    var content: FQContentModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(showPicture))
        pictureImageView.isUserInteractionEnabled = true
        pictureImageView.addGestureRecognizer(tap)
    }
    
    @objc private func showPicture() {
        
        
        
    }
    public static func picture() -> FQContentPictureCell {
        let view = Bundle.main.loadNibNamed("FQContentPictureCell", owner: nil, options: nil)?.first as! FQContentPictureCell
        return view
    }
    
    public func setupView(_ content: FQContentModel) {
        self.content = content
        let url = URL(string: content.large_image)
        
        pictureImageView.kf.setImage(with: url!, placeholder: nil, options: nil, progressBlock: { (receivedSize, expectedSize) in
            self.progressView.isHidden = false
            
            let progress: Double = 1.0 * Double(receivedSize) / Double(expectedSize)
            
            self.progressView.setProgress(progress, duration: 0)
            
        }) { (image, error, cache, url) in
            
            self.progressView.isHidden = true
            
            if !content.isBigPicture { return }
            
            // 开启图形上下文
            UIGraphicsBeginImageContextWithOptions(content.pictureFrame.size, true, 0.0)
            
            // 将下载完的image对象绘制发哦图形上下文
            let width = content.pictureFrame.width
            guard let picture = image else {
                return
            }
            let height = width * picture.size.height / picture.size.width
            picture.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            
            // 获取图片
            self.pictureImageView.image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
        }
        // 是否显示gif图片
        isGIFImageView.isHidden = !content.large_image.hasSuffix("gif")
        
        seeBigPicButton.isHidden = !content.isBigPicture
        
        
        
    }

   
    
}
