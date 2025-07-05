import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomTimeWidget extends StatelessWidget {
  final String day;
  final String time;

  const CustomTimeWidget({super.key, required this.day, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          day,
          style: context.textStyle.s15W500.copyWith(color: AppColors.gray),
        ),
        context.responsive.width10.horizontalSpace,
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: context.responsive.iconSize12,
        ),
        context.responsive.width10.horizontalSpace,
        Text(
          time,
          style: context.textStyle.s15W500.copyWith(color: AppColors.gray),
        ),
      ],
    );
  }
}
