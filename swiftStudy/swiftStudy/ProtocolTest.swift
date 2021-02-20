//
//  ProtocalTest.swift
//  swiftStudy
//
//  Created by LongMa on 2020/12/11.
//

import Foundation

protocol Movable {
    func move(by:Int)
    var hasMoved: Bool{get}
    var distanceFromStart: Int{get set}
}
extension Movable{
    func whatEver(){
        print(#function)
    }
    
    var speed: Float{
        return 10.0
    }
}

