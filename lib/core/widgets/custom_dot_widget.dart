import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomDotWidget extends StatelessWidget {
  const CustomDotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.circle,
      size: context.responsive.height6,
      color: Colors.black54,
    );
  }
}
