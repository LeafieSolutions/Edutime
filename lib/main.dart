import 'package:edutime/domain/implementation/theme_repo_implementation.dart';
import 'package:edutime/domain/implementation/venue_booking_repo_implementation.dart';
import 'package:edutime/domain/usecases/get_theme_use_case.dart';
import 'package:edutime/domain/usecases/save_theme_use_case.dart';
import 'package:edutime/domain/usecases/toggle_theme_use_case.dart';
import 'package:edutime/pages/main/main_page.dart';
import 'package:edutime/provider/bottom_navigation_provider.dart';
import 'package:edutime/provider/calender_provider.dart';
import 'package:edutime/provider/theme_provider.dart';
import 'package:edutime/provider/venue_booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'color/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeRepository = ThemeRepoImplementation();

    return ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ThemeProvider(
                getThemeUseCase: GetThemeUseCase(themeRepository),
                saveThemeUseCase: SaveThemeUseCase(themeRepository),
                toggleThemeUseCase: ToggleThemeUseCase(themeRepository),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => BottomNavigationProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => CalendarProvider()
            ),
            ChangeNotifierProvider(
              create: (_) => VenueBookingProvider(VenueBookingRepoImplementation()),
            )
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                title: 'Edutime',
                debugShowCheckedModeBanner: false,
                themeMode: themeProvider.themeMode, // Using ThemeMode from the provider
                theme: AppThemes.lightTheme,       // Light theme
                darkTheme: AppThemes.darkTheme,     // Dark theme
                home: const MainPage(),
              );
            },
          ),
        );
      }
    );
  }
}
