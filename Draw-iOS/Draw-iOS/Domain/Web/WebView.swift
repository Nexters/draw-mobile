//
//  WebView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI
import WebKit

class WebViewDelegate: NSObject, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            if let fcmToken = UserDefaultManager.get(.fcmToken) {
                NotificationCenterManager.send(.fcmToken, value: fcmToken)
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    let webView: WKWebView = .init()
    let webViewDelegate: WebViewDelegate = .init()
    let url: URL
    
    init(url: URL) {
        self.url = url
        self.webView.navigationDelegate = webViewDelegate
        
        WebMessageReceiveType.allCases.forEach { webMessageType in
            self.webView.configuration.userContentController.add(WebMessageHandler(), name: webMessageType.rawValue)
        }
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let request = URLRequest(url: url)
        
        if #available(iOS 16.4, *) {
            self.webView.isInspectable = true
        }
        
        webView.isOpaque = false
        webView.backgroundColor = .clear
        
        webView.load(request)
        
        if let userAgent = webView.value(forKey: "userAgent") as? String {
            webView.customUserAgent = userAgent + " DRAW_WEBVIEW"
        }

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
