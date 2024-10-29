import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../provider/calender_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(52.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 52.h,
      backgroundColor: Theme.of(context).textTheme.headlineMedium?.color,
      actions: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMenuButton(context),
                    _buildCalendarHeader(context),
                    _buildNotificationIcon(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 13.w),
      child: SvgPicture.asset(
        'assets/icons/navigation/Menu.svg',
        width: 22.w,
        height: 22.w,
        colorFilter: ColorFilter.mode(
          Theme.of(context).cardColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildCalendarHeader(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Toggle calendar format when the icon is tapped
        context.read<CalendarProvider>().toggleCalendarFormat();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            CalendarProvider.formatMonthYear(context.watch<CalendarProvider>().expandableFocusedDay),
            style: TextStyle(
              color: Theme.of(context).textTheme.headlineSmall!.color!,
              fontSize: 14.spMax,
              fontFamily: 'Montserrat',
              fontVariations: <FontVariation>[FontVariation('wght', 400)],
            ),
          ),
          SizedBox(width: 10.w),
          SvgPicture.asset(
            context.watch<CalendarProvider>().expandableCalendarFormat == CalendarFormat.month
                ? 'assets/icons/Up Direction.svg'
                : 'assets/icons/Down Direction.svg',
            width: 9.w,
            height: 12.w,
            colorFilter: ColorFilter.mode(
              Theme.of(context).textTheme.headlineSmall!.color!,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 13.w),
      child: SvgPicture.asset(
        'assets/icons/Today.svg',
        width: 22.w,
        height: 22.w,
        colorFilter: ColorFilter.mode(
          Theme.of(context).cardColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}