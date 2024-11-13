import 'package:sqflite/sqflite.dart';

class Subject {
  final int id;
  final String name;
  final String teacher;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime room;

  Subject(
      {required this.name,
      required this.id,
      required this.teacher,
      required this.room,
      required this.startTime,
      required this.endTime,});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'teacher': teacher,
      'room': room,
      'startTime':startTime,
      'endTime':endTime,
    };
  }

  static Subject fromMap(<String,dynamic> map) {
    return Subject (
      id: map['id'],
      name: Map()
    );
  }

  @override
  String toString() {
    return ('Subject{id: $id, name: $name, teacher: $teacher}');
  }
}
