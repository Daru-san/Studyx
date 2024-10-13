package com.daru.studyx.ui.schoolSchedule

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel

class schoolTimetableViewModel : ViewModel() {
    private val _text = MutableLiveData<String>().apply { "School Timetable" }
    val text: LiveData<String> = _text
}