import 'dart:collection';
import 'dart:ui';

import 'package:draw_graph/models/feature.dart';
import 'package:table_calendar/table_calendar.dart';

class Utilities {
  String getCurrentDate() {
    final String day = DateTime.now().day.toString();
    late String month;
    final String year = DateTime.now().year.toString();

    switch (DateTime.now().month) {
      case 1:
        month = "jannuari";
      case 2:
        month = "feburari";
      case 3:
        month = "maart";
      case 4:
        month = "april";
      case 5:
        month = "mei";
      case 6:
        month = "juni";
      case 7:
        month = "juli";
      case 8:
        month = "augustus";
      case 9:
        month = "september";
      case 10:
        month = "oktober";
      case 11:
        month = "november";
      case 12:
        month = "december";
    }
    return "$day $month $year";
  }
}

class Note {
  final String text;
  const Note(this.text);

  @override
  String toString() => text;
}

final kNotes = LinkedHashMap<DateTime, List<Note>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kNoteSource);

final Map<DateTime, List<Note>> _kNoteSource = {
  DateTime.now(): [
    Note('Dit is een voorbeeld van een notitie die is aangemaakt'),
  ],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

final List<Feature> features = [
  Feature(
    title: "Dagelijkse score",
    color: const Color(0XFFFFB99C),
    data: [0.4, 0.5, 0.2, 0.7, 0.9],
  )
];
