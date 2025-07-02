import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../shared/functions/current_locale_is_arabic.dart';

class CustomBackButton extends StatelessWidget {
  final Color color;

  const CustomBackButton({super.key, this.color = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: currentLocaleIsArabic ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        width: context.responsive.height40,
        height: context.responsive.height40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5000),
          border: Border.all(color: AppColors.gray, width: 1),
        ),
        child: IconButton(
          onPressed: () => context.navigator.pop(),
          enableFeedback: false,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(
            Icons.arrow_back,
            size: context.responsive.iconSize20,
            color: color,
          ),
        ),
      ),
    );
  }
}
