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
        
        let suggestionWebVC = MYCommonWebVC.init(title: NSLocalizedString("意见栏", comment: ""), url: "https://www.dsat.gov.mo/dsat/suggestion.aspx")
        addChild(suggestionWebVC)
        view.addSubview(suggestionWebVC.view)
        
        suggestionWebVC.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        suggestionWebVC.view.backgroundColor = .orange
    }


}

