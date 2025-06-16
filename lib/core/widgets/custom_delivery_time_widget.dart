import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

class CustomDeliveryTimeWidget extends StatelessWidget {
  final int time;

  const CustomDeliveryTimeWidget({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time_rounded,
          size: Dimensions.height20,
          color: Colors.grey,
        ),
        SizedBox(width: Dimensions.height10 * 0.5),
        Text(
          "$time",
          style: Styles.textStyle15(context).copyWith(color: Colors.grey),
        ),
        SizedBox(width: Dimensions.height10 * 0.3),
        Text(
          "minute",
          style: Styles.textStyle15(context).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
