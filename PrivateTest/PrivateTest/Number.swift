//
//  Number.swift
//  PrivateTest
//
//  Created by LongMa on 2022/2/24.
//

import Foundation

class Number{
    fileprivate var shiBu:Int = 0
    private var xuBu:Int = 0
    
    init(shibu:Int, xubu:Int) {
        self.shiBu = shibu
        self.xuBu = xubu
    }
    
    public func add(another:Number){
        let sb = self.shiBu + another.shiBu
        let xb = self.xuBu + another.xuBu
        print(sb,"-",xb)
    }
}
