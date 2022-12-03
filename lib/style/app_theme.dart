import 'package:flutter/material.dart';
import 'package:staff_breeze/style/app_colors.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: MaterialColor(0xff6D7EB4,color)),
    fontFamily: 'montserrat',
    accentColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  );
}

Map<int, Color> color = {
  50: const Color.fromRGBO(109, 126, 180, 0.1),
  100: const Color.fromRGBO(109, 126, 180, 0.2),
  200: const Color.fromRGBO(109, 126, 180, 0.3),
  300: const Color.fromRGBO(109, 126, 180, 0.4),
  400: const Color.fromRGBO(109, 126, 180, 0.5),
  500: const Color.fromRGBO(109, 126, 180, 0.6),
  600: const Color.fromRGBO(109, 126, 180, 0.7),
  700: const Color.fromRGBO(109, 126, 180, 0.8),
  800: const Color.fromRGBO(109, 126, 180, 0.9),
  900: const Color.fromRGBO(109, 126, 180, 1),
};
