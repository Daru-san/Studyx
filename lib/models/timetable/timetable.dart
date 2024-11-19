import 'package:studyx/main.dart';
import '../subjects/subject.dart';

//TODO: Save in a database
class Timetable {
  final DateTime startTime;
  final DateTime endTime;
  final String teacher;
  // final SubjectEntriees?

  //TODO: Get this as an array somehow,
  //we need multiple items per entry in the Timetable
  final Subject subject;

  Timetable(this.startTime, this.endTime, this.subject, this.teacher);

  // This will have to be done hierarchically, with a bit more stuff
  // like `final lessonLegth = json['lessonLegth']`
  // Then some way to search through the array of subjects on days
  Map<String, Object?> toMap() {
    return {'startTime': startTime, 'endTime': endTime, 'subject': subject};
  }

  insertTimetable(Timetable timetable) async {
    // await appDatabase.;
  }
}

//NOTE: This is very likely to change
class SubjectEntry {
  final DateTime startTime;
  final DateTime endTime;
  final DateTime day;
  final Subject subject;
  SubjectEntry(this.day, this.startTime, this.endTime, this.subject);
}

/*
*NOTE:
* This is all very subject to change, I hope to learn
* sql and then use databases to store all of this data
* rather than using json files, it seems like that would
* be much cleaner than using a json file
* */
