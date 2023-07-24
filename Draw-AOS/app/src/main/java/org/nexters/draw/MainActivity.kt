package org.nexters.draw

import android.os.Bundle
import android.view.View
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.ui.setupWithNavController
import org.nexters.draw.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private val mainViewModel: MainViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.navView.background = null
        initNavigation()
        initBottomNavigation()
    }

    private fun initBottomNavigation() {
        mainViewModel.isBottomBarVisible.observe(this){
            if (it) {
                binding.navView.visibility = View.VISIBLE
                binding.bottomAppBar.visibility = View.VISIBLE
                binding.ftnFeed.visibility = View.VISIBLE
            } else {
                binding.navView.visibility = View.GONE
                binding.bottomAppBar.visibility = View.GONE
                binding.ftnFeed.visibility = View.GONE
            }
        }
    }

    private fun initNavigation() {
        val navHostFragment =
            supportFragmentManager.findFragmentById(R.id.nav_host_fragment) as NavHostFragment
        val navController = navHostFragment.navController
        binding.navView.setupWithNavController(navController)

    }

}
