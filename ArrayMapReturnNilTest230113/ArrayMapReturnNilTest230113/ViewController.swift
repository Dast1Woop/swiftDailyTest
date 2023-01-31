//
//  ViewController.swift
//  ArrayMapReturnNilTest230113
//
//  Created by LongMa on 2023/1/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let greeting = "Hello, playground"
        print(greeting)

        let arr = [0, 1, 2]
        
        //需要返回nil时，不能用map，必须用compactMap！！！
        let arr1:[Int] = arr.compactMap {
            num in
            if num < 1 {
                return nil
            }
            return num
        }
        print(arr1)
    }


}

