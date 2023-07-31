//
//  Person.swift
//  DecodeWithKeyPath
//
//  Created by LongMa on 2023/7/31.
//

import Foundation

struct Person:Decodable {
    var name:String?
    var age:Int?
    var email:String?
    
    //输入initwithdecoder时，自动生成下面枚举和init方法的实现
    enum CodingKeys: CodingKey {
        case name
        case age
        case email
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.age = try container.decodeIfPresent(Int.self, forKey: .age)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
    }
}
