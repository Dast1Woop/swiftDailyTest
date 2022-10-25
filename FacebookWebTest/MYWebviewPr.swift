//
//  MYWebviewPr.swift
//  DingDingBusInternational
//
//  Created by LongMa on 2022/1/13.
//  Copyright © 2022 huatu. All rights reserved.
//

import Foundation
import WebKit

protocol MYWebviewPr{
    var webview:WKWebView? { get set }
    
    /// 只是创建，配置config，webview的delegate未在方法内配置
    func createWebV(urlStr:String)->WKWebView?
}

extension MYWebviewPr{
    func createWebV(urlStr:String)->WKWebView? {
        let url = URL.init(string: urlStr)
        guard let url = url else{
            return nil
        }
        
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        
        let pre = WKPreferences()
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.preferences = pre
        
        let webv = WKWebView(frame: CGRect.zero, configuration: config)
        
        webv.scrollView.showsVerticalScrollIndicator = false;
        webv.scrollView.showsHorizontalScrollIndicator = false;
        
        let rqst = URLRequest.init(url: url, cachePolicy: Foundation.URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 60)
        webv.load(rqst)
        
        return webv
    }
}
