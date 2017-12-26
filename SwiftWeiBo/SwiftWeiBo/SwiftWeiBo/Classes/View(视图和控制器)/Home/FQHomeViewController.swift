//
//  FQHomeViewController.swift
//  SwiftWeiBo
//
//  Created by apple-gaofangqiu on 2017/12/26.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

import UIKit

class FQHomeViewController: FQMainViewController {

    private lazy var statusList = [String]()
    
    
    override func loadData(){
        // 模拟 延时加载数据
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            
            for i in 0..<15 {
                self.statusList.insert(i.description, at: 0);
            }
            //结束刷新
            self.refreshControl?.endRefreshing()
            self.tableView?.reloadData()
        }
    }
    
    @objc private func showFriends(){
        
    }
    
}

extension FQHomeViewController
{
    
    
}


