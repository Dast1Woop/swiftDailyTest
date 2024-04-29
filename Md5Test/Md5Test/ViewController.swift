//
//  ViewController.swift
//  Md5Test
//
//  Created by LongMa on 2024/4/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Test:
        let md5Hex = "Hello".toMD5HexStr()
        print("md5Hex: \(md5Hex)")
        
        let md5Base64 = "Hello".toMd5ThenBase64()
        print("md5Base64: \(md5Base64)")
            
    }


}

