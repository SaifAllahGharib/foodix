import 'package:flutter/material.dart';

class Dimensions {
  static final MediaQueryData _mediaQuery = MediaQueryData.fromView(
    WidgetsBinding.instance.platformDispatcher.views.first,
  );

  static final double screenHeight = _mediaQuery.size.height;
  static final double screenWidth = _mediaQuery.size.width;

  // Dynamic Height Padding and Margin
  static final double height10 = screenHeight / 84.4;
  static final double height12 = screenHeight / 70;
  static final double height15 = screenHeight / 56.27;
  static final double height20 = screenHeight / 42.2;
  static final double height30 = screenHeight / 28.13;
  static final double height45 = screenHeight / 18.76;
  static final double height80 = screenHeight / 11.3;
  static final double height100 = screenHeight / 11.3;
  static final double height130 = screenHeight / 7;

  // Dynamic width padding and margin
  static final double width10 = screenWidth / 84.4;
  static final double width15 = screenWidth / 56.27;
  static final double width20 = screenWidth / 42.2;
  static final double width30 = screenWidth / 28.13;
  static final double width65 = screenWidth / 6.5;
  static final double width120 = screenWidth / 3.6;
  static final double width380 = screenWidth / 1.3;

  // Dynamic font size
  static final double fontSize12 = screenHeight / 65;
  static final double fontSize15 = screenHeight / 58.75;
  static final double fontSize18 = screenHeight / 48.3;
  static final double fontSize20 = screenHeight / 42.2;
  static final double fontSize30 = screenHeight / 28.2;

  // Dynamic radius
  static final double radius10 = screenHeight / 77.6;
  static final double radius15 = screenHeight / 56.27;
  static final double radius20 = screenHeight / 42.2;
  static final double radius30 = screenHeight / 28.13;

  // Dynamic icon size
  static final double iconSize16 = screenHeight / 52.75;
  static final double iconSize20 = screenHeight / 42.2;
  static final double iconSize24 = screenHeight / 35.17;
  static final double iconSize45 = screenHeight / 21.17;
}
