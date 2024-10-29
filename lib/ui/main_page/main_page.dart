import 'package:flutter/material.dart';
import 'package:studyx/ui/app_settings/app_settings.dart';
import 'package:studyx/ui/exam_timetable/exam_timetable.dart';
import 'package:studyx/ui/school_timetable/school_timetable.dart';
import 'package:studyx/ui/study_planner/study_planner.dart';
import 'package:studyx/ui/dashboard/dashboard.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _activePage = 0;
  String _appTitle = "Dashboard";

  static const List<Widget> _pages = <Widget>[
    Dashboard(),
    SchoolTimetable(),
    ExamTimetable(),
    StudyPlanner()
  ];

  void _onPageSelect(int index, String title) {
    setState(
      () {
        _activePage = index;
        _appTitle = title;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return SizedBox.expand(
            child: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx > -1) {
                  Scaffold.of(context).openDrawer();
                }
                if (details.delta.dx < -1) {
                  if (Scaffold.of(context).isDrawerOpen) {
                    Navigator.pop(context);
                  }
                }
              },
              child: _pages[_activePage],
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Text(_appTitle),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                margin: const EdgeInsets.all(1.0),
                padding: const EdgeInsets.all(1.0),
                child: const ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text('Studyx'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              subtitle: const Text('Go to the dashboard'),
              selected: _activePage == 0,
              onTap: () {
                _onPageSelect(0, 'Dashboard');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('School Timetable'),
              subtitle: const Text('View your school timetable'),
              selected: _activePage == 1,
              onTap: () {
                _onPageSelect(1, 'School Timetable');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Exam Timetable'),
              subtitle: const Text('View your exam timetable'),
              selected: _activePage == 2,
              onTap: () {
                _onPageSelect(2, 'Exam Timetable');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_online),
              title: const Text('Study Planner'),
              subtitle: const Text('Plan your studies'),
              selected: _activePage == 3,
              onTap: () {
                _onPageSelect(3, 'Study Planner');
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 50,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              subtitle: const Text('Modify app config'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppSettings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text('Source code'),
              subtitle: const Text('https://github.com/Daru-san/Studyx'),
              onTap: () {
                //_launchURL('https://github.com/Daru-san/Studyx');
              },
            ),
            ListTile(
              leading: const Icon(Icons.android),
              title: const Text('v0.1-Alpha'),
              subtitle: const Text('Early development version'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
