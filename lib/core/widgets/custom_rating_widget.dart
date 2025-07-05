import 'package:flutter/material.dart';  
import 'package:foodix/core/utils/extensions.dart';  

class CustomRatingWidget extends StatelessWidget {
  final double rating;
  final int ratingCount;

  const CustomRatingWidget({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: context.responsive.iconSize20,
        ),
        context.responsive.width5.horizontalSpace,
        Text("$rating", style: context.textStyle.s15W500),
        context.responsive.width5.horizontalSpace,
        Text(
          "($ratingCount)",
          style: context.textStyle.s15W500.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
