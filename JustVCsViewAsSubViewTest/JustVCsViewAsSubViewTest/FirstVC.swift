//
//  FirstVC.swift
//  JustVCsViewAsSubViewTest
//
//  Created by LongMa on 2020/12/9.
//

import Foundation
import UIKit

class FirstVC:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        print(#function)
    }
    
    @IBAction func btnDC(_ sender: Any) {
        print(#function)
    }
}
