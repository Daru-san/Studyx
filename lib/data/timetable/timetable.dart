import 'package:studyx/data/subjects/subject.dart';

//TODO: Parse the json data within the `subjects array`
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
  Timetable.fromJson(Map<String, dynamic> json)
      : startTime = json['startDate'] as DateTime,
        endTime = json['endDate'] as DateTime,
        // subject = json['subject'] as String,
        teacher = json['teacher'] as String;

  Map<String, dynamic> toJson() => {
        'startDate': startTime,
        'endDate': endTime,
        'subject': subject,
        'teacher': teacher
      };
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
