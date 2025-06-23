import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_text.dart';

import '../../../../../core/shared/models/food_model.dart';
import '../../../../../core/shared/viewmodel/cubits/local_cubit.dart';

class FoodNameAndDesc extends StatelessWidget {
  final FoodModel food;

  const FoodNameAndDesc({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: food.foodName,
            alignment: context.watch<LocalCubit>().isArabic
                ? Alignment.topLeft
                : Alignment.topLeft,
            textSize: Dimensions.height20 * 1.1,
          ),
          SizedBox(height: Dimensions.height10 * 0.5),
          Text(
            food.foodDesc,
            style: Styles.textStyle15(context).copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
