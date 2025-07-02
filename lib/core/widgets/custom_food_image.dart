import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomFoodImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;

  const CustomFoodImage({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.responsive.radius20),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
      ),
    );
  }
}
