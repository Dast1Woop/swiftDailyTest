//
//  ShareButtonPr.swift
//  DingDingBusInternational
//
//  Created by LongMa on 2021/11/30.
//  Copyright © 2021 huatu. All rights reserved.
//

import Foundation
import UIKit

enum ShareBtnType {
    case horizontalTextImage
    case verticalTextImage
    case onlyImage
}

@objc protocol ShareButtonPrObjc{
    @objc func shareBtnDidClick(btn:UIButton)
}

//问题：协议B遵守 ShareButtonPr 后，没办法把 ShareButtonPrObjc 中按钮点击事件传递到遵守 协议B 的控制器吗？
protocol ShareButtonPr:ShareButtonPrObjc {
    var shareBtn:UIButton{get}
    func shareBtn(type: ShareBtnType) -> UIButton
}

extension ShareButtonPr{
    var shareBtn:UIButton{
        return UIButton.init()
    }
    
    func shareBtnDidClick(btn: UIButton) {
        print("shareBtnDidClick")
    }
    
    func shareBtn(type: ShareBtnType) -> UIButton{
        
        let btn = UIButton.init()
        
        switch type {
        case .horizontalTextImage:
            //FIXME:TODO:<##>
            btn.setImage(UIImage.init(named: "icon_share"), for: .normal)
        case .verticalTextImage:
            //FIXME:TODO:<##>
            btn.setImage(UIImage.init(named: "icon_share"), for: .normal)
        case .onlyImage:
            btn.setImage(UIImage.init(named: "icon_share"), for: .normal)
        }
        
        btn.addTarget(nil, action: #selector(shareBtnDidClick), for: .touchUpInside)
        
        return btn
    }
}
