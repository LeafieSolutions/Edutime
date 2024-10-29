import 'package:edutime/pages/main/add_page.dart';
import 'package:edutime/pages/main/manage_page.dart';
import 'package:edutime/pages/main/tasks_page.dart';
import 'package:edutime/pages/main/updates_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../components/bottom_navigation_items.dart';
import '../../provider/bottom_navigation_provider.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    TasksPage(),
    AddPage(),
    UpdatesPage(),
    ManagePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[context.watch<BottomNavigationProvider>().selectedIndex], // Page Content Component
      bottomNavigationBar: SizedBox(
        height: 66.h,
        child: BottomNavigationBar(
          currentIndex: context.watch<BottomNavigationProvider>().selectedIndex,
          onTap: (index) => context.read<BottomNavigationProvider>().setIndex(index),
          selectedIconTheme: Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
          unselectedIconTheme: Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
          backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedFontSize: 11.spMax,
          unselectedFontSize: 11.spMax,
          enableFeedback: false,
          useLegacyColorScheme: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavItem.create(
              context: context,
              assetPath: 'assets/icons/navigation/Icons.svg',
              label: 'Home',
              index: 0,
            ),
            BottomNavItem.create(
              context: context,
              assetPath: 'assets/icons/navigation/Shape.svg',
              label: 'Tasks',
              index: 1,
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 4.h),
                child: SvgPicture.asset(
                  'assets/icons/Filled Plus.svg',
                  width: 32.w,
                  height: 32.h,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).cardColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: '',
            ),
            BottomNavItem.create(
              context: context,
              assetPath: 'assets/icons/navigation/Bell.svg',
              label: 'Updates',
              index: 3,
            ),
            BottomNavItem.create(
              context: context,
              assetPath: 'assets/icons/Spanner.svg',
              label: 'Manage',
              index: 4,
            ),
          ],
        ),
      ),
    );
  }
}