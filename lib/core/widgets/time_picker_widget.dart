import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/styles.dart';

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
      padding: EdgeInsets.only(bottom: Dimensions.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Styles.textStyle15(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: Dimensions.height10),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: Dimensions.height45 * 1.05,
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.height12,
                horizontal: Dimensions.height15,
              ),
              decoration: BoxDecoration(
                color: AppColors.gray.withOpacity(0.2),
                borderRadius: BorderRadius.circular(Dimensions.radius10),
              ),
              child: Text(
                time!,
                style: time != context.translate.selectTime
                    ? Styles.textStyle15(
                        context,
                      ).copyWith(fontWeight: FontWeight.w500)
                    : Styles.textStyle12(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
