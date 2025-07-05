import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/shared/functions/current_locale_is_arabic.dart';

class CustomFloatButton extends StatelessWidget {
  final void Function() onClick;

  const CustomFloatButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: currentLocaleIsArabic
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(5000),
        ),
        padding: EdgeInsets.all(context.responsive.padding10),
        child: IconButton(
          onPressed: onClick,
          enableFeedback: false,
          icon: Icon(
            Icons.add,
            size: context.responsive.screenWidth * 0.070,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
