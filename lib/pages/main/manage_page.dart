import 'package:edutime/components/app_bar2.dart';
import 'package:edutime/components/custom_search_bar.dart';
import 'package:edutime/components/unit_and_timetable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar2(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              CustomSearchBar(),
              UnitAndTimetableComponent()
            ],
          ),
        ),
      ),
    );
  }
}