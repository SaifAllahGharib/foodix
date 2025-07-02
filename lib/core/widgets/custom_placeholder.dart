import 'package:flutter/material.dart';
import 'package:foodix/core/widgets/custom_image.dart';

class CustomPlaceholder extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;

  const CustomPlaceholder({
    super.key,
    required this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CustomImage(image: image, width: width, height: height);
  }
}
