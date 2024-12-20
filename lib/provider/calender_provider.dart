import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarProvider with ChangeNotifier {
  DateTime _expandableFocusedDay = DateTime.now();
  CalendarFormat _expandableCalendarFormat = CalendarFormat.week;

  DateTime? _cellCalendarSelectedDate;
  TimeOfDay? _cellCalendarSelectedTime;
  bool _showDraggableSheetOnClick = false;

  CalendarFormat get expandableCalendarFormat => _expandableCalendarFormat;
  DateTime get expandableFocusedDay => _expandableFocusedDay;

  DateTime? get cellCalendarSelectedDate => _cellCalendarSelectedDate;
  TimeOfDay? get cellCalendarSelectedTime => _cellCalendarSelectedTime;
  bool get showDraggableSheet => _showDraggableSheetOnClick;

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

  void tapOnGrid(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      _cellCalendarSelectedDate = calendarTapDetails.date!;
      _cellCalendarSelectedTime = TimeOfDay.fromDateTime(calendarTapDetails.date!);
      _showDraggableSheetOnClick = true;
      notifyListeners();
    } else {
      return ;
    }
  }

  void clearCellCalenderContent() {
    _cellCalendarSelectedTime = null;
    _cellCalendarSelectedDate = null;
    _showDraggableSheetOnClick = false;
    notifyListeners();
  }
}
