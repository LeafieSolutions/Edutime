import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarProvider with ChangeNotifier {
  DateTime _expandableFocusedDay = DateTime.now();
  CalendarFormat _expandableCalendarFormat = CalendarFormat.week;

  CalendarFormat get expandableCalendarFormat => _expandableCalendarFormat;
  DateTime get expandableFocusedDay => _expandableFocusedDay;

  void toggleCalendarFormat() {
    _expandableCalendarFormat = _expandableCalendarFormat == CalendarFormat.week
        ? CalendarFormat.month
        : CalendarFormat.week;
    notifyListeners();
  }

  void setFocusedDay(DateTime day) {
    _expandableFocusedDay = day;
    notifyListeners();
  }

  static String formatMonthYear(DateTime date) {
    return "${DateFormat('MMMM').format(date)} ${date.year}";
  }
}
