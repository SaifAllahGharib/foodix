import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_rating_widget.dart';

class ImageAndNameAndRatingWidget extends StatelessWidget {
  const ImageAndNameAndRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: Dimensions.height80 * 0.9,
          height: Dimensions.height80 * 0.9,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(" "),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius10),
          ),
        ),
        SizedBox(width: Dimensions.width20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bazoka",
              style: Styles.textStyle16(context),
            ),
            SizedBox(height: Dimensions.height10 * 0.2),
            Text(
              "Burger, Cheken, Beef",
              style: Styles.textStyle12(context),
            ),
            SizedBox(height: Dimensions.height10 * 0.2),
            const CustomRatingWidget(
              rating: 4.9,
              ratingCount: 1925,
            ),
          ],
        ),
      ],
    );
  }
}
