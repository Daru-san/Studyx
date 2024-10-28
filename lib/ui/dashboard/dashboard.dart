import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  tileColor: Theme.of(context).colorScheme.tertiaryContainer,
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
                            subtitle:
                                Text('Trigonometric functions and equations'),
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
                  tileColor: Theme.of(context).colorScheme.tertiaryContainer,
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
    );
  }
}
