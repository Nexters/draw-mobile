package org.nexters.draw

import android.annotation.SuppressLint
import android.webkit.WebChromeClient
import android.webkit.WebView
import android.webkit.WebViewClient


object DrawWebViewClient {

    @SuppressLint("SetJavaScriptEnabled")
    fun initWebView(webView: WebView) {
        webView.apply {
            webChromeClient = WebChromeClient()
            webViewClient = WebViewClient()
            settings.javaScriptEnabled = true
            settings.domStorageEnabled = true
            settings.setSupportMultipleWindows(true)
        }
    }

    @SuppressLint("SetJavaScriptEnabled")
    fun loadWebUrl(webView: WebView, url: String) {
        webView.loadUrl(url)
    }

}
