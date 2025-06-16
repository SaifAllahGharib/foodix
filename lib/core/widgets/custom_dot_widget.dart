import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';

class CustomDotWidget extends StatelessWidget {
  const CustomDotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      size: Dimensions.height10 * 0.6,
      color: Colors.black54,
    );
  }
}
