import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/AppStyles.dart';
import 'package:foodix/core/utils/dimensionom_text.dart';

import '../../../../../core/shared/models/food_model.dart';

class FoodNameAndDesc extends StatelessWidget {
  final FoodModel food;

  const FoodNameAndDesc({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: food.foodName,
            alignment: currentLocaleIsArabic
                ? Alignment.topLeft
                : Alignment.topLeft,
            textSize: context.responsive.height20 * 1.1,
          ),
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
