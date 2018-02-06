//
//  FQBaseViewController.swift
//  FQBaiSiProject
//
//  Created by apple-gaofangqiu on 2018/2/2.
//  Copyright © 2018年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQBaseViewController: UIViewController {

    //访客视图信息字典
    var visitorInfoDic :[String:String]?
    
    //表格视图 -J' 如果用户没有登录，就不创建
    var tableView: UITableView?
    //自定义导航条
    lazy var navgationBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 64))
    /// 设置navigationitem
    lazy var navItem = UINavigationItem()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

// MARK: - 设置tableview
extension FQBaseViewController
{
    //登录成功
    @objc fileprivate func loginSuccess(noti: Notification){
        print("登录成功")
        
        navItem.leftBarButtonItem = nil
        navItem.rightBarButtonItem = nil
        // view = nil 会重新调用 loadview -> viewDidLoad
        view = nil
        
        //注销通知 ->重新执行viewDidLoad 会再次被注册 避免通知重复注册 会重复通知的（发多次的情况）
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc fileprivate func login() {
        
        print("用户登录")
        //发送通知
//        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: YWUserShouldLoginNotification), object: nil, userInfo: nil))
    }
    
    @objc fileprivate func register() {
        
        print("用户注册")
    }
}


// MARK: - 设置tableview
extension FQBaseViewController
{
    fileprivate func initUI() {
        view.backgroundColor = UIColor.white
        //取消自动缩进 - 如果隐藏了导航栏 会缩进20点
        automaticallyAdjustsScrollViewInsets = false
        steupNavigationBar()
        setupUI()
    }
    
    func setupUI() {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navgationBar)
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        //设置内容缩进
        tableView?.contentInset = UIEdgeInsets(top: navgationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.yj_height ?? 49, right: 0)
        //设置导航条的缩进
        tableView?.scrollIndicatorInsets  = tableView!.contentInset
        
        
    }
    
    ///设置导航栏
    private func steupNavigationBar() {
        view.addSubview(navgationBar)
        //将item 设置给barnj
        navgationBar.items = [navItem]
        //设置 navBar 的渲染颜色
        navgationBar.barTintColor = UIColor.withHex(hexString: "#FF0000")
        //设置navBar 的标题字体颜色
        navgationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.darkGray]
        //设置系统按钮的文字渲染颜色  只对系统.plain 的方法有效
        navgationBar.tintColor = UIColor.white
    }
    
    
}

// MARK: - 代理方法
extension FQBaseViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    //基类只是准备方法 子类负责具体实现  子类发数据源方法不需要super
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //只是保证没有语法错误
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    //在显示最后一行的时候 做上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 判断indexpath 是否最后一行
//        let row = indexPath.row
//        //取最后一组
//        let section = tableView.numberOfSections - 1
//        if row < 0 || section < 0 {
//            return
//        }
//        //最后一组的行数
//        let count = tableView.numberOfRows(inSection: section)
//        //如果是最后一行 同时没有开始上拉刷新
//        if (row == count - 1) && !isPullup {
//            print("上拉刷新")
//            isPullup = true
//            //开始刷新
//            loadData()
//
//        }
    }
}




