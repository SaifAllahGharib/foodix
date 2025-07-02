import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../styles/app_colors.dart';

class TimePickerWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String? time;

  const TimePickerWidget({
    super.key,
    required this.label,
    required this.onTap,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.responsive.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: context.textStyle.s15W600),
          context.responsive.height10.verticalSpace,
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: context.responsive.height47,
              padding: EdgeInsets.symmetric(
                vertical: context.responsive.padding12,
                horizontal: context.responsive.padding15,
              ),
              decoration: BoxDecoration(
                color: AppColors.gray.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                  context.responsive.radius10,
                ),
              ),
              child: Text(
                time!,
                style: time != context.tr.selectTime
                    ? context.textStyle.s15W500
                    : context.textStyle.s12W400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
