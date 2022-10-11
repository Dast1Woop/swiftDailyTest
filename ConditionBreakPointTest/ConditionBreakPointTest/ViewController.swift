//
//  ViewController.swift
//  ConditionBreakPointTest
//
//  Created by LongMa on 2022/10/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.orange
        
        for i in 0..<6 {
            print(i)
            
            let j = "k\(i + 1)"
            print(j)//set condition breakpoint: j == "k4"
            
        }
    }


}

