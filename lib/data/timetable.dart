class Timetable {
  final DateTime startDate;
  final DateTime endDate;

  Timetable(this.startDate, this.endDate);

  Timetable.fromJson(Map<String, dynamic> json)
      : startDate = json['startDate'] as DateTime,
        endDate = json['endDate'] as DateTime;

  Map<String, dynamic> toJson() => {'startDate': startDate, 'endDate': endDate};
}
