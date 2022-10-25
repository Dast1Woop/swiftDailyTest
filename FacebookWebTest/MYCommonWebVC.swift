//
//  MYCommonWebVC.swift
//  DingDingBusInternational
//
//  Created by LongMa on 2022/9/8.
//  Copyright © 2022 huatu. All rights reserved.
//

import Foundation
import WebKit
import SnapKit

class MYCommonWebVC:UIViewController,MYWebviewPr {
    
    var webview: WKWebView?
    
    private var urlStr:String?
    
    init(title:String, url:String) {
        urlStr = url
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    private init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
//        tabBarController?.tabBar.ht_hidden(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        tabBarController?.tabBar.ht_hidden(false)
    }
    
    private func setUpUI() {
        replaceNaviBackBtn()
        addWebV()
    }
    
    private func replaceNaviBackBtn() {
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        leftButton.setImage(UIImage(named: "tap_btn_back"), for: UIControl.State())
        leftButton.addTarget(self, action: #selector(leftButtonClick(_:)), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
    }
    
    @objc func leftButtonClick(_ sender: UIButton){
        if webview?.canGoBack ?? false {
            webview?.goBack()
            return
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func addWebV() {
        //webV
        guard let urlStr = urlStr else {
            return
        }

        webview = createWebV(urlStr: urlStr)
        guard let webview = webview else {
            return
        }
        
        view.addSubview(webview)
        webview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        webview.uiDelegate = self
        webview.navigationDelegate = self
    }
}

extension MYCommonWebVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(#function)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(#function)
    }
    
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print(#function)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(#function)
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
            
            decisionHandler(.cancel)
            return
        }
        
        //mailto:、weixin:
        if let url = navigationAction.request.url,
           let scheme = url.scheme,
           scheme.starts(with: "mailto") || scheme.starts(with: "weixin")
        {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:]) { res in
                    print("open res:",res)
                }
            }
            
            decisionHandler(.cancel)
            return
        }
        
        decisionHandler(.allow)
    }

}

extension MYCommonWebVC: WKUIDelegate, MYWKUIDelegatePr {

    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
       common_webView(webView, runJavaScriptAlertPanelWithMessage: message, initiatedByFrame: frame, completionHandler: completionHandler)
    }

    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Void) {
        common_webView(webView, runJavaScriptConfirmPanelWithMessage: message, initiatedByFrame: frame, completionHandler: completionHandler)
    }

    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (String?) -> Void) {
        common_webView(webView, runJavaScriptTextInputPanelWithPrompt: prompt, defaultText: defaultText, initiatedByFrame: frame, completionHandler: completionHandler)
    }

}


