package org.nexters.draw

import android.annotation.SuppressLint
import android.content.Intent
import android.graphics.Bitmap
import android.util.Log
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.core.content.ContextCompat.startActivity


open class DrawWebViewClient:WebViewClient() {
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
    @Deprecated("Deprecated in Java", ReplaceWith("false"))
    override fun shouldOverrideUrlLoading(view: WebView?, url: String?): Boolean {
        // 원하는 방식으로 링크 클릭을 처리합니다.
        // true를 반환하면 WebView가 링크 처리를 하지 않습니다.
        // false를 반환하면 WebView가 링크 처리를 합니다.
        Log.d("TAG", "shouldOverrideUrlLoading: ${url}")
        return if (url == UrlManager.URL_FEED) {
            val intent = Intent(view?.context , MainActivity::class.java)
            startActivity(view?.context!!,intent,null)
            true
        }else {
            false
        }
    }



    // 웹 페이지 로딩 중 에러가 발생할 때 호출됩니다.
    @Deprecated("Deprecated in Java")
    override fun onReceivedError(view: WebView?, errorCode: Int, description: String?, failingUrl: String?) {
        // 에러 핸들링을 수행합니다.
    }

    @SuppressLint("SetJavaScriptEnabled")
    fun loadUrl(view: WebView, url:String) {
        view.settings.javaScriptEnabled = true
        view.settings.domStorageEnabled = true
        view.settings.setSupportMultipleWindows(true)
        view.loadUrl(url)
    }

}
