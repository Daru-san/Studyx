package com.daru.studyx.ui.dashboard

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class dashboardViewModel : ViewModel() {
    private val _text = MutableLiveData<String>().apply { "Dashboard" }
    val text: LiveData<String> = _text
}