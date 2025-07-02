import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

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
      style: context.textStyle.s11W400.copyWith(color: color),
    );
  }
}
