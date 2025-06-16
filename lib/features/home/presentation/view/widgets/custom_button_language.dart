import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const CustomButtonLanguage({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Text(
        text,
        style: Styles.textStyle18(context)
            .copyWith(fontSize: Dimensions.fontSize18 * 0.9),
      ),
    );
  }
}
