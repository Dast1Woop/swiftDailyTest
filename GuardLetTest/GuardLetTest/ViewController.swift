//
//  ViewController.swift
//  GuardLetTest
//
//  Created by LongMa on 2022/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }
    
    func test(){
        
        let config :[String:Any]? = ["key":true]
        let loopBool = true
        
        //这个代码好丑， 怎么用guard let改造下？
        //        repeat {
        //            let value = config?["key"] as? Bool ?? false
        //            if value {
        //                break;
        //            }
        //
        //        } while (loopBool);
        
        guard let config = config else {
            return
        }
        
        repeat {
            let value = config["key"] as? Bool
            if let value = value, value == true {
                break
            }
            
            print("do something")
        } while (loopBool);
        
    }
    
    
}

