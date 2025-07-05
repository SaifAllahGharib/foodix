import 'package:flutter/material.dart';  
import 'package:foodix/core/di/dependency_injection.dart';  
import 'package:foodix/core/services/shared_preferences_service.dart';  
import 'package:foodix/core/utils/extensions.dart';  

import '../styles/app_colors.dart';  

abstract class LightTheme {
  static TextStyle _textStyle(BuildContext context) => TextStyle(
    color: Colors.black,
    fontFamily: (getIt<SharedPreferencesService>().getLanguageCode() == "ar")
        ? "cairo"
        : "poppins",
  );

  static TextTheme textTheme(BuildContext context) => TextTheme(
    bodyLarge: _textStyle(context),
    bodyMedium: _textStyle(context),
    bodySmall: _textStyle(context),
    titleLarge: _textStyle(context),
    titleMedium: _textStyle(context),
    titleSmall: _textStyle(context),
    labelLarge: _textStyle(context),
    labelMedium: _textStyle(context),
    labelSmall: _textStyle(context),
    displayLarge: _textStyle(context),
    displayMedium: _textStyle(context),
    displaySmall: _textStyle(context),
    headlineLarge: _textStyle(context),
    headlineMedium: _textStyle(context),
    headlineSmall: _textStyle(context),
  );

  static final TextSelectionThemeData textSelectionThemeData =
      const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      );

  static final ColorScheme colorScheme = const ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    error: AppColors.error,
  );

  static InputDecorationTheme inputDecorationTheme(BuildContext context) =>
      InputDecorationTheme(
        hintStyle: const TextStyle(color: AppColors.lightHint),
        filled: true,
        fillColor: AppColors.gray.withOpacity(0.2),
        contentPadding: EdgeInsets.symmetric(
          vertical: context.responsive.height12,
          horizontal: context.responsive.height15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.responsive.radius10),
          borderSide: BorderSide.none,
        ),
      );
}
