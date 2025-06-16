import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;

  const CustomImage({
    super.key,
    required this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: AssetImage(image),
      image: AssetImage(image),
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}
