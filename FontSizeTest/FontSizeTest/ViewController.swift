//
//  ViewController.swift
//  FontSizeTest
//
//  Created by LongMa on 2022/2/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let lbl = UILabel.init()
        lbl.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)

        let btn = UIButton.init()
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
    }


}

