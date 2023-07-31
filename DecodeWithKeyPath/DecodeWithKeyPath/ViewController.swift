//
//  ViewController.swift
//  DecodeWithKeyPath
//
//  Created by LongMa on 2023/7/31.
//

import UIKit

class ViewController: UIViewController {
    
    let jsonStr0 = """
{
  "users": [
    {
      "name": "John Doe",
      "age": 30,
      "email": "johndoe@example.com"
    },
    {
      "name": "Jane Smith",
      "age": 28,
      "email": "janesmith@example.com"
    }
  ]
}
"""
    
    let jsonStr1 = """
{
  "users":
    {
      "name": "John Doe",
      "age": 30,
      "email": "johndoe@example.com"
    }
}
"""
    
    ///暂不考虑，一般要跟后台数据机构保持一致
    let jsonStr2 = """
{
 "data": {
          "users":
            {
              "name": "John Doe",
              "age": 30,
              "email": "johndoe@example.com"
            }
        }
}
"""
   
    var json0Data:Data?
    var json1Data:Data?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        json0Data = jsonStr0.data(using: .utf8)
        json1Data = jsonStr1.data(using: .utf8)
        
//        decodeJson0(contentId:"users")
        decodeJson1(contentId:"users")
    }
    
    private func decodeJson0(contentId:String) {
        guard let json0Data else {
            return
        }
        
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.init(rawValue: kContentId)!] = contentId
        
        do {
            //注意type：此处是envelope，需要的对象在 Envelope 对象的 content 属性里。
           let envelope = try decoder.decode(Envelope<[Person]>.self, from: json0Data)
            if let personsArr = envelope.content {
                print(personsArr.first as Any, personsArr.last as Any)
                
                if let person = personsArr.first {
                    print(person.name as Any)
                }
            }
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
    private func decodeJson1(contentId:String) {
        guard let json1Data else {
            return
        }
        
        let decoder = JSONDecoder()
        decoder.userInfo[CodingUserInfoKey.init(rawValue: kContentId)!] = contentId
        
        do {
            //注意type：此处是envelope，需要的对象在 Envelope 对象的 content 属性里。
           let envelope = try decoder.decode(Envelope<Person>.self, from: json1Data)
            if let person = envelope.content {
                print(person)
            }
        }catch {
            print(error.localizedDescription)
        }
        
    }



}

