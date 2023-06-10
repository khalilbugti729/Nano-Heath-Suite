import 'package:flutter/material.dart';
import 'package:nano_health_suite/config/theme/app_style.dart';

import '../../utils/constants/app_colors.dart';

class AppTheme {
  static ThemeData? lightTheme(BuildContext context) {
    return ThemeData(
      primaryColor: kPrimaryColor,
      fontFamily: 'SFProRegular',
      colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      scaffoldBackgroundColor: kScaffoldColor,
      primarySwatch: materialprimarycolor,
      iconTheme: const IconThemeData(color: knavybluee),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: kWhiteColor,
        elevation: 0,
        titleTextStyle: AppStyle.titleLarge(context),
        iconTheme: const IconThemeData(color: knavybluee),
      ),
    );
  }
}
