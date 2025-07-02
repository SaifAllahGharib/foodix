import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function() onClick;
  final Color color;

  const CustomTextButton({
    super.key,
    required this.text,
    required this.onClick,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        text,
        style: context.textStyle.s15W400.copyWith(color: color),
      ),
    );
  }
}
