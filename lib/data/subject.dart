class Subject {
  final String name;
  final String teacher;
  final subjectEntry subjectEntries[];//Array maybe
  Subject(this.name,this.teacher,this.subjectEntries);
}

class SubjectEntry {
  final DateTime startTime;
  final DateTime endTime;
  final DateTime day;
  SubjectEntry(this.day,this.startTime,this.endTime);
}
