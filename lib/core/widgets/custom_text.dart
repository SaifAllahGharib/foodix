import 'package:flutter/material.dart';
import 'package:foodix/core/utils/styles.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final double? textSize;
  final AlignmentGeometry alignment;

  const CustomText({
    super.key,
    required this.text,
    this.fontFamily,
    this.textSize,
    this.alignment = Alignment.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        text,
        style: Styles.textStyle30(context).copyWith(
          fontFamily: fontFamily,
          fontSize: textSize,
        ),
      ),
    );
  }
}
