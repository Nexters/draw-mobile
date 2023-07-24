package org.nexters.draw

class JavascriptInterface(private val viewModel: MainViewModel) {

    @android.webkit.JavascriptInterface
    fun onEditTextFocused(hasFocus: Boolean) {
        // EditText의 포커스 상태에 따른 처리를 수행합니다.
        // hasFocus 변수를 사용하여 포커스 여부를 확인할 수 있습니다.
        if (hasFocus) {
            // EditText에 포커스가 생겼을 때의 처리
            // 예: 키보드가 나타날 때의 동작 등
            viewModel.setBottomBarVisible(false)
        } else {
            // EditText에서 포커스가 해제됐을 때의 처리
            // 예: 키보드가 사라질 때의 동작 등
            viewModel.setBottomBarVisible(false)
        }
    }
}
