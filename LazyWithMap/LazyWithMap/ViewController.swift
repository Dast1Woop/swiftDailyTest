//
//  ViewController.swift
//  LazyWithMap
//
//  Created by LongMa on 2023/6/14.
//

import UIKit

class ViewController: UIViewController {

    let arr = [1,2,3,4]
//                .lazy
        .compactMap { i in
            return 2*i
        }.compactMap { j in
            return j > 5 ? j : nil
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
        print("arr:",arr)
        
        arr.forEach { i in
            print(i)
        }
    }


}

