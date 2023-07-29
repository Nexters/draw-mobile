package org.nexters.draw

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class MainViewModel:ViewModel() {


    private var _isBottomBarVisible = MutableLiveData(true)
    val isBottomBarVisible: LiveData<Boolean> = _isBottomBarVisible

    fun setBottomBarVisible(value:Boolean){
        _isBottomBarVisible.postValue(value)
    }


}
