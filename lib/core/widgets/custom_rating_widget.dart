import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

class CustomRatingWidget extends StatelessWidget {
  final double rating;
  final int ratingCount;

  const CustomRatingWidget(
      {super.key, required this.rating, required this.ratingCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: Dimensions.height20,
        ),
        SizedBox(width: Dimensions.height10 * 0.5),
        Text(
          "$rating",
          style:
              Styles.textStyle15(context).copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(width: Dimensions.height10 * 0.5),
        Text(
          "($ratingCount)",
          style: Styles.textStyle15(context).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
