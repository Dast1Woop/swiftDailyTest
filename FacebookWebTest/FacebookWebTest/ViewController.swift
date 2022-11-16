//
//  ViewController.swift
//  FacebookWebTest
//
//  Created by LongMa on 2022/10/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("fadfasf")
        
        let suggestionWebVC = MYCommonWebVC.init(title: NSLocalizedString("意见栏", comment: ""), url: "http://www.baidu.com/s?&wd=%E8%A5%BF%E7%93%9C")
        addChild(suggestionWebVC)
        view.addSubview(suggestionWebVC.view)
        
        suggestionWebVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        suggestionWebVC.view.backgroundColor = .orange
    }


}

