//
//  ViewController.swift
//  EnumNestDemo
//
//  Created by LongMa on 2023/9/12.
//

import UIKit

class ViewController: UIViewController {
    
    enum MainDomain {
        case home(SubDomainOfHome)
        case more(SubDomainOfMore)
    }
    
    enum SubDomainOfHome {
        case map
        case search
        case collect
    }
    
    enum SubDomainOfMore {
        case aboutUs
        case privacy
        case report
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let vc = createVC(type: MainDomain.home(SubDomainOfHome.map))
        print("vc title:", vc.title ?? "")
        
        let vc1 = createVC(type: MainDomain.more(SubDomainOfMore.aboutUs))
        print("vc1 title:", vc1.title ?? "")
    }
    
    func createVC(type:MainDomain)->UIViewController {
        switch type {
        case .home(let subDomain):
            switch subDomain {
            case .map:// 使用 .map，不能使用 SubDomainOfHome.map
                let vc = UIViewController.init()
                vc.title = "map vc"
                return vc
            case .search:
                let vc = UIViewController.init()
                vc.title = "search vc"
                return vc
            default:
                let vc = UIViewController.init()
                vc.title = "collect vc"
                return vc
            }
        case .more(let subDomain):
            switch subDomain {
            case .aboutUs:
                let vc = UIViewController.init()
                vc.title = "aboutUs vc"
                return vc
            case .privacy:
                let vc = UIViewController.init()
                vc.title = "privacy vc"
                return vc
            default://.report
                let vc = UIViewController.init()
                vc.title = "report vc"
                return vc
                //        default:
                //            print(type)
            }
            return UIViewController()
        }
    }


}

