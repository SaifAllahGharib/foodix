import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/features/food_details/presentation/view/food_details_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/models/category_model.dart';
import 'grid_item_view.dart';

class CustomGridViewBuilder extends StatelessWidget {
  final CategoryModel category;

  const CustomGridViewBuilder({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Dimensions.height10,
        mainAxisSpacing: Dimensions.height10,
        childAspectRatio: Dimensions.screenHeight * 0.00087,
      ),
      padding: EdgeInsets.zero,
      itemCount: category.foods!.length,
      itemBuilder: (context, index) {
        return GridItemView(
          index: index,
          category: category,
          onClick: () {
            GoRouter.of(context).push(FoodDetailsView.id);
          },
        );
      },
    );
  }
}
