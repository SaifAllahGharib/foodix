import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/styles.dart';

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
          style: Styles.textStyle15(
            context,
          ).copyWith(fontWeight: fontWeight, color: color, fontSize: fontSize),
        ),
        SizedBox(width: Dimensions.width10),
        Text(
          context.translate.foodCost,
          style: Styles.textStyle15(context).copyWith(
            fontWeight: FontWeight.w400,
            color: color,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
