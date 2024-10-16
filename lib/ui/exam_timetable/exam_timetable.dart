import 'package:flutter/material.dart';

class ExamTimetable extends StatelessWidget {
  const ExamTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Timetable'),
      ),
      //TODO: Initialize the calendar
      body: const Center(
        child: Card(
          child: ListTile(
            leading: Icon(Icons.construction),
            title: Text('Under construction'),
          ),
        ),
      ),
    );
  }
}