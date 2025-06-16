import 'package:flutter/material.dart';
import 'package:foodix/core/widgets/image_and_back_button.dart';
import 'package:foodix/features/food_details/presentation/view/widgets/custom_bottom_bar_food_details_seller.dart';
import 'package:foodix/features/food_details/presentation/view/widgets/food_name_and_desc.dart';

class FoodDetailsViewBody extends StatelessWidget {
  const FoodDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ImageAndBackButton(),
        FoodNameAndDesc(),
        Spacer(),
        CustomBottomBarFoodDetailsSeller(),
      ],
    );
  }
}
