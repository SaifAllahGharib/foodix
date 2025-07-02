import 'package:flutter/material.dart';
import 'package:foodix/core/utils/AppStyles.dart';
import 'package:foodix/core/utils/dimensionnt/presentation/view/widgets/custom_food_category_list_view.dart';

import '../../../../../core/shared/models/category_model.dart';

class CustomRestaurantProductList extends StatelessWidget {
  final List<CategoryModel> listOfFoodCategories;
  final List<GlobalKey> keys;

  const CustomRestaurantProductList({
    super.key,
    required this.listOfFoodCategories,
    required this.keys,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(listOfFoodCategories.length, (index) {
        return Column(
          key: keys[index],
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.responsive.height15,
                horizontal: context.responsive.height20,
              ),
              child: Text(
                listOfFoodCategories[index].categoryName!,
                style: context.textStyle.s18W600,
              ),
            ),
            CustomFoodCategoryListView(
              listOfFoodCategories: listOfFoodCategories[index].foods ?? [],
            ),
          ],
        );
      }),
    );
  }
}
