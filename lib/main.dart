import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

void main() {
  runApp(const MyApp());
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  });
}

var currentTheme = ThemeData.dark(useMaterial3: true);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studyx',
      theme: currentTheme,
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Text(widget.title),
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
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                margin: const EdgeInsets.all(0.0),
                padding: const EdgeInsets.all(0.0),
                child: const ListTile(
                  leading: Icon(Icons.local_library),
                  title: Text('Studyx'),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('School Timetable'),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppSettings(),
                  ),
                );
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
                if (details.delta.dx > 0) {
                  Scaffold.of(context).openDrawer();
                }
                if (details.delta.dx < 0) {
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
                          padding: const EdgeInsets.all(8),
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
                          padding: const EdgeInsets.all(8),
                          shrinkWrap: true,
                          children: <Widget>[
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.article),
                                    title: Text('Math Paper 2'),
                                    subtitle: Text('11 November 2024'),
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
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const ListTile(
                                    leading: Icon(Icons.article),
                                    title: Text('Physics Paper 2'),
                                    subtitle: Text('15 November 2024'),
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

class SchoolTimetable extends StatelessWidget {
  const SchoolTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Timetable'),
      ),
      body: const Center(
        child: Card(),
      ),
    );
  }
}

class ExamTimetable extends StatelessWidget {
  const ExamTimetable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Timetable'),
      ),
      body: const Center(
        child: Card(),
      ),
    );
  }
}

class StudyPlanner extends StatelessWidget {
  const StudyPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Planner'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Theme'),
            tiles: [
              SettingsTile.switchTile(
                leading: const Icon(Icons.dark_mode),
                initialValue: true,
                onToggle: (bool value) {
                  if (value) {
                    currentTheme = ThemeData.dark(useMaterial3: true);
                  } else {
                    currentTheme = ThemeData.light(useMaterial3: true);
                  }
                },
                title: const Text('Enable Dark theme'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Advanced'),
            tiles: [
              SettingsTile(
                title: const Text('Backup data'),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Icon(Icons.backup),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
