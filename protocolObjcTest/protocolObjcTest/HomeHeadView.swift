//
//  Protects.swift
//  DingDingBusInternational
//
//  Created by hujun on 16/4/10.
//  Copyright © 2016年 huatu. All rights reserved.
//

import Foundation
import UIKit

public protocol SwitchImages: AnyObject {
    func imageWithType(_ type: String) -> UIImage?
}

extension SwitchImages {
    func imageWithType(_ type: String) -> UIImage? {
        var image: UIImage?
        switch type {
        case "10001":
            image = UIImage(named: "nav_button_blue_bus-0")
        case "10004":
            image = UIImage(named: "nav_button_green_bus-0")
        case "10002":
            image = UIImage(named: "nav_button_orange_bus-0")
        default:
            image = UIImage(named: "nav_button_green_bus-0")
            break
        }
        return image
    }
    
    func imageWithPassengerFlow(_ level: String) -> UIImage? {
        var image: UIImage?
        switch level {
        case "-1":
            image = nil
        case "0":
            image = UIImage(named: "route_collect_passenger_0")
        case "1":
            image = UIImage(named: "route_collect_passenger_1")
        case "2":
            image = UIImage(named: "route_collect_passenger_2")
        case "3":
            image = UIImage(named: "route_collect_passenger_3")
        case "4":
            image = UIImage(named: "route_collect_passenger_4")
        case "5":
            image = UIImage(named: "route_collect_passenger_5")
        default:
            image = nil
            break
        }
        return image
    }
    
}




protocol HeadButtonPr: SwitchImages {
    func headBtWithName(_ name: String, type: String) -> UIButton

}

extension HeadButtonPr {

//    func headBtWithName(_ name: String, type: String) -> UIButton {
//        let view1 = UIButton(type: .custom)
//        view1.setTitle(name, for: UIControl.State())
//        switch type {
//        case "collect":
//            view1.setImage(UIImage(named: "collection_star"), for: UIControl.State())
//        default:
//            view1.setImage(imageWithType(type), for: UIControl.State())
//        }
//        //view1.contentEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
//        view1.imageEdgeInsets = UIEdgeInsets(top: 5, left: 4, bottom: 5, right: 0)
//        view1.imageView?.contentMode = .scaleAspectFit
//        view1.backgroundColor = UIColor.clear
//        view1.setTitleColor(UIColor.black, for: UIControl.State())
//        view1.titleLabel?.font = UIFont.pt_boldSystemFont(13, isFollowSystem: false)
//        view1.titleLabel?.numberOfLines = 0
//
//        view1.setBackgroundImage(UIImage.getImageWithColor(color: .white), for: .normal)
//        view1.setBackgroundImage(UIImage.getImageWithColor(color: UIColor(hex: "#C6E3F9")), for: .selected)
//        return view1
//    }
}


@objc protocol HomeHeaderBustypeViewObjcPr {
    func headButtonDidClick(_ sender: UIButton)
}

private extension Selector {
    static let showDetail = #selector(HomeHeaderBustypeViewObjcPr.headButtonDidClick(_:))
}


protocol HomeHeaderBustypeViewPr: HeadButtonPr,HomeHeaderBustypeViewObjcPr, ShareButtonPr
//, ShareButtonPr
{
    var headView: UIView { get }
    var collectBtn: UIButton { set get }
    
//    func headViewHidden(_ ishidden: Bool,company: [MacuaCompany])
    
    func setUpHeadV()
}



extension HomeHeaderBustypeViewPr {
    var shareBtn: UIButton{
        return shareBtn(type: .onlyImage)
    }
    
     func shareBtnDidClick(btn: UIButton) {
        headButtonDidClick(btn)
    }
    
    func setUpHeadV(){
        headView.addSubview(shareBtn)
        shareBtn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 60)
        
    }
  
//    func shareBtnDidClick(btn: UIButton) {
//        headButtonDidClick(btn)
//    }
    
//    func headViewHidden(_ ishidden: Bool,company: [MacuaCompany]) {
//        let itemWidth = (kWidth - 20) /  CGFloat(company.count + 2)
//
//        if ishidden == false {
//            for v in headView.subviews {
//                v.removeFromSuperview()
//            }
//            for (index, comp) in company.enumerated() {
//                let viewb = headBtWithName(comp.name, type: comp.code)
//                viewb.tag = index
//                viewb.addTarget(nil, action: .showDetail, for: .touchUpInside)
//                headView.addSubview(viewb)
//                let indexcg = CGFloat(index + 1)
//                let left = 5 * indexcg + itemWidth * CGFloat(index)
//                viewb.snp.makeConstraints { (make) in
//                    make.size.equalTo(CGSize(width: itemWidth, height: 40))
//                    make.left.equalTo(left)
//                    make.bottom.equalTo(0)
//                }
//            }
//
//            let viewb = headBtWithName(NSLocalizedString("路线收藏", comment: ""), type: "collect")
//            viewb.tag = -1
//            viewb.addTarget(nil, action: .showDetail, for: .touchUpInside)
//            headView.addSubview(viewb)
//
////            let indexcg = CGFloat(collectIndex + 1)
////            let left = 5 * indexcg + itemWidth * CGFloat(collectIndex)
//            viewb.snp.makeConstraints { (make) in
//                make.size.equalTo(CGSize(width: itemWidth, height: 40))
////                make.left.equalTo(left)
//                make.right.equalTo(-itemWidth)
//                make.bottom.equalTo(0)
//            }
//            headView.backgroundColor = UIColor.white
//            collectBtn = viewb
//
////            //share
////            shareBtn = shareBtn(type: ShareBtnType.horizontalTextImage)
////            shareBtn.tag = -2
////            headView.addSubview(shareBtn)
////            shareBtn.snp.makeConstraints { make in
////                make.top.bottom.trailing.equalTo(0)
////                make.width.equalTo(itemWidth)
////            }
//
//        }
//    }

}
