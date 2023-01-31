//
//  ViewController.swift
//  CollectionSafeBounds
//
//  Created by LongMa on 2023/1/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        collectionSafeBoundsTest1()
        collectionSafeBoundsTest2()
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        collectionSafeBoundsTest3()
    }
    
    private func collectionSafeBoundsTest1() {
        let arr = [0, 1, 2, 3]
        
        /// Fatal error: Index out of range
        print(arr[100])
    }

    private func collectionSafeBoundsTest2() {
        let arr = [0, 1, 2, 3]
        guard let ele = arr[safe: 100] else {
            print("下标超出集合边界！")
            return
        }
        print(ele)
    }
    
    private func collectionSafeBoundsTest3() {
        let arr = [0, 1, 2, 3]
        guard let ele = arr[safe: 1] else {
            print("下标超出集合边界！")
            return
        }
        print(ele)
    }


}

