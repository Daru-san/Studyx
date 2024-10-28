import 'package:flutter/material.dart';

class StudyPlanner extends StatefulWidget {
  const StudyPlanner({super.key});

  @override
  State<StudyPlanner> createState() {
    return _StudyPlannerState();
  }
}

class _StudyPlannerState extends State<StudyPlanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          Center(
            child: Text('Nothing to see here, add an item!'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}

