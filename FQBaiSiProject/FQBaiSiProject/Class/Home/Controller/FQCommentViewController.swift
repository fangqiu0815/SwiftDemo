//
//  FQCommentViewController.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

fileprivate let cellID = "FQCommentCell"
fileprivate let headerID = "FQHeaderFooterView"

class FQCommentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    
    var commentVM = FQCommentDataModel()
    /// 传入的模型
    var content: FQContentModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataNow(firstLoad: true)
        NotificationCenter.default.addObserver(self, selector: #selector(changeViewFrame(_:)), name: NSNotification.Name.init("UIKeyboardWillChangeFrameNotification"), object: nil)
        
        setupHeaderView()
        
        tableView.register(FQHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerID)
        tableView.register(UINib.init(nibName: "FQCommentCell", bundle: nil), forCellReuseIdentifier: cellID)
        
    }
    @objc private func changeViewFrame(_ notoficaion: Notification) {
        
        // 显示或者隐藏完毕的frame
        let frame = notoficaion.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        let constant = kScreenHeight - frame.origin.y
        // 修改底部约束
        viewBottomConstraint.constant = (kScreenHeight == iPhoneXHeight) ? (constant - kTabBarHeight) : constant
        // 动画时间
        let duration = notoficaion.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func setupHeaderView() {
        
        let cell = Bundle.main.loadNibNamed("FQContentCell", owner: nil, options: nil)?.last as! FQContentCell
        cell.content = content
        cell.setupUI()
        let frame = cell.frame
        let x = frame.origin.x
        let y = frame.origin.y
        let w = frame.width
        cell.frame = CGRect(x: x, y: y, width: w, height: content.cellHeight)
        tableView.tableHeaderView = cell
    }
    
}

extension FQCommentViewController: UITableViewDataSource {
    
    fileprivate func commentsInSection(_ section: Int) -> [FQCommentModel] {
        if section == 0 {
            return commentVM.hotComments.count > 0 ? commentVM.hotComments : commentVM.newComments
        }
        return commentVM.newComments
    }
    
    fileprivate func commentInIndexPath(_ indexPath: IndexPath) -> FQCommentModel {
        return commentsInSection(indexPath.section)[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if commentVM.hotComments.count > 0 {
            if section == 0 {return commentVM.hotComments.count}
            return commentVM.newComments.count
        }
        if commentVM.newComments.count > 0 { return commentVM.newComments.count }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if commentVM.hotComments.count > 0 { return 2 }
        if commentVM.newComments.count > 0 { return 1 }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! FQCommentCell
        cell.setupUI(commentInIndexPath(indexPath))
        
        if indexPath.row == commentVM.newComments.count - 1 && commentVM.canLoadMore {
            commentVM.loadData(contentID: content.ID, boolFirstLoad: false){
                self.tableView.reloadData()
            }
        }
        
        return cell
    }
}

extension FQCommentViewController: UITableViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(false)
    }
    
    // 使用循环引用的HearderView
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! FQHeaderFooterView
        if commentVM.hotComments.count > 0 {
            if section == 0 {
                view.titleLab.text = "最热"
            }else {
                view.titleLab.text = "最新"
            }
        } else {
            if commentVM.newComments.count > 0 { view.titleLab.text = "最新" }
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let menu = UIMenuController.shared
        if menu.isMenuVisible {
            menu.setMenuVisible(false, animated: true)
            return
        }
        let cell = tableView.cellForRow(at: indexPath) as! FQCommentCell
        cell.becomeFirstResponder()
        
        let copyItem = UIMenuItem(title: "复制", action: #selector(copyClick(_:)))
        let dingItem = UIMenuItem(title: "顶", action: #selector(dingClick(_:)))
        let reportItem = UIMenuItem(title: "举报", action: #selector(reportClick(_:)))
        menu.menuItems = [copyItem, dingItem, reportItem]
        
        let rect = CGRect(x: 0, y: cell.frame.height / 2, width: cell.frame.width, height: cell.frame.height)
        // 设置显示的位置 区域
        menu.setTargetRect(rect, in: cell)
        menu.setMenuVisible(true, animated: true)
        
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        UIMenuController.shared.setMenuVisible(false, animated: true)
    }
    @objc fileprivate func copyClick(_ menu: UIMenuController) {
        
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        let text = commentInIndexPath(indexPath).content
        
        let paste = UIPasteboard.general
        
        paste.string = text
        
    }
    @objc fileprivate func dingClick(_ menu: UIMenuController) {
        
    }
    @objc fileprivate func reportClick(_ menu: UIMenuController) {
        
    }
}
extension FQCommentViewController{
    fileprivate func loadDataNow(firstLoad: Bool) {
        commentVM.loadData(contentID: content.ID, boolFirstLoad: firstLoad){ [weak self] in
            
            self?.tableView.reloadData()
        }
    }
}

    


