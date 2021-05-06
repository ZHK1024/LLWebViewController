//
//  LLWebViewController.swift
//  LLWebViewController
//
//  Created by ZHK on 2021/4/29.
//  
//

import UIKit
import WebKit

open class LLWebViewController: UIViewController, LLWebLoadable {
    
    public var requestURL: URL?

    open override func viewDidLoad() {
        super.viewDidLoad()
        web_setupUI()
        guard let url = requestURL else {
            return
        }
        load(url: url)
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}
