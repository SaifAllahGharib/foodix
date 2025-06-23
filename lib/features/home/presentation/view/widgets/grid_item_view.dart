import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_image_food.dart';

import '../../../../../core/shared/viewmodel/cubits/local_cubit.dart';

class GridItemView extends StatelessWidget {
  final FoodModel food;
  final void Function() onClick;

  const GridItemView({super.key, required this.food, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomImageFood(imageUrl: food.foodImage ?? ""),
            SizedBox(height: Dimensions.height10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height10 * 0.5,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: context.watch<LocalCubit>().isArabic
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      food.foodName,
                      style: Styles.textStyle18(context),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10 * 0.7),
                  Align(
                    alignment: context.watch<LocalCubit>().isArabic
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: CustomRowCost(
                      egp: food.foodPrice,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
