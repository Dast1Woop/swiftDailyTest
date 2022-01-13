//
//  ViewController.swift
//  for..<test
//
//  Created by LongMa on 2022/1/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let end = -1
        
        //Fatal error: Range requires lowerBound <= upperBound
        for i in 0..<end{
            print(i)
        }
    }


}

