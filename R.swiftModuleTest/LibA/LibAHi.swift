//
//  LibAHi.swift
//  LibA
//
//  Created by LongMa on 2022/1/11.
//

import Foundation
import UIKit
import RswiftLib
public struct LibAHi{
    static public func hi(){
        print("Hi")
    }
    
    static public func getImageA()->UIImage? {
        
        //注意：png图片不放在assets文件夹里时，有概率加载不出来！！！很奇怪！
//        let img = R.image.img_02()
        
//        let img = R.image.mmBig()
//        let img = R.image.mmSmallJpeg()
        let img = R.image.mmSmallJpg()
        
//        let img = R.image.redPaint()
        //        let img = R.image.console()
        //        let img = R.image.foot()
//        let img = R.image.ioserngJpg()
        return img
    }
}
