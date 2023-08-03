package org.nexters.draw

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import org.nexters.draw.databinding.ActivityNewQuestionBinding

class NewQuestionActivity : AppCompatActivity() {

    private lateinit var binding: ActivityNewQuestionBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityNewQuestionBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setUpWebView()
    }

    private fun setUpWebView() {
        binding.wbDraw.apply {


            DrawWebViewClient.run {
                initWebView(this@apply)
                loadWebUrl(this@apply, BuildConfig.WEB_URL_NEW_QUESTION)
            }
        }


    }
}
