package org.nexters.draw

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.ViewTreeObserver
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.app.AppCompatActivity
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import org.nexters.draw.databinding.ActivityOnboardingBinding

class OnBoardingActivity : AppCompatActivity() {

    private lateinit var binding: ActivityOnboardingBinding
    var isUrlLoadingReady = false
    var isStart = false
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        installSplashScreen()
        binding = ActivityOnboardingBinding.inflate(layoutInflater)
        setContentView(binding.root)

        initWebView()

        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            binding.ivLogo.visibility = View.VISIBLE
            binding.wbDraw.visibility = View.GONE
            isStart = true

        } else {
            val content: View = findViewById(android.R.id.content)
            content.viewTreeObserver.addOnPreDrawListener(
                object : ViewTreeObserver.OnPreDrawListener {
                    override fun onPreDraw(): Boolean {
                        return if (isUrlLoadingReady) {
                            content.viewTreeObserver.removeOnPreDrawListener(this)
                            true
                        } else {
                            false
                        }
                    }
                }
            )

            splashScreen.setOnExitAnimationListener { splashScreenView ->
                splashScreenView.remove()
                binding.ivLogo.visibility = View.GONE
            }
        }

    }

    private fun initWebView() {
        binding.wbDraw.apply {

            DrawWebViewClient.run {
                initWebView(this@apply)
                loadWebUrl(this@apply, BuildConfig.WEB_URL_ONBOARDING)
            }

            webViewClient = object : WebViewClient() {
                override fun doUpdateVisitedHistory(
                    view: WebView?,
                    url: String?,
                    isReload: Boolean
                ) {
                    super.doUpdateVisitedHistory(view, url, isReload)
                    if (url == BuildConfig.WEB_URL_FEED) {
                        finish()
                        startActivity(Intent(this@OnBoardingActivity, MainActivity::class.java))
                    }

                }

                override fun onPageFinished(view: WebView?, url: String?) {
                    super.onPageFinished(view, url)
                    isUrlLoadingReady = true
                    if (isStart) {
                        binding.ivLogo.visibility = View.GONE
                        binding.wbDraw.visibility = View.VISIBLE
                    }

                }
            }

        }
    }


}
