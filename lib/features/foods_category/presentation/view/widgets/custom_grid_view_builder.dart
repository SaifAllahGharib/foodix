import 'package:flutter/material.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/features/food_details/presentation/view/details_food_view.dart';

import 'grid_item_view.dart';

class CustomGridViewBuilder extends StatelessWidget {
  final List<FoodModel> foodsCategory;
  final void Function(int) onLongPressOnItem;

  const CustomGridViewBuilder({
    super.key,
    required this.foodsCategory,
    required this.onLongPressOnItem,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: context.responsive.height10,
        mainAxisSpacing: context.responsive.height10,
        childAspectRatio: Dimensions.screenHeight * 0.00087,
      ),
      padding: EdgeInsets.zero,
      itemCount: foodsCategory.length,
      itemBuilder: (context, index) {
        return GridItemView(
          food: foodsCategory[index],
          index: index,
          onClick: () {
            GoRouter.of(
              context,
            ).push(DetailsFoodView.id, extra: foodsCategory[index]);
          },
          onLongPress: onLongPressOnItem,
        );
      },
    );
  }
}
