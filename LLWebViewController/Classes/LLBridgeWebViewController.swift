//
//  LLBridgeWebViewController.swift
//  LLBridgeWebViewController
//
//  Created by ZHK on 2021/5/6.
//  
//

import UIKit

open class LLBridgeWebViewController<B: LLWebViewBridgable>: LLWebViewController {
    
    private lazy var bridge = B(webView: webView)

    open override func viewDidLoad() {
        super.viewDidLoad()
        load(url: bridge.requestURL)
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}
