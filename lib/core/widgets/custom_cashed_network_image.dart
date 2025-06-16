import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodix/core/utils/custom_placeholder.dart';

class CustomCashedNetworkImage extends StatelessWidget {
  final String? imageURL;
  final String placeholder;
  final double? width;
  final double? height;

  const CustomCashedNetworkImage({
    super.key,
    this.imageURL,
    this.width,
    this.height,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    if (imageURL == null || imageURL!.trim().isEmpty) {
      return CustomPlaceholder(
        image: placeholder,
        width: width,
        height: height,
      );
    }

    return CachedNetworkImage(
      imageUrl: imageURL!,
      fit: BoxFit.cover,
      width: width,
      height: height,
      placeholder: (context, url) =>
          CustomPlaceholder(image: placeholder, width: width, height: height),
      errorWidget: (context, url, error) =>
          CustomPlaceholder(image: placeholder, width: width, height: height),
    );
  }
}
