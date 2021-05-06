//
//  ViewController.swift
//  LLWebViewController
//
//  Created by ZHK on 04/29/2021.
//  Copyright (c) 2021 ZHK. All rights reserved.
//

import UIKit
import WebKit
import LLWebViewController

class Bridge: LLWebViewBridge {

    override var requestURL: URL { URL(string: "https://www.baidu.com")! }
}

class ViewController: LLBridgeWebViewController<Bridge> {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

