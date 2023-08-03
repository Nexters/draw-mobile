package org.nexters.draw

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.fragment.app.activityViewModels
import org.nexters.draw.databinding.FragmentMyPageBinding

class MyPageFragment : Fragment() {

    private var _binding: FragmentMyPageBinding? = null
    private val binding get() = _binding!!

    private val mainViewModel: MainViewModel by activityViewModels()


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        // Inflate the layout for this fragment
        _binding = FragmentMyPageBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        binding.wbDraw.apply {
            DrawWebViewClient.run {
                initWebView(this@apply)
                loadWebUrl(this@apply, BuildConfig.WEB_URL_MY_PAGE)
            }
            addJavascriptInterface(
                JavascriptInterface(mainViewModel, requireContext()),
                "draw"
            )
        }

    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }


}
