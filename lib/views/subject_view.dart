import 'package:flutter/material.dart';
import 'package:studyx/models/subjects/subject.dart';

class SubjectView extends StatelessWidget {
  const SubjectView({super.key, required this.subject});
  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomAppBar(
        child: TextButton(
          onPressed: () {
            //TODO: EDIT SUBJECT
          },
          child: const Text('Edit subject'),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text("Name: ${subject.name}"),
            ),
            ListTile(
              title: Text("Room: ${subject.room}"),
            ),
            ListTile(
              title: Text("Teacher: ${subject.teacher}"),
            )
          ],
        ),
      ),
    );
  }
}
