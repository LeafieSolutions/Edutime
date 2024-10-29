import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:edutime/provider/bottom_navigation_provider.dart';

class BottomNavItem {
  static BottomNavigationBarItem create({
    required BuildContext context,
    required String assetPath,
    required String label,
    required int index,
  }) {
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final isSelected = context.watch<BottomNavigationProvider>().selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        child: SvgPicture.asset(
          assetPath,
          width: 22.w,
          height: 22.h,
          colorFilter: ColorFilter.mode(
            isSelected ? theme.selectedItemColor! : theme.unselectedItemColor!,
            BlendMode.srcIn,
          ),
        ),
      ),
      label: label,
    );
  }
}