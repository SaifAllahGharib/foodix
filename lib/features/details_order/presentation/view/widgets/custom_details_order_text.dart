import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

class CustomDetailsOrderText extends StatelessWidget {
  final String text;
  final Color color;

  const CustomDetailsOrderText({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.visible,
      style: Styles.textStyle15(context).copyWith(
        fontWeight: FontWeight.w400,
        fontSize: Dimensions.height10 * 1.15,
        color: color,
      ),
    );
  }
}
