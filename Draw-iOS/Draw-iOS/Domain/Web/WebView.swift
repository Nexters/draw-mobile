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
    
    func makeUIView(context: Context) -> WKWebView {
        let request = URLRequest(url: url)
        webView.customUserAgent = "DRAW_WEBVIEW"
        
        if #available(iOS 16.4, *) {
            self.webView.isInspectable = true
        }
        
        webView.isOpaque = false
        webView.backgroundColor = .clear
        
        webView.load(request)

        return webView
    }
    
    func update(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func send(type: WebMessageSendType, completionHandler: @escaping (Any?, Error?) -> Void) {
        print("will send \(type.jsCode)")
        webView.evaluateJavaScript(type.jsCode) {
            completionHandler($0, $1)
        }
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        
    }
}
