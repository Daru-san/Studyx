import 'package:flutter/material.dart';
import 'package:studyx/models/subjects/subject.dart';
import 'package:studyx/views/subject_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Subject> subjectsList = [
    Subject(
      name: 'English',
      id: 11,
      teacher: 'Mr Who',
      room: '45',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
    Subject(
      name: 'Math',
      id: 13,
      teacher: 'Ms Who',
      room: '41',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
    Subject(
      name: 'Phyics',
      id: 32,
      teacher: 'Who is WHO',
      room: '1000',
      startTime: DateTime.now(),
      endTime: DateTime.now(),
    ),
  ];

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
              children: [
                ListTile(
                  leading: const Icon(Icons.subject),
                  title: const Text('All subjects'),
                  tileColor: Theme.of(context).colorScheme.tertiaryContainer,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(subjectsList[index].name),
                      isThreeLine: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubjectView(
                              subject: subjectsList[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
