import 'package:flutter/material.dart';

class SchoolTimetable extends StatelessWidget {
  const SchoolTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Timetable'),
      ),
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