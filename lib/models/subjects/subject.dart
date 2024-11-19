class Subject {
  final int id;
  final String name;
  final String teacher;
  final DateTime startTime;
  final DateTime endTime;
  final String room;

  Subject({
    required this.name,
    required this.id,
    required this.teacher,
    required this.room,
    required this.startTime,
    required this.endTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'teacher': teacher,
      'room': room,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'id': int id,
        'name': String name,
        'teacher': String teacher,
        'room': String room,
        'startTime': DateTime startTime,
        'endTime': DateTime endTime
      } =>
        Subject(
          id: id,
          name: name,
          teacher: teacher,
          room: room,
          startTime: startTime,
          endTime: endTime,
        ),
      _ => throw Exception('Failed to convert timetable'),
    };
  }

  static const tableName = "subject_table";
  static const colums = [
    "id",
    "name",
    "teacher",
    "room",
    "start_time",
    "end_time",
  ];
  @override
  String toString() {
    return ('Subject{id: $id, name: $name, teacher: $teacher}');
  }
}
