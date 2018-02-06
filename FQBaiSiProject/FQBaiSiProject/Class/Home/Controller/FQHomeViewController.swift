//
//  FQHomeViewController.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/2.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQHomeViewController: UIViewController {
    
    /// 标题内容
    var titles = ["全部","视频","声音","图片","段子"]
    /// 滑动的View
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    lazy var contentView:UIScrollView = {
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize = CGSize(width: self.view.yj_width*CGFloat(self.titles.count), height: 0)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        return scrollView
    
    }()
    
    var currentBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            contentView.contentInsetAdjustmentBehavior = .never
        }else{
            
            automaticallyAdjustsScrollViewInsets = false
        }
        
        setupUI()
        setupChildViewControllers()
        
        scrollViewDidEndDecelerating(contentView)
    }
    
    
}

extension FQHomeViewController
{
    fileprivate func setupUI() {
        view.addSubview(contentView)
        setupTitleView()
        navigationItem.titleView = UIImageView(image: UIImage(named: "MainTitle"))
        // 设置导航栏左边的按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: "MainTagSubIcon", highImage: "MainTagSubIconClick", target: self, action: #selector(tagClick))
    }
    
    /// 设置TitleView
    private func setupTitleView() {
        
        let titleView = UIView(frame: CGRect(x: 0, y: kTopHeight, width: view.yj_width, height: 35))
        titleView.backgroundColor = UIColor.init(white: 1.0, alpha: 0.7)
        view.addSubview(titleView)
        
        for i in 0..<titles.count {
            let button = UIButton(type: .custom)
            button.tag = 100 + i
            button.setTitle(titles[i], for: .normal)
            button.setTitleColor(UIColor.darkGray, for: .normal)
            button.setTitleColor(UIColor.red, for: .disabled)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.addTarget(self, action: #selector(clickTypeTitleView(_:)), for: .touchUpInside)
            let width = titleView.yj_width / CGFloat(titles.count)
            let height = titleView.yj_height
            button.frame = CGRect(x: CGFloat(i) * width, y: 0, width: width, height: height - 2)
            
            titleView.addSubview(button)
            if i == 0 {
                button.titleLabel?.sizeToFit()
                self.bottomView.frame = CGRect(x: 0, y: 0, width: button.titleLabel!.yj_width, height: 2)
                self.bottomView.center = CGPoint(x: button.center.x, y:button.yj_height + 1)
                titleView.addSubview(bottomView)
                clickTypeTitleView(button)
            }
        }
    }
    
    func setupChildViewControllers() {
        for i in 0..<5 {
            let vc = FQHomeContentController()
            switch i {
            case 0:
                vc.type = .all
            case 1:
                vc.type = .video
            case 2:
                vc.type = .voice
            case 3:
                vc.type = .picture
            case 4:
                vc.type = .word
            default:
                vc.type = .all
            }
            addChildViewController(vc)
        }
    }
    
}

extension FQHomeViewController:UIScrollViewDelegate
{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        let index = scrollView.contentOffset.x / scrollView.yj_width
        clickTypeTitleView(view.viewWithTag(100 + Int(index)) as! UIButton)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.yj_width
        let vc = childViewControllers[Int(index)]
        vc.view.frame = CGRect(x: index * contentView.yj_width, y: 0, width: contentView.yj_width, height: contentView.yj_height)
        contentView.addSubview(vc.view)
    }
    
}

extension FQHomeViewController
{
    @objc fileprivate func clickTypeTitleView(_ sender: UIButton){
    
        currentBtn.isEnabled = true
        currentBtn = sender
        currentBtn.isEnabled = false
        
        UIView.animate(withDuration: 0.25) {
            self.bottomView.frame = CGRect(x: 0, y: 0, width: self.currentBtn.titleLabel!.yj_width, height: 2)
            self.bottomView.center = CGPoint(x: self.currentBtn.center.x, y:self.currentBtn.yj_height + 1)
        }
        
        var offSet = contentView.contentOffset
        offSet.x = CGFloat(sender.tag - 100) * contentView.yj_width
        contentView.setContentOffset(offSet, animated: true)
        
        
    }
    
    @objc fileprivate func tagClick(){
        let vc = UIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}











