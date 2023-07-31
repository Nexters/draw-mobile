//
//  WebView.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let webView = WKWebView()
    let url: URL
    
    init(url: URL) {
        self.url = url
        self.webView.configuration.userContentController.add(ContentController(), name: "showBottomBar")
        self.webView.configuration.userContentController.add(ContentController(), name: "showShareSheet")
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
