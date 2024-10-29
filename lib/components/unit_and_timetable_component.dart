import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UnitAndTimetableComponent extends StatefulWidget {
  const UnitAndTimetableComponent({super.key});

  @override
  State<UnitAndTimetableComponent> createState() => _UnitAndTimetableComponentState();
}

class _UnitAndTimetableComponentState extends State<UnitAndTimetableComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _placeholderRow(),
        SizedBox(height: 20.w),
        _classScheduleDetails(context)
      ],
    );
  }

  // First Row
  Row _placeholderRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/icons/Checkbox Outline.svg',
          width: 20.w,
          height:20.w,
          colorFilter: ColorFilter.mode(
            Theme.of(context).cardColor,
            BlendMode.srcIn
          ),
        ),
        SizedBox(width: 20.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ACSC 222',
              style: TextStyle(
                color: Theme.of(context).textTheme.headlineSmall!.color!,
                fontSize: 12.spMax,
                fontFamily: 'Montserrat',
                fontVariations: <FontVariation>[FontVariation('wght', 500)],
              )
            ),
            SizedBox(height: 2.h),
            Text(
              'Discrete Mathematics',
              style: TextStyle(
                color: Theme.of(context).textTheme.headlineSmall!.color!,
                fontSize: 10.spMax,
                fontFamily: 'Montserrat',
                fontVariations: <FontVariation>[FontVariation('wght', 300)],
                overflow: TextOverflow.ellipsis
              )
            )
          ]
        ),
        Expanded(child: Container()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lecturer',
              style: TextStyle(
                color: Theme.of(context).textTheme.headlineSmall!.color!,
                fontSize: 12.spMax,
                fontFamily: 'Montserrat',
                fontVariations: <FontVariation>[FontVariation('wght', 500)],
              )
            ),
            SizedBox(height: 2.h),
            Text(
              'Dr. Joseph Kinyua',
              style: TextStyle(
                color: Theme.of(context).textTheme.headlineSmall!.color!,
                fontSize: 11.spMax,
                fontFamily: 'Montserrat',
                fontVariations: <FontVariation>[FontVariation('wght', 300)],
                overflow: TextOverflow.ellipsis
              )
            )
          ]
        )
      ],
    );
  }

  Container _classScheduleDetails(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      margin: EdgeInsets.only(left: 40.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).textTheme.headlineSmall!.color!,
          width: .5
        ),
        borderRadius: BorderRadius.circular(6.r)
      ),
      child: Row(
        children: [
          Text(
            'Mon',
            style: TextStyle(
              color: Theme.of(context).textTheme.headlineSmall!.color!,
              fontSize: 12.spMax,
              fontFamily: 'Montserrat',
              fontVariations: <FontVariation>[FontVariation('wght', 500)],
            )
          ),
          SizedBox(width: 15.w),
          Text(
            '11:00hrs - 13:00hrs',
            style: TextStyle(
              color: Theme.of(context).textTheme.headlineSmall!.color!,
              fontSize: 12.spMax,
              fontFamily: 'Montserrat',
              fontVariations: <FontVariation>[FontVariation('wght', 400)],
            )
          ),
          Expanded(child: Container()),
          Text(
            'BSR 402',
            style: TextStyle(
              color: Theme.of(context).textTheme.headlineSmall!.color!,
              fontSize: 12.spMax,
              fontFamily: 'Montserrat',
              fontVariations: <FontVariation>[FontVariation('wght', 500)],
            )
          ),
        ],
      ),
    );
  }
}