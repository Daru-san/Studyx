import 'package:flutter/material.dart';
import 'package:studyx/ui/app_settings/app_settings.dart';
import 'package:studyx/ui/school_timetable/school_timetable.dart';
import 'package:studyx/ui/exam_timetable/exam_timetable.dart';
import 'package:studyx/ui/study_planner/study_planner.dart';
//import 'package:url_launcher/url_launcher.dart';

//TODO: GO TO GITHUB PAGE
/*Future<void> _launchURL(String url) async {
  Uri finalUrl = Uri.parse(url);
  if (!await launchUrl(finalUrl)) {
    throw Exception('Could not launch $url');
  }
}*/

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  final _title = 'Dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Text(widget._title),
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
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(9),
                  ),
                ),
                margin: const EdgeInsets.all(-1.0),
                padding: const EdgeInsets.all(-1.0),
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
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('School Timetable'),
              subtitle: const Text('View your school timetable'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SchoolTimetable(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Exam Timetable'),
              subtitle: const Text('View your exam timetable'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExamTimetable(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_online),
              title: const Text('Study Planner'),
              subtitle: const Text('Plan your studies'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudyPlanner(),
                  ),
                );
              },
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
          ],
        ),
      ),
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
              child: Center(
                child: ListView(
                  shrinkWrap: false,
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.topic),
                          title: const Text('Current Topics'),
                          tileColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        ListView(
                          padding: const EdgeInsets.all(7),
                          shrinkWrap: true,
                          children: <Widget>[
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.article),
                                    title: Text('Trigonometry'),
                                    subtitle: Text(
                                        'Trigonometric functions and equations'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        child: const Text('Study'),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.subject),
                          title: const Text('Upcoming papers'),
                          tileColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        ListView(
                          padding: const EdgeInsets.all(7),
                          shrinkWrap: true,
                          children: <Widget>[
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.article),
                                    title: Text('Math Paper 1'),
                                    subtitle: Text('10 November 2024'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        child: const Text('View'),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.article),
                                    title: Text('Physics Paper 0'),
                                    subtitle: Text('13 November 2024'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        child: const Text('View'),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.article),
                                    title: Text('Physics Paper 1'),
                                    subtitle: Text('14 November 2024'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        child: const Text('View'),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}