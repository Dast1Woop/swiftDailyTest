//
//  ViewController.swift
//  SwiftPackageIntegrateTest
//
//  Created by LongMa on 2021/9/14.
//

import UIKit
import swiftPackageTest

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let test = swiftPackageTest()
        test.hi()
    }


}

