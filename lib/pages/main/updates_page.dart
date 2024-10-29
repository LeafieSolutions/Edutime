import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../color/app_component_colors.dart';
import '../../color/app_text_colors.dart';
import '../../color/app_theme_colors.dart';
import '../../components/appbar_component.dart';
import '../../components/expandable_calender.dart';
import '../../components/notification_component.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({super.key});

  @override
  State<UpdatesPage> createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Column(
          children: [
            ExpandableCalender(),
            NotificationComponent(
              backgroundColor: Theme.of(context).brightness == Brightness.light? AppTextColors.pureWhite : AppThemeColors.darkBgPrimary,
              text1Color: Theme.of(context).brightness == Brightness.light? AppComponentColors.deepGreyFill : AppComponentColors.darkGreyComponentFill,
              svgPath: 'assets/icons/Sparkle.svg',
              text2Color: Theme.of(context).brightness == Brightness.light? AppTextColors.pureWhite : AppTextColors.pureBlack,
            )
          ],
        ),
      ),
    );
  }
}