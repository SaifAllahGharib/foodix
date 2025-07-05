import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_background_image.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/custom_box_of_restaurant_details.dart';

class TopSectionRestaurantView extends StatelessWidget {
  const TopSectionRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsive.height130 * 2.15,
      child: Stack(
        children: [
          CustomBackgroundImage(
            image: " ",
            height: context.responsive.height130 * 1.6,
          ),
          const CustomBoxOfRestaurantDetails(),
        ],
      ),
    );
  }
}
