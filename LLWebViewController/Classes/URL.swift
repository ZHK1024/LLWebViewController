//
//  URL.swift
//  LLWebViewController
//
//  Created by ZHK on 2021/5/6.
//  
//

import Foundation

public extension URL {
    
    /// 创建本地文件 URL (附带参数)
    /// - Parameters:
    ///   - url:        文件 URL
    ///   - path:       拼接路径
    ///   - parameters: 附加参数
    /// - Returns: URL
    static func file(url: URL, path: String?, parameters: [String: String]?) -> URL? {
        /// 去除非法字符
        var ext = path?.removingPercentEncoding ?? ""
        /// 拼接参数
        if let params = parameters {
            ext += ("?" + params.map { "\($0)=\($1)" }.joined(separator: "&"))
        }
        /// 拼接尾部
        /// 使用 relativeTo, 否则 URL 创建失败
        /// iOS 12 无法加载这种 URL
//        return URL(string: ext, relativeTo: url)
        /// 兼容 iOS 使用 URL(string:) 初始化
        return URL(string: url.absoluteString + ext)

    }
}
