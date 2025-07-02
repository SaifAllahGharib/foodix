import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: context.responsive.width90,
        height: context.responsive.height8,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5000),
        ),
      ),
    );
  }
}
