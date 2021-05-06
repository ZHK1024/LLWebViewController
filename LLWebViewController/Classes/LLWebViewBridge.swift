//
//  LLWebViewBridge.swift
//  LLWebViewController
//
//  Created by ZHK on 2021/5/6.
//  
//

import WebKit
import WKWebViewJavascriptBridge

open class LLWebViewBridge: NSObject, LLWebViewBridgable {
    
    open var requestURL: URL {
        fatalError("LLWebViewBridge 的 requestURL 不能为 nil")
    }
    
    public var bridge: WKWebViewJavascriptBridge
    
    public required init(webView: WKWebView) {
        bridge = WKWebViewJavascriptBridge(webView: webView)
    }
}
