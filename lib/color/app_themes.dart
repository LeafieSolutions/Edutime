import 'package:edutime/color/app_component_colors.dart';
import 'package:edutime/color/app_text_colors.dart';
import 'package:edutime/color/app_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    splashFactory: NoSplash.splashFactory,
    splashColor: Color(0xFF000000),
    scaffoldBackgroundColor: AppThemeColors.lightBgSecondary,
    dividerColor: AppComponentColors.lightGreyComponentFill,
    disabledColor: AppComponentColors.greyIconFill,
    hintColor: AppTextColors.primaryLightTextColor,
    cardColor: AppComponentColors.lightIconFill,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppThemeColors.lightBgPrimary,
      selectedItemColor: AppComponentColors.lightIconFill,
      unselectedItemColor: AppComponentColors.greyIconFill
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: AppComponentColors.lightIconFill
    ),

    iconTheme: IconThemeData(
      color:AppComponentColors.lightIconFill
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppComponentColors.lightIconFill,
        fontFamily: 'Montserrat',
        fontSize: 24.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      titleMedium: TextStyle(
        color: AppComponentColors.lightIconFill,
        fontFamily: 'Montserrat',
        fontSize: 14.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      titleSmall: TextStyle(
        color: AppComponentColors.lightIconFill,
        fontFamily: 'Montserrat',
        fontSize: 12.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),

      headlineMedium: TextStyle(
        color: AppTextColors.pureWhite,
        fontFamily: 'Montserrat',
        fontSize: 12.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      headlineSmall: TextStyle(
        color: AppTextColors.pureBlack,
        fontFamily: 'Montserrat',
        fontSize: 10.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 400)]
      ),

      bodyLarge: TextStyle(
        color: AppComponentColors.darkIconFill,
        fontFamily: 'Montserrat',
        fontSize: 12.spMax,
        fontVariations: <FontVariation>[FontVariation('wght', 500)],
        decoration: TextDecoration.underline,
        decorationColor: AppComponentColors.darkIconFill
      ),
      bodyMedium: TextStyle(
        color: AppTextColors.primaryLightTextColor,
        fontFamily: 'Montserrat',
        fontSize: 12.spMax,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      bodySmall: TextStyle(
        color: AppTextColors.primaryLightTextColor,
        fontFamily: 'Montserrat',
        fontSize: 10.spMax,
        fontVariations: <FontVariation>[FontVariation('wght', 400)]
      ),

      /// for labels in class details widget
      labelMedium: TextStyle(
        color: AppTextColors.secondaryLightTextColor,
        fontFamily: 'Montserrat',
        fontSize: 10.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      labelSmall: TextStyle(
        color: AppComponentColors.deepGreyFill,
        fontFamily: 'Montserrat',
        fontSize: 10.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 400)]
      )
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    splashFactory: NoSplash.splashFactory,
    splashColor: Color(0xFF000000),
    scaffoldBackgroundColor: AppThemeColors.darkBgSecondary,
    dividerColor: AppComponentColors.darkGreyComponentFill,
    ///disabledColor: AppComponentColors.greyIconFill,
    hintColor: AppTextColors.darkHintTextColor,
    cardColor: AppComponentColors.darkIconFill,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppThemeColors.darkBgPrimary,
      selectedItemColor: AppComponentColors.darkIconFill,
      unselectedItemColor: AppComponentColors.darkGreyIconFill
    ),

    buttonTheme: ButtonThemeData(
      buttonColor: AppComponentColors.darkIconFill
    ),

    iconTheme: IconThemeData(
      color:AppComponentColors.darkIconFill
    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppComponentColors.darkIconFill,
        fontFamily: 'Montserrat',
        fontSize: 24.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      titleMedium: TextStyle(
        color: AppComponentColors.darkIconFill, // should be changed to the updated
        fontFamily: 'Montserrat',
        fontSize: 14.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      titleSmall: TextStyle(
        color: AppComponentColors.darkIconFill,
        fontFamily: 'Montserrat',
        fontSize: 12.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),

      headlineMedium: TextStyle(
        color: AppThemeColors.darkBgPrimary,
        fontFamily: 'Montserrat',
        fontSize: 12.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      headlineSmall: TextStyle(
        color: AppTextColors.pureWhite,
        fontFamily: 'Montserrat',
        fontSize: 10.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 400)]
      ),

      bodyLarge: TextStyle(
        color: AppComponentColors.darkIconFill,
        fontFamily: 'Montserrat',
        fontSize: 12.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 500)],
        decoration: TextDecoration.underline,
        decorationColor: AppComponentColors.darkIconFill
      ),
      bodyMedium: TextStyle(
        color: AppComponentColors.darkGreyComponentFill,
        fontFamily: 'Montserrat',
        fontSize: 12.spMax,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      bodySmall: TextStyle(
        color: AppComponentColors.darkGreyComponentFill,
        fontFamily: 'Montserrat',
        fontSize: 10.spMax,
        fontVariations: <FontVariation>[FontVariation('wght', 400)]
      ),

      /// for labels in class details widget
      labelMedium: TextStyle(
        color: AppTextColors.secondaryDarkTextColor,
        fontFamily: 'Montserrat',
        fontSize: 10.spMax,
        fontVariations: <FontVariation>[FontVariation('wght', 500)]
      ),
      labelSmall: TextStyle(
        color: AppComponentColors.darkGreyComponentFill,
        fontFamily: 'Montserrat',
        fontSize: 10.spMin,
        fontVariations: <FontVariation>[FontVariation('wght', 400)]
      )
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
}