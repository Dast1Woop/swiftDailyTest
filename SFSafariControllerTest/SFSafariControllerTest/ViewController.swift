//
//  ViewController.swift
//  SFSafariControllerTest
//
//  Created by LongMa on 2022/2/17.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    var sfvc:SFSafariViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "点击屏幕弹出网页"
        
        let url = URL.init(string: "https://www.baidu.com")
        guard let url = url else {
            return
        }

        sfvc = SFSafariViewController.init(url:url)
        sfvc?.delegate = self
        
        //网页顶栏和低栏 背景色
        sfvc?.preferredBarTintColor = .red
        
        //网页顶栏和低栏 按钮颜色
        sfvc?.preferredControlTintColor = .green
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sfvc = sfvc else {
            return
        }
        self.present(sfvc, animated: true) {

        }
    
        //有代理逻辑，不建议用push，会导致网页自带的前进后退反应较慢等问题
//        self.navigationController?.pushViewController(sfvc, animated: true)
    }

}

extension ViewController:SFSafariViewControllerDelegate{
//    func safariViewController(_ controller: SFSafariViewController, activityItemsFor URL: URL, title: String?) -> [UIActivity] {
//
//    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true) {
        }
        
//        self.navigationController?.popViewController(animated: true)
    }
    
    func safariViewControllerWillOpenInBrowser(_ controller: SFSafariViewController) {
        print(#function)
    }
}

