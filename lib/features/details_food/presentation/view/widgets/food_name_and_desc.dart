import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/shared/models/food_model.dart';

class FoodNameAndDesc extends StatelessWidget {
  final FoodModel food;

  const FoodNameAndDesc({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.padding15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(food.foodName, style: context.textStyle.s20WB),
          context.responsive.height5.verticalSpace,
          Text(
            food.foodDesc,
            style: context.textStyle.s15W400.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
