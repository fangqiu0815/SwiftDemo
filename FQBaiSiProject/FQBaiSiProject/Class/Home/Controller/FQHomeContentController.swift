//
//  FQHomeContentController.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/5.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit
import Alamofire

fileprivate let indentifier = "FQContentCell"

class FQHomeContentController: UITableViewController {

    var a : String{
        return parent.self!.isKind(of: FQNewItemViewController.self) ? "newlist":"list"
    }
    var contents = [FQContentModel]()
    var page: Int = 0
    var maxTime: String = ""
    var type:ContentType = .all
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabUI()
        loadContents()
    }

}

// MARK: - 设置UI界面
extension FQHomeContentController{
    fileprivate func setupTabUI(){
        tableView.register(UINib.init(nibName: "FQContentCell", bundle: nil), forCellReuseIdentifier: indentifier)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.contentInset = UIEdgeInsets(top: kTopHeight + 24, left: 0, bottom: kTabBarHeight, right: 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        tableView.separatorStyle = .none
    }
}


// MARK: - 请求数据
extension FQHomeContentController {
    
    fileprivate func loadContents() {
        page += 1
        FQEssenceDataModel.loadContentsNow(a: a, type: type.rawValue, page: page, maxTime: maxTime) { (isSuccess, maxTime, dataArray) in
            if isSuccess{
                self.maxTime = maxTime
                self.contents += dataArray
                self.tableView.reloadData()
            }else{
                self.page -= 1
            }
        }
    }
}
// MARK: - dataSource
extension FQHomeContentController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: indentifier) as! FQContentCell
        cell.content = contents[indexPath.row]
        if cell == nil {
            cell = FQContentCell(style: .default, reuseIdentifier: indentifier)
        }
        
        if indexPath.row == contents.count - 1 {
            self.loadContents()
        }
        return cell
    }
}
// MARK: - delegate
extension FQHomeContentController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FQCommentViewController()
        vc.content = contents[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return contents[indexPath.row].cellHeight
        
    }
}







