import 'package:flutter/material.dart';

class AppButtonLanguage extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const AppButtonLanguage({
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
        style: AppStyles.textStyle18(
          context,
        ).copyWith(fontSize: Dimensions.fontSize18 * 0.9),
      ),
    );
  }
}
