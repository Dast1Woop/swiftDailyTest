//
//  ViewController.swift
//  RetainCycleTest
//
//  Created by LongMa on 2021/8/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = SecVC.init()
        present(vc, animated: true) {
            
        }
    }


}

