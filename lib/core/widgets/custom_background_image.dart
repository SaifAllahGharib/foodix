import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  final double height;
  final String image;

  const CustomBackgroundImage({
    super.key,
    required this.image,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
