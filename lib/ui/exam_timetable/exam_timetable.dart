import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ExamTimetable extends StatefulWidget {
  const ExamTimetable({super.key});

  @override
  State<ExamTimetable> createState() {
    return _ExamTimetableState();
  }
}

class _ExamTimetableState extends State<ExamTimetable> {
  final CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfCalendar(
          view: CalendarView.day,
          firstDayOfWeek: 1,
          controller: _calendarController,
          timeSlotViewSettings: const TimeSlotViewSettings(
            startHour: 7,
            endHour: 15,
            timeIntervalHeight: -1,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Change view',
        child: const Icon(Icons.view_day),
        onPressed: () {
          if (_calendarController.view == CalendarView.week) {
            _calendarController.view = CalendarView.day;
          } else {
            _calendarController.view = CalendarView.week;
          }
        },
      ),
    );
  }
}

