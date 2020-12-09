//
//  ViewController.swift
//  JustVCsViewAsSubViewTest
//
//  Created by LongMa on 2020/12/9.
//

import UIKit

class ViewController: UIViewController {
    
    var gVC: UIViewController?
    
    //if you use Interface Builder to create your views and initialize the view controller, you must not override this method.
//    override func loadView() {
    
    //会报错！一个view不能绑定多个vc
//        let lVC = FirstVC()
////        view.addSubview(lVC.view)
//        view = lVC.view
//    }
    
    // *** Terminating app due to uncaught exception 'UIViewControllerHierarchyInconsistency', reason: 'A view can only be associated with at most one view controller at a time! View <UIView: 0x7ff034c0ddb0; frame = (0 0; 414 896); autoresize = W+H; layer = <CALayer: 0x600003169480>> is associated with <JustVCsViewAsSubViewTest.SecondVC: 0x7ff034c0da60>. Clear this association before associating this view with <JustVCsViewAsSubViewTest.ViewController: 0x7ff034c09330>.'
//    override func loadView() {
//        let lVC = SecondVC()
//        view = lVC.view
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .gray
        
        let lVC = FirstVC()
        view.addSubview(lVC.view)
        
        //必须想办法保留控制器，否则 lVC 会被销毁，导致时间无法传递
        gVC = lVC
    }


}

