//
//  ViewController.swift
//  EqualTableTest
//
//  Created by LongMa on 2022/2/14.
//

import UIKit

struct Student:Equatable,Comparable {
    static func < (lhs: Student, rhs: Student) -> Bool {
        guard let ageL = lhs.age, let ageR = rhs.age else{
            return false
        }
        return ageL < ageR
    }
    
    var name:String?
    var age:Int?
    var isDangYuan:Bool?
    
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let s1 = Student.init(name: "lilei", age: 8, isDangYuan: false)
        let s2 = Student.init(name: "lilei", age: 8, isDangYuan: false)
        let s3 = Student.init(name: "lilei1", age: 8, isDangYuan: false)
        let s4 = Student.init(name: "lilei", age: 9, isDangYuan: false)
        let s5 = Student.init(name: "lilei", age: 8, isDangYuan: true)
        
        print(s1 == s2)
        print(s1 == s3)
        print(s1 == s4)
        print(s1 == s5)
        print("---")
        print(s1 < s2)
        print(s1 < s3)
        print(s1 < s4)
        print(s1 < s5)
    }


}

