//
//  WebView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let webView: WKWebView = .init()
    let url: URL
    
    init(url: URL) {
        self.url = url
        
        WebMessageReceiveType.allCases.forEach { webMessageType in
            self.webView.configuration.userContentController.add(WebMessageHandler(), name: webMessageType.rawValue)
        }
    }
    
    func send(type: WebMessageSendType, completionHandler: @escaping (Any?, Error?) -> Void) {
        webView.evaluateJavaScript(type.jsCode) {
            completionHandler($0, $1)
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let request = URLRequest(url: url)
        webView.load(request)
        
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.isScrollEnabled = false
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        
    }
}
