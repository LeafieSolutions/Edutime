import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../color/app_text_colors.dart';
import '../color/app_theme_colors.dart';

class EventTabs extends StatefulWidget {
  final String svgPath;
  final String text;

  const EventTabs({
    super.key,
    required this.svgPath,
    required this.text,
  });

  @override
  State<EventTabs> createState() => _EventTabsState();
}

class _EventTabsState extends State<EventTabs> {
  bool isSelected = false;

  void _toggleState() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleState,
      child: Container(
        margin: EdgeInsets.only(left: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 40.h,
        decoration: BoxDecoration(
          color: isSelected == true? Theme.of(context).cardColor : Theme.of(context).brightness == Brightness.light ? AppTextColors.pureWhite : AppThemeColors.darkBgPrimary,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // This allows the Row to size based on its content
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.svgPath,
              width: 16.w,
              height: 16.w,
              colorFilter: ColorFilter.mode(
                isSelected == true? Theme.of(context).textTheme.headlineMedium!.color! : Theme.of(context).cardColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 10.w), // Add space between the icon and text
            Text(
              widget.text,
              style: TextStyle(
                color: isSelected == true? Theme.of(context).textTheme.headlineMedium?.color : Theme.of(context).cardColor,
                fontFamily: 'Montserrat',
                fontSize: 12.spMax,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
