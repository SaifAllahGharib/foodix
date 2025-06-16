import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: Dimensions.width30 * 3,
        height: Dimensions.height10 * 0.8,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5000),
        ),
      ),
    );
  }
}
