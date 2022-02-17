//
//  ViewController.swift
//  WKWebViewLoadHtmlCssJsTest
//
//  Created by LongMa on 2022/2/17.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let webv = WKWebView.init(frame: view.bounds)
        view.addSubview(webv)
        webv.uiDelegate = self
        
        let url = Bundle.main.url(forResource: "index1", withExtension: ".html")
        guard let url = url else {
            return
        }
        
        //方法1
        webv.loadFileURL(url, allowingReadAccessTo: Bundle.main.bundleURL)
        
        //方法2
//        webv.load(URLRequest.init(url: url))
        
    }
}

extension ViewController:WKUIDelegate{
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo) async {
        print(#function)
        
        let vc = UIAlertController.init(title: "alert", message: "hello", preferredStyle: UIAlertController.Style.alert)
        let confirmAct = UIAlertAction.init(title: "确认", style: UIAlertAction.Style.default) { act in
            print("clicked")
        }
        
        vc.addAction(confirmAct)
        present(vc, animated: true) {
            
        }
    }
}


