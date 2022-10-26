//
//  ViewController.swift
//  CodableTest
//
//  Created by LongMa on 2022/10/26.
//

import UIKit

class ViewController: UIViewController {
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testEncode()
        testDecode()
    }

    private func testEncode(){
        let p1 = Person(name: "lilei", age: 18)
        do {
            let data: Data = try encoder.encode(p1)
            let str = String(data: data, encoding: .utf8)
            
            //str= Optional("{\"name\":\"lilei\",\"age\":18}")
            print("str=", str as Any)
            
        }catch {
            print("err:%@", error.localizedDescription)
        }
    }
    
    private func testDecode(){
        let jsonStr = "{\"name\":\"lilei\",\"age\":18}"
        let data = jsonStr.data(using: .utf8)
        guard let data = data else {
            return
        }
        
        do {
            let p1 = try decoder.decode(Person.self, from: data)
            
            //p1= lilei, 18
            print("p1=", p1.description)
            
        }catch {
            print("err:%@", error.localizedDescription)
        }
    }

}

