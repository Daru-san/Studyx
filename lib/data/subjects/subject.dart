import 'package:sqflite/sqlite_api.dart';
import 'package:studyx/main.dart';

class Subject {
  final int id;
  final String name;
  final String teacher;

  //NOTE: May scrap this for something better
  final String classNum;
  Subject(this.name, this.teacher, this.classNum);

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'teacher': teacher,
    };
  }

  @override
    String toString() {
      return('Subject{id: $id, name: $name, teacher: $teacher}');
    }
}

Future<void> insertSubject(Subject subject){
  final db = await database;

  await db.insert(
  'subjects',
  subject.toMap(),
  ConflictAlgorithm:ConflictAlgorithm.replace,
  );
}
