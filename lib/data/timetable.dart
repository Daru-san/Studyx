//TODO: Parse the json data within the `subjects array`
class Timetable {
  final DateTime startTime;
  final DateTime endTime;
  final String subject;
  final String teacher;

  Timetable(this.startTime, this.endTime, this.subject, this.teacher);

  // This will have to be done hierarchically, with a bit more stuff
  // like `final lessonLegth = json['lessonLegth']`
  // Then some way to search through the array of subjects on days
  Timetable.fromJson(Map<String, dynamic> json)
      : startTime = json['startDate'] as DateTime,
        endTime = json['endDate'] as DateTime,
        subject = json['subject'] as String,
        teacher = json['teacher'] as String;

  Map<String, dynamic> toJson() => {
        'startDate': startTime,
        'endDate': endTime,
        'subject': subject,
        'teacher': teacher
      };
}
