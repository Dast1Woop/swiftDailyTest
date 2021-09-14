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
        
        view.backgroundColor = .yellow
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let test = swiftPackageTest()
        test.sayHi()
    }
}

