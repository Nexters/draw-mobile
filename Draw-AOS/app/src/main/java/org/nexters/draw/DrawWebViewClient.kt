package org.nexters.draw

import android.graphics.Bitmap
import android.webkit.WebView
import android.webkit.WebViewClient

class DrawWebViewClient:WebViewClient() {
    // 웹 페이지 로딩 시작 시 호출됩니다.
    override fun onPageStarted(view: WebView?, url: String?, favicon: Bitmap?) {
        super.onPageStarted(view, url, favicon)
        // 웹 페이지 로딩 시작 시 원하는 동작을 수행합니다.
    }

    // 웹 페이지 로딩 완료 시 호출됩니다.
    override fun onPageFinished(view: WebView?, url: String?) {
        super.onPageFinished(view, url)
        // 웹 페이지 로딩 완료 시 원하는 동작을 수행합니다.
    }

    // 사용자가 링크를 클릭할 때 호출됩니다.
    override fun shouldOverrideUrlLoading(view: WebView?, url: String?): Boolean {
        // 원하는 방식으로 링크 클릭을 처리합니다.
        // true를 반환하면 WebView가 링크 처리를 하지 않습니다.
        // false를 반환하면 WebView가 링크 처리를 합니다.
        return false
    }

    // 웹 페이지 로딩 중 에러가 발생할 때 호출됩니다.
    override fun onReceivedError(view: WebView?, errorCode: Int, description: String?, failingUrl: String?) {
        // 에러 핸들링을 수행합니다.
    }

}
