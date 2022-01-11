//
//  LibBHello.swift
//  LibB
//
//  Created by LongMa on 2022/1/11.
//

import Foundation
import RswiftLib
import UIKit

public struct LibBHello{
    static public func hello(){
        print("hello")
    }
    
    static public func getImageB()->UIImage? {
        return R.image.aishiJpg()
    }

}
