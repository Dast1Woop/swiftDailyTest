//
//  ViewController.swift
//  AppOpenUrlOfWebTest
//
//  Created by LongMa on 2023/6/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let lUrl = NSURL.init(string: "https://www.baidu.com/") as? URL
        guard let lUrl else {
            return
        }
        if UIApplication.shared.canOpenURL(lUrl) {
            UIApplication.shared.openURL(lUrl)
        }
    }


}

