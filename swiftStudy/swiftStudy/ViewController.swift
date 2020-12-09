//
//  ViewController.swift
//  swiftStudy
//
//  Created by LongMa on 2020/12/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testYuShu()
//        testCmpTuple()
//        testRangeOperater()
        
        testArrary()
    }
    
    func testArrary(){
        let arr = [8,7,6,5]
        
        //enumerated方法，方便在需要知道元素下标的情况下遍历
        for (index,ele) in arr.enumerated() {
            print(index,ele)
        }
    }
    
    func testRangeOperater()  {
        let range0 = 0...
        for i in range0 {
            if i == 10 {
                break;
            }
            print(i)
        }
        
        //(负无穷,5]
        let range1 = ...5
        print(range1)
        print(range1.contains(-100),
              range1.contains(5),
              range1.contains(6))
        
        //[0,5)
        let range2 = 0..<5
        print(range2)
    }
    
    func testCmpTuple() {
        
        //true,元组是从前往后逐个比较，根据整体比较的结果返回的。如下分析：3==3，比较后面，apple < bird，成立，故整体上(3, "apple") < (3, "bird")成立！
        let rlst = (3, "apple") < (3, "bird")
        print(rlst)
        
        let rlst1 = (3, "apple") <= (3, "bird")
        print(rlst1)
    }
    
    func testYuShu(){
        
        //%在 c/oc/c++/swift 中，称为取余，不是取模。结果负号与a相同
        let yuShu0 = -11 % 4
        print(yuShu0)
        
        let yuShu0_1 = -11 % -4
        print(yuShu0_1)

        
        let yuShu1 = 11 % 4
        print(yuShu1)
        
        let yuShu2 = 11 % -4
        print(yuShu2)
        
        let yuShu3 = 11 % -4
        print(yuShu3)
    }

    func testAssertionAndPrecondition()  {
        let age = 15
        guard age > 10 else {
            return;
        }
        print("age\(age) is > 10")
        
        let gender = "male"
        
        /*The difference between assertions and preconditions is in when they’re checked: Assertions are checked only in debug builds, but preconditions are checked in both debug and production builds. In production builds, the condition inside an assertion isn’t evaluated. This means you can use as many assertions as you want during your development process, without impacting performance in production.
         */
        //assert只在debug模式有效
//        assert(gender == "female", "gender must be female")
        
        //precondition，debug和release都有效
//        precondition(gender == "female", "gender must be female")
    }

}

