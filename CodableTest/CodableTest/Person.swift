//
//  Person.swift
//  CodableTest
//
//  Created by LongMa on 2022/10/26.
//

import Foundation

struct Person:Codable {
    var name: String?
    var age: Int?
    
    var description: String {
        guard let name = name, let age = age else {
            return "data incomplete"
        }

        return name + ", \(age)"
    }
}
