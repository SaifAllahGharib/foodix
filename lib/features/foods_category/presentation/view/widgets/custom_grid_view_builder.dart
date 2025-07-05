import 'package:flutter/material.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/utils/extensions.dart';

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
        childAspectRatio: context.responsive.screenHeight * 0.00087,
      ),
      padding: EdgeInsets.zero,
      itemCount: foodsCategory.length,
      itemBuilder: (context, index) {
        return GridItemView(
          food: foodsCategory[index],
          index: index,
          onClick: () {
            context.navigator.pushNamed(
              AppRouteName.detailsFood,
              arguments: foodsCategory[index],
            );
          },
          onLongPress: onLongPressOnItem,
        );
      },
    );
  }
}
