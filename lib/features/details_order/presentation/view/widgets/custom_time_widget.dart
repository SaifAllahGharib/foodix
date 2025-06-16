import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

class CustomTimeWidget extends StatelessWidget {
  final String day;
  final String time;

  const CustomTimeWidget({
    super.key,
    required this.day,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          day,
          style: Styles.textStyle15(context).copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: Dimensions.width10),
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: Dimensions.width10 * 1.2,
        ),
        SizedBox(width: Dimensions.width10),
        Text(
          time,
          style: Styles.textStyle15(context).copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
