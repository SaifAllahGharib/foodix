import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';
import 'package:foodix/features/food_details/presentation/view/widgets/edit_food_derails_widgets.dart';

import '../../../../../core/shared/models/food_model.dart';

class CustomBottomBarFoodDetailsSeller extends StatelessWidget {
  final FoodModel food;

  const CustomBottomBarFoodDetailsSeller({super.key, required this.food});

  void _showBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return const EditFoodDerailsWidgets();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Dimensions.height20),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.height10,
        horizontal: Dimensions.height30,
      ),
      width: double.infinity,
      height: Dimensions.height80 * 0.9,
      decoration: BoxDecoration(
        color: AppColors.whiteGray,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: CustomRowCost(
        mainAxisAlignment: MainAxisAlignment.center,
        egp: food.foodPrice,
        fontWeight: FontWeight.w500,
        fontSize: Dimensions.height20 * 0.9,
      ),
    );
  }
}
