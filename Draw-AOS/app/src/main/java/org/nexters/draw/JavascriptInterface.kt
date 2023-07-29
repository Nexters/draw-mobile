package org.nexters.draw

import android.webkit.JavascriptInterface

class JavascriptInterface(private val viewModel: MainViewModel) {

    @JavascriptInterface
    fun showBottomBar(showBottom: String) {
        if (showBottom.toBoolean()) {
            viewModel.setBottomBarVisible(true)
        } else {
            viewModel.setBottomBarVisible(false)
        }
    }
}
