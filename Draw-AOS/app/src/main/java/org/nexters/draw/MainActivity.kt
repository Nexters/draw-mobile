package org.nexters.draw

import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.ViewTreeObserver
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.core.splashscreen.SplashScreen.Companion.installSplashScreen
import org.nexters.draw.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private val mainViewModel: MainViewModel by viewModels()

    var isUrlLoadingReady = false
    var isStart = false

    override fun onCreate(savedInstanceState: Bundle?) {
        installSplashScreen()
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.bottomNavView.background = null
        initSplashView()
        initWebView()
        initFabBtn()
        initNavigation()
        initBottomNavigation()
    }

    private fun initSplashView() {
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

    private fun initFabBtn() {
        binding.ftnFeed.setOnClickListener {
            binding.wbDraw.evaluateJavascript(
                "var navigateEvent = new CustomEvent('navigate', { detail: { url: '/new-question' }}); window.dispatchEvent(navigateEvent);",
                null
            )

        }
    }

    private fun initWebView() {
        binding.wbDraw.apply {
            DrawWebViewClient.run {
                initWebView(this@apply)
                loadUrl(BuildConfig.WEB_URL_ONBOARDING)
                webViewClient = object : WebViewClient() {

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
            addJavascriptInterface(
                JavascriptInterface(mainViewModel, this@MainActivity),
                "draw"
            )
        }
    }


    private fun initNavigation() {
        binding.bottomNavView.run {
            setOnItemSelectedListener { item ->
                when (item.itemId) {
                    R.id.feedFragment -> {
                        binding.wbDraw.evaluateJavascript(
                            "var navigateEvent = new CustomEvent('navigate', { detail: { url: '/feed' }}); window.dispatchEvent(navigateEvent);",
                            null
                        )
                    }

                    R.id.myPageFragment -> {
                        binding.wbDraw.evaluateJavascript(
                            "var navigateEvent = new CustomEvent('navigate', { detail: { url: '/my-page' }}); window.dispatchEvent(navigateEvent);",
                            null
                        )
                    }

                }
                true
            }
            selectedItemId = R.id.feedFragment
        }

    }

    private fun initBottomNavigation() {
        mainViewModel.isBottomBarVisible.observe(this) {
            if (it) {
                binding.bottomNavView.visibility = View.VISIBLE
                binding.bottomAppBar.visibility = View.VISIBLE
                binding.ftnFeed.visibility = View.VISIBLE
            } else {
                binding.bottomNavView.visibility = View.GONE
                binding.bottomAppBar.visibility = View.GONE
                binding.ftnFeed.visibility = View.GONE
            }
        }
    }


    @Deprecated("Deprecated in Java")
    override fun onBackPressed() {
        if (binding.wbDraw.url.equals(BuildConfig.WEB_URL_FEED, ignoreCase = true)
            || binding.wbDraw.url.equals(BuildConfig.WEB_URL_MY_PAGE, ignoreCase = true)
        ) {
            super.onBackPressed()
        } else if (binding.wbDraw.canGoBack()) {
            binding.wbDraw.goBack()
        } else {
            super.onBackPressed()
        }
    }

}
