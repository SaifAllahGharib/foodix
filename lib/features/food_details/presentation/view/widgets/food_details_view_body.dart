import 'package:flutter/material.dart';
import 'package:foodix/core/widgets/image_and_back_button.dart';
import 'package:foodix/features/food_details/presentation/view/widgets/custom_bottom_bar_food_details_seller.dart';
import 'package:foodix/features/food_details/presentation/view/widgets/food_name_and_desc.dart';

import '../../../../../core/shared/models/food_model.dart';

class FoodDetailsViewBody extends StatelessWidget {
  final FoodModel food;

  const FoodDetailsViewBody({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageAndBackButton(food: food),
        FoodNameAndDesc(food: food),
        const Spacer(),
        CustomBottomBarFoodDetailsSeller(food: food),
      ],
    );
  }
}
