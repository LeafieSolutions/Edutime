import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../provider/calender_provider.dart';

class ExpandableCalender extends StatefulWidget {
  const ExpandableCalender({super.key});

  @override
  State<ExpandableCalender> createState() => _ExpandableCalenderState();
}

class _ExpandableCalenderState extends State<ExpandableCalender> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Theme.of(context).textTheme.headlineMedium?.color,
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: TableCalendar(
          firstDay: DateTime.now().subtract(const Duration(days: 50)),
          lastDay: DateTime.now().add(const Duration(days: 50)),
          focusedDay: context.watch<CalendarProvider>().expandableFocusedDay,
          calendarFormat: context.watch<CalendarProvider>().expandableCalendarFormat,
          headerVisible: false,
          rowHeight: 44.h,
          formatAnimationDuration: const Duration(milliseconds: 300),
          onPageChanged: (newFocusedDate) {
            context.read<CalendarProvider>().setFocusedDay(newFocusedDate);
          },
        ),
      ),
    );
  }
}
