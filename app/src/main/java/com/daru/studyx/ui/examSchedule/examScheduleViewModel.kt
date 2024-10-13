package com.daru.studyx.ui.examSchedule

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class examScheduleViewModel : ViewModel() {
    private val _text = MutableLiveData<String>().apply { "Exam Timetable"}
    val text: LiveData<String> = _text
}