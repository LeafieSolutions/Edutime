import 'package:edutime/color/app_component_colors.dart';
import 'package:edutime/color/app_text_colors.dart';
import 'package:edutime/color/app_theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationComponent extends StatelessWidget {
  final Color backgroundColor;
  final Color text1Color;
  final Color? text2Color;
  final String svgPath;
  final String mainText; // Added for flexibility
  final String subText; // Added for flexibility

  const NotificationComponent({
    super.key,
    required this.backgroundColor,
    required this.text1Color,
    required this.svgPath,
    this.mainText = 'Venue changed to BSR 241', // Default value
    this.subText = 'Lesson 15: MATH 241',
    required this.text2Color, // Default value
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The icon and main text in the same row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Aligns both items in the center
              children: [
                SvgPicture.asset(
                  svgPath,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: ColorFilter.mode(
                    AppComponentColors.purpleComponentFill,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 12.w), // Space between icon and text
                Expanded(
                  child: Text(
                    mainText,
                    style: TextStyle(
                      color: text1Color,
                      fontSize: 12.spMax,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h), // Space between the two sections

            // Secondary section with icon and text
            Container(
              height: 44.h,
              margin: EdgeInsets.only(left: 32.w, right: 12.w),
              padding: EdgeInsets.only(left: 16.w), // Add padding inside the container
              decoration: BoxDecoration(
                color: AppComponentColors.purpleComponentFill,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Lesson.svg',
                    width: 20.w,
                    height: 20.w,
                    colorFilter: ColorFilter.mode(
                      AppTextColors.pureBlack,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8.w), // Space between icon and text
                  Expanded(
                    child: Text(
                      subText,
                      style: TextStyle(
                        color: text2Color,
                        fontSize: 11.5.spMax,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}