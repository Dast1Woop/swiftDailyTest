//
//  ViewController.swift
//  PushWithoutAnimateTest
//
//  Created by LongMa on 2022/4/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "hi"
      
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = SecVC.init()
        navigationController?.pushViewController(vc, animated: false)
    }

}

