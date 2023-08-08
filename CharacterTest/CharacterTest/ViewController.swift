//
//  ViewController.swift
//  CharacterTest
//
//  Created by LongMa on 2023/8/8.
//

import UIKit

extension String {
    
    //Extensions里 可以使用 set和get 方法来设置和返回计算属性
    var char:Character
    {
        set {
            
        }
        get {
            return "c"
        }
    }
    
    //Extensions must not contain stored properties
//    var char1:Character = "d"

}

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

