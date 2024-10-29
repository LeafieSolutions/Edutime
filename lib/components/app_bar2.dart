import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const AppBar2({super.key});

  @override
  Size get preferredSize => Size.fromHeight(105.h);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppBar(
        toolbarHeight: 105.h,
        backgroundColor: Theme.of(context).textTheme.headlineMedium?.color,
        actions: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              margin: EdgeInsets.only(top: 20.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _menuIconButton(context),
                      _manageText(context),
                      _verticalDotsIcon(context)
                    ]
                  )
                ]
              )
            )
          )
        ],
        bottom: _tabBar(context),
      ),
    );
  }

  // First Action button (Menu)
  Widget _menuIconButton(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/navigation/Menu.svg',
      width: 22.w,
      height: 22.w,
      colorFilter: ColorFilter.mode(
        Theme.of(context).cardColor,
        BlendMode.srcIn
      ),
    );
  }

  // Text to show the current page selected
  Text _manageText(BuildContext context) {
    return Text(
      'Manage',
      style: TextStyle(
        color: Theme.of(context).textTheme.headlineSmall!.color!,
        fontSize: 16.spMax,
        fontFamily: 'Montserrat',
        fontVariations: <FontVariation>[FontVariation('wght', 400)],
      ),
    );
  }

  // Last Action button (Menu)
  Widget _verticalDotsIcon(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/Tridots.svg',
      width: 22.w,
      height: 22.w,
      colorFilter: ColorFilter.mode(
        Theme.of(context).cardColor,
        BlendMode.srcIn
      ),
    );
  }

  TabBar _tabBar(BuildContext context) {
    return TabBar(
      labelStyle: TextStyle(
        color: Theme.of(context).textTheme.headlineSmall!.color!,
        fontSize: 11.spMax,
        fontFamily: 'Montserrat',
        fontVariations: <FontVariation>[FontVariation('wght', 400)],
      ),
      indicatorColor: Theme.of(context).cardColor,
      tabs: [
        Tab(
          text: 'Units and Timetable',
        ),
        Tab(
          text: 'Classmates'
        ),
      ],
    );
  }
}