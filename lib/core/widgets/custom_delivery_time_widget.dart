import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomDeliveryTimeWidget extends StatelessWidget {
  final int time;

  const CustomDeliveryTimeWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time_rounded,
          size: context.responsive.iconSize20,
          color: Colors.grey,
        ),
        context.responsive.width5.horizontalSpace,
        Text(
          "$time",
          style: context.textStyle.s15W400.copyWith(color: Colors.grey),
        ),
        SizedBox(width: context.responsive.height3),
        Text(
          "minute",
          style: context.textStyle.s15W400.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
