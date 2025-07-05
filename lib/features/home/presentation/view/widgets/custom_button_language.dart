import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

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
      child: Text(text, style: context.textStyle.s18W500),
    );
  }
}
