package org.nexters.draw

import android.content.Context
import android.content.Intent
import android.webkit.JavascriptInterface
import androidx.core.content.ContextCompat.startActivity

class JavascriptInterface(private val viewModel: MainViewModel, private val context: Context) {

    @JavascriptInterface
    fun showBottomBar(showBottom: String) {
        if (showBottom.toBoolean()) {
            viewModel.setBottomBarVisible(true)
        } else {
            viewModel.setBottomBarVisible(false)
        }
    }

    @JavascriptInterface
    fun showShareSheet(shareUrl: String) {
        val intentShare = Intent(Intent.ACTION_SEND)
        intentShare.putExtra(Intent.EXTRA_TEXT, shareUrl)
        intentShare.type = "text/plain"
        startActivity(context, Intent.createChooser(intentShare, "앱을 선택해 주세요."), null)
    }
}
