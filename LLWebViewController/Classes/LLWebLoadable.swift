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
    
    /// 创建 UI
    public func web_setupUI() {
        if webView.superview == nil {
            view.addSubview(webView)
        }
    }
    
    /// 加载 URL
    /// - Parameter url: 要加载的 URL
    public func load(url: URL) {
        webView.load(URLRequest(url: url))
    }
    
    /// 从本地文件加载网页内容
    /// - Parameter fileURL: 文件 URL
    ///   - allowingReadAccessTo: 授权可访问文件夹 (当有依赖的外部文件, `css`, `js` 等, 此时需要授权对应文件夹的可读权限)
    public func load(fileURL: URL, allowingReadAccessTo: URL? = nil) {
        webView.loadFileURL(fileURL, allowingReadAccessTo: allowingReadAccessTo ?? fileURL.deletingLastPathComponent())
    }
}
