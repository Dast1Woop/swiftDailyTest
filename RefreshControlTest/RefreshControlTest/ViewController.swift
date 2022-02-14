//
//  ViewController.swift
//  RefreshControlTest
//
//  Created by LongMa on 2022/2/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .yellow
        
        let sv = UIScrollView.init(frame: view.bounds)
        view.addSubview(sv)
        
        sv.backgroundColor = .orange
        
        let reC = UIRefreshControl.init()
        reC.addTarget(self, action: #selector(refreshControlNeedUpdate), for: UIControl.Event.valueChanged)
        sv.refreshControl = reC
    }

    @objc func refreshControlNeedUpdate(sender:UIRefreshControl) {
        print(#function)
        print(sender)
        
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 3) {
            sender.endRefreshing()
        }
    }

}

