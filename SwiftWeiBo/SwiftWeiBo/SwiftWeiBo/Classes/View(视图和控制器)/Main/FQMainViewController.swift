//
//  FQMainViewController.swift
//  SwiftWeiBo
//
//  Created by apple-gaofangqiu on 2017/12/26.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQMainViewController: UIViewController {

    var tableView : UITableView?
    
    var refreshControl : UIRefreshControl?
    
    //上拉刷新的标记
    var isPullup = false
    //自定义导航条
    lazy var navgationBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.yw_screenWidth(), height: 64))

    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        loadData()
    
    }

    //加载数据 具体由子类负责
    @objc func loadData() {
        //如果子类不实现 默认关闭刷新
        refreshControl?.endRefreshing()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FQMainViewController {
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navgationBar)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navgationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.yw_height ?? 49, right: 0)
        //设置导航条的缩进
        tableView?.scrollIndicatorInsets  = tableView!.contentInset
        
        //添加刷新控件
        refreshControl = UIRefreshControl()
        let str = NSAttributedString(string: "正在刷新")
        refreshControl?.attributedTitle = str
        tableView?.addSubview(refreshControl!)
        //添加监听方法
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
}

extension FQMainViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        if row < 0 || section < 0 {
            return
        }
        //最后一组的行数
        let count = tableView.numberOfRows(inSection: section)
        //如果是最后一行 同时没有开始上拉刷新
        if (row == count - 1) && !isPullup {
            print("上拉刷新")
            isPullup = true
            //开始刷新
            loadData()
            
        }
    }
    
    
    
}

