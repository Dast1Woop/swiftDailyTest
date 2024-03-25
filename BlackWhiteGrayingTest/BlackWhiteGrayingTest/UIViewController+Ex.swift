//
//  UIViewController+Ex.swift
//  BlackWhiteGrayingTest
//
//  Created by LongMa on 2024/3/25.
//

import Foundation
import UIKit

extension UIViewController {
    
    

    
    
}

// 扩展 UIView 获取视图截图
extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
