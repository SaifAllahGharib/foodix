import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomRowCost extends StatelessWidget {
  final num egp;
  final FontWeight fontWeight;
  final Color color;
  final double? fontSize;
  final MainAxisAlignment mainAxisAlignment;

  const CustomRowCost({
    super.key,
    required this.egp,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black,
    this.fontSize,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          "$egp",
          style: context.textStyle.s15W400.copyWith(
            fontWeight: fontWeight,
            color: color,
            fontSize: fontSize,
          ),
        ),
        SizedBox(width: context.responsive.width10),
        Text(
          context.tr.foodCost,
          style: context.textStyle.s15W400.copyWith(
            color: color,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
