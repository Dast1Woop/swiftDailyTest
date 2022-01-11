//
//  ViewController.swift
//  R.swiftModuleTest
//
//  Created by LongMa on 2022/1/10.
//

import UIKit
import RswiftLib
import LibA
import LibB

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgV1: UIImageView!
    
    
    @IBOutlet weak var imgV2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
       testRswiftLib()
        
        testLibA()
        testLibB()
    }
    
    private func testRswiftLib(){
        imgV1.image = R.image.tab_home()
        imgV2.image = R.image.tab_ride1()
//        imgV2.image = R.image.htmap1()
        imgV2.image = R.image.console()
    }
    
    private func testLibA(){
        LibAHi.hi()
        let img = LibAHi.getImageA()
        print(img as Any)
        imgV1.image = img
    }

    private func testLibB(){
        LibBHello.hello()
        let img = LibBHello.getImageB()
        print(img as Any)
        imgV2.image = img
    }
}

