import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  final Color color;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onClick,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: Dimensions.fontSize15,
        ),
      ),
    );
  }
}
