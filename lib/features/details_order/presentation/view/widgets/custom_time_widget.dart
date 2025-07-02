import 'package:flutter/material.dart';

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
          style: AppStyles.textStyle15(
            context,
          ).copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        SizedBox(width: context.responsive.width10),
        Icon(
          Icons.circle,
          color: Colors.grey,
          size: context.responsive.width10 * 1.2,
        ),
        SizedBox(width: context.responsive.width10),
        Text(
          time,
          style: AppStyles.textStyle15(
            context,
          ).copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      ],
    );
  }
}
