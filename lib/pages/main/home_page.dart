import 'package:edutime/color/app_component_colors.dart';
import 'package:edutime/color/app_text_colors.dart';
import 'package:edutime/color/app_theme_colors.dart';
import 'package:edutime/components/appbar_component.dart';
import 'package:edutime/components/class_widget.dart';
import 'package:edutime/components/event_tabs.dart';
import 'package:edutime/components/expandable_calender.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            ExpandableCalender(),
            ClassWidget(
              backgroundColor: Theme.of(context).brightness == Brightness.light? AppTextColors.pureWhite : AppThemeColors.darkBgPrimary,
              text1Color: Theme.of(context).brightness == Brightness.light? AppComponentColors.deepGreyFill : AppComponentColors.darkGreyComponentFill
            ),
            EventTabs(svgPath: 'assets/icons/Lesson.svg', text: 'Classes')
          ],
        ),
      ),
    );
  }
}