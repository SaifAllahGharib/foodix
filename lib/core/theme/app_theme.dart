import 'package:flutter/material.dart';
import 'package:foodix/core/theme/light_theme.dart';

import '../styles/app_colors.dart';

abstract class AppTheme {
  static ThemeData light(BuildContext context) => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textSelectionTheme: LightTheme.textSelectionThemeData,
    textTheme: LightTheme.textTheme(context),
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primary,
    colorScheme: LightTheme.colorScheme,
    inputDecorationTheme: LightTheme.inputDecorationTheme(context),
  );
}
