import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_rating_widget.dart';

class ImageAndNameAndRatingWidget extends StatelessWidget {
  const ImageAndNameAndRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: context.responsive.height80 * 0.9,
          height: context.responsive.height80 * 0.9,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(" "),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(context.responsive.radius10),
          ),
        ),
        context.responsive.width20.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bazoka", style: context.textStyle.s16W500),
            SizedBox(height: context.responsive.height10 * 0.2),
            Text("Burger, Cheken, Beef", style: context.textStyle.s12W400),
            SizedBox(height: context.responsive.height10 * 0.2),
            const CustomRatingWidget(rating: 4.9, ratingCount: 1925),
          ],
        ),
      ],
    );
  }
}
