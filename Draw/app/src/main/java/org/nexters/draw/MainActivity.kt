package org.nexters.draw

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import org.nexters.draw.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.navView.background = null
        //binding.bottomAppBar.background = null
    }
}
