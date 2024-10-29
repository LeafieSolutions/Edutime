import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassWidget extends StatelessWidget {
  //final ClassModel lecture;
  final Color backgroundColor;
  final Color text1Color;

  const ClassWidget({
    super.key,
    //required this.lecture,
    required this.backgroundColor,
    required this.text1Color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          _column1(context, Theme.of(context).cardColor),
          SizedBox(width: 12.w),
          _column2(context),
          SizedBox(width: 12.w),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: _column3(context, text1Color),
          ),
          Expanded(child: Container()),
          _column4(context, text1Color),
          SizedBox(width: 10.w),
          _column5(text1Color),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}

Column _column1 (BuildContext context, Color fillColor) {
  return Column(
    children: [
      Expanded(
        child: Container(
          width: 4.w,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), bottomLeft: Radius.circular(10.r))
          ),
        ),
      )
    ],
  );
}

Column _column2 (BuildContext context) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: Icon(
          Icons.integration_instructions_rounded,
          color: Theme.of(context).cardColor,
          size: 30.w
        ),
      )
    ],
  );
}

Column _column3 (BuildContext context, Color text1Color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Lesson 30: ACSC 121',
        style: TextStyle(
          color: text1Color,
          fontSize: 13.spMax,
          fontFamily: 'Montserrat',
          fontVariations: <FontVariation>[FontVariation('wght', 500)]
        )
      ),
      SizedBox(height: 1.h),
      Text(
        'Data Structures and Algorithms',
        style: TextStyle(
          color: text1Color,
          fontSize: 10.spMax,
          fontFamily: 'Montserrat',
          fontVariations: <FontVariation>[FontVariation('wght', 400)]
        )
      ),
      SizedBox(height: 20.h),
      Text(
        'BSR 202',
        style: TextStyle(
          color: text1Color,
          fontSize: 10.spMax,
          fontFamily: 'Montserrat',
          fontVariations: <FontVariation>[FontVariation('wght', 500)]
        )
      )
    ],
  );
}

Column _column4(BuildContext context, Color color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
        child: Container(
        width: .5,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: color,
          ),
        ),
      )
    ],
  );
}

Column _column5(Color textColor) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        '09:00 am',
        style: TextStyle(
          color: textColor,
          fontSize: 10.spMax,
          fontFamily: 'Montserrat',
          fontVariations: <FontVariation>[FontVariation('wght', 500)]
        )
      ),
      Text(
        '11:00 am',
        style: TextStyle(
          color: textColor,
          fontSize: 10.spMax,
          fontFamily: 'Montserrat',
          fontVariations: <FontVariation>[FontVariation('wght', 500)]
        ),
      )
    ],
  );
}
