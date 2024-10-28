import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SchoolTimetable extends StatefulWidget {
  const SchoolTimetable({super.key});

  @override
  State<SchoolTimetable> createState() => _SchoolTimetableState();
}

class _SchoolTimetableState extends State<SchoolTimetable> {
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
          dataSource: TimeTableDataSource(getClasses()),
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

class DatePicker extends StatelessWidget {
  DatePicker({super.key});

  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SfDateRangePicker(
          showActionButtons: true,
          controller: _dateRangePickerController,
          onSubmit: (selection) {},
          onCancel: () {
            _dateRangePickerController.selectedRange = null;
          },
        ),
      ),
    );
  }
}

class TimeTableDataSource extends CalendarDataSource {
  TimeTableDataSource(List<Appointment> source) {
    appointments = source;
  }
}

List<Appointment> getClasses() {
  List<Appointment> classes = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 7, 45, 0);

  classes.add(
    Appointment(
      startTime: startTime,
      endTime: startTime.add(const Duration(minutes: 45)),
      subject: 'Life Orientation',
      color: Colors.grey,
      recurrenceRule: 'FREQ=DAILY;COUNT=30;INTERVAL=3',
    ),
  );
  classes.add(
    Appointment(
      startTime: startTime.add(const Duration(minutes: 45)),
      endTime: startTime.add(const Duration(minutes: 90)),
      subject: 'Physics',
      color: Colors.green,
      recurrenceRule: 'FREQ=DAILY;COUNT=10;INTERVAL=2',
    ),
  );
  classes.add(
    Appointment(
      startTime: startTime.add(const Duration(minutes: 90)),
      endTime: startTime.add(const Duration(minutes: 135)),
      subject: 'Life Science',
      color: Colors.pink,
      recurrenceRule: 'FREQ=DAILY;COUNT=10;INTERVAL=1',
    ),
  );
  classes.add(
    Appointment(
      startTime: startTime.add(const Duration(minutes: 135)),
      endTime: startTime.add(const Duration(minutes: 180)),
      subject: 'English',
      color: Colors.brown,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
    ),
  );

  classes.add(
    Appointment(
      startTime: startTime.add(const Duration(minutes: 180)),
      endTime: startTime.add(const Duration(minutes: 225)),
      subject: 'Math',
      color: Colors.teal,
      recurrenceRule: 'FREQ=DAILY;COUNT=10',
    ),
  );

  classes.add(
    Appointment(
      startTime: startTime.add(
        const Duration(minutes: 225, days: 1),
      ),
      endTime: startTime.add(const Duration(minutes: 270, days: 1)),
      subject: 'Afrikaans',
      color: Colors.purpleAccent,
      recurrenceRule: 'FREQ=DAILY;COUNT=10;INTERVAL=2',
    ),
  );

  classes.add(
    Appointment(
      startTime: startTime.add(
        const Duration(minutes: 270, days: 2),
      ),
      endTime: startTime.add(const Duration(minutes: 315, days: 2)),
      subject: 'Computer Science',
      color: Colors.blueAccent,
      recurrenceRule: 'FREQ=DAILY;COUNT=10;INTERVAL=2',
    ),
  );
  return classes;
}
