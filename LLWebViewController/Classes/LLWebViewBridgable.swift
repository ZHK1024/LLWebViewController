//
//  LLWebViewBridgable.swift
//  LLWebViewController
//
//  Created by ZHK on 2021/5/6.
//  
//

import WebKit
import WKWebViewJavascriptBridge
import LLObject

public protocol LLWebViewBridgable: class {
    
    /// 请求地址 URL
    var requestURL: URL { get }
    
    /// WKWebViewJavascriptBridge
    var bridge: WKWebViewJavascriptBridge { get }
    
    /// Init
    /// - Parameter webView: WKWebView
    init(webView: WKWebView)
}
