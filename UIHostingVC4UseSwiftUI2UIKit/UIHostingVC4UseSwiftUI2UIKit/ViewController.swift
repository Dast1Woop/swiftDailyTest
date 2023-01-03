//
//  ViewController.swift
//  UIHostingVC4UseSwiftUI2UIKit
//
//  Created by LongMa on 2023/1/3.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    private var hostingVC:UIHostingController<CardView>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .yellow
        
        hostingVC = UIHostingController(rootView: CardView())
        guard let hostingVC = hostingVC else {
            return
        }
        
        addChild(hostingVC)
        view.addSubview(hostingVC.view)
        
        hostingVC.view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    }


}

