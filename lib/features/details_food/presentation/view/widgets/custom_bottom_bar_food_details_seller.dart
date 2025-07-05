import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';

import '../../../../../core/shared/models/food_model.dart';

class CustomBottomBarFoodDetailsSeller extends StatelessWidget {
  final FoodModel food;

  const CustomBottomBarFoodDetailsSeller({super.key, required this.food});

  // void _showBottomSheet(BuildContext context) {
  //   showBottomSheet(
  //     context: context,
  //     backgroundColor: Colors.white,
  //     builder: (context) {
  //       return const EditFoodDerailsWidgets();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.responsive.padding20),
      padding: EdgeInsets.symmetric(
        vertical: context.responsive.padding10,
        horizontal: context.responsive.padding30,
      ),
      width: double.infinity,
      height: context.responsive.height70,
      decoration: BoxDecoration(
        color: AppColors.whiteGray,
        borderRadius: BorderRadius.circular(context.responsive.radius20),
      ),
      child: CustomRowCost(
        mainAxisAlignment: MainAxisAlignment.center,
        egp: food.foodPrice,
        fontWeight: FontWeight.w500,
        fontSize: context.responsive.height20 * 0.9,
      ),
    );
  }
}
