//
//  LLWebLoadable.swift
//  LLWebViewController
//
//  Created by ZHK on 2021/4/29.
//  
//

import UIKit
import WebKit
import LLObject

public protocol LLWebLoadable: UIViewController {
    
    /// WKWebViewConfiguration
    var config: WKWebViewConfiguration { get }
    
    /// WKWebView
    var webView: WKWebView { get }
}

extension LLWebLoadable {
    
    /// WKWebViewConfiguration
    public var config: WKWebViewConfiguration {
        if let config = ll_KVMap["web_config"] as? WKWebViewConfiguration {
            return config
        }
        let config = WKWebViewConfiguration()
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        if #available(iOS 10, *) {
            config.setValue(true, forKey: "allowUniversalAccessFromFileURLs")
        }
        ll_KVMap["web_config"] = config
        return config
    }
    
    /// WKWebView
    public var webView: WKWebView {
        if let webView = ll_KVMap["web_webView"] as? WKWebView {
            return webView
        }
        let webView = WKWebView(frame: view.bounds, configuration: config)
        ll_KVMap["web_webView"] = webView
        return webView
    }
    
    public func web_setupUI() {
        if webView.superview == nil {
            view.addSubview(webView)
        }
    }
    
    public func load(url: URL) {
        webView.load(URLRequest(url: url))
    }
}
