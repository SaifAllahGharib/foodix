import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';

abstract class Styles {
  static TextStyle textStyle12(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.height10 * 1.2,
      color: Colors.grey,
    );
  }

  static TextStyle textStyle15(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.fontSize15,
    );
  }

  static TextStyle textStyle16(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.height15 * 1.015,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyle18(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.fontSize18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    );
  }

  static TextStyle textStyle20(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.fontSize20,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle30(BuildContext context) {
    return TextStyle(
      fontSize: Dimensions.fontSize30,
      fontWeight: FontWeight.w600,
    );
  }
}
