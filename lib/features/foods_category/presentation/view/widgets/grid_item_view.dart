import 'package:flutter/material.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/home/presentation/view/widgets/custom_image_food.dart';

import '../../../../../core/shared/functions/current_locale_is_arabic.dart';
import '../../../../../core/widgets/custom_row_cost.dart';

class GridItemView extends StatelessWidget {
  final FoodModel food;
  final int index;
  final VoidCallback onClick;
  final void Function(int index) onLongPress;

  const GridItemView({
    super.key,
    required this.food,
    required this.onClick,
    required this.onLongPress,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      onLongPress: () => onLongPress(index),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomImageFood(imageUrl: food.foodImage ?? ""),
            context.responsive.height10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.responsive.padding5,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: currentLocaleIsArabic
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      food.foodName,
                      style: context.textStyle.s18W600,
                    ),
                  ),
                  SizedBox(height: context.responsive.height10 * 0.7),
                  Align(
                    alignment: currentLocaleIsArabic
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
