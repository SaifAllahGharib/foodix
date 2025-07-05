import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class AppStyles {
  final BuildContext context;

  const AppStyles._(this.context);

  factory AppStyles.of(BuildContext context) => AppStyles._(context);

  /// ----------- Sizes 11 --------------------
  TextStyle get s11W400 => TextStyle(
    fontSize: context.responsive.fontSize11,
    fontWeight: FontWeight.w400,
  );

  /// -----------------------------------------

  /// ----------- Sizes 12 --------------------
  TextStyle get s12W400 => TextStyle(
    fontSize: context.responsive.fontSize12,
    fontWeight: FontWeight.w400,
  );

  /// -----------------------------------------

  /// ----------- Sizes 15 --------------------
  TextStyle get s15W400 => TextStyle(
    fontSize: context.responsive.fontSize15,
    fontWeight: FontWeight.w400,
  );

  TextStyle get s15W500 => TextStyle(
    fontSize: context.responsive.fontSize15,
    fontWeight: FontWeight.w500,
  );

  TextStyle get s15W600 => TextStyle(
    fontSize: context.responsive.fontSize15,
    fontWeight: FontWeight.w600,
  );

  /// -----------------------------------------

  /// ----------- Sizes 16 --------------------
  TextStyle get s16W500 => TextStyle(
    fontSize: context.responsive.fontSize16,
    fontWeight: FontWeight.w500,
  );

  /// -----------------------------------------

  /// ----------- Sizes 18 --------------------
  TextStyle get s18W500 => TextStyle(
    fontSize: context.responsive.fontSize18,
    fontWeight: FontWeight.w500,
  );

  TextStyle get s18W600 => TextStyle(
    fontSize: context.responsive.fontSize18,
    fontWeight: FontWeight.w600,
  );

  /// -----------------------------------------

  /// ----------- Sizes 20 --------------------
  TextStyle get s20WB => TextStyle(
    fontSize: context.responsive.fontSize20,
    fontWeight: FontWeight.bold,
  );

  /// -----------------------------------------

  /// ----------- Sizes 30 --------------------
  TextStyle get s30W600 => TextStyle(
    fontSize: context.responsive.fontSize30,
    fontWeight: FontWeight.w600,
  );

  /// -----------------------------------------
}
