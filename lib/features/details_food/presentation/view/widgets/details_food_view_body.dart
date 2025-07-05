import 'package:flutter/material.dart';
import 'package:foodix/core/widgets/image_and_back_button.dart';

import '../../../../../core/shared/models/food_model.dart';
import 'custom_bottom_bar_food_details_seller.dart';
import 'food_name_and_desc.dart';

class DetailsFoodViewBody extends StatelessWidget {
  final FoodModel food;

  const DetailsFoodViewBody({super.key, required this.food});

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
