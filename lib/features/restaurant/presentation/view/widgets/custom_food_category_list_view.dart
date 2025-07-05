import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/custom_bottom_sheet_restaurant_product_widget.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/custom_item_food_category_list_view.dart';

import '../../../../../core/shared/functions/current_locale_is_arabic.dart';
import '../../../../../core/shared/models/food_model.dart';

class CustomFoodCategoryListView extends StatelessWidget {
  final List<FoodModel> listOfFoodCategories;

  const CustomFoodCategoryListView({
    super.key,
    required this.listOfFoodCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.responsive.padding20,
        right: currentLocaleIsArabic ? context.responsive.padding15 : 0,
        left: currentLocaleIsArabic ? 0 : context.responsive.padding15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...listOfFoodCategories.map((food) {
            return CustomItemFoodCategoryListView(
              index: listOfFoodCategories.indexOf(food),
              listOfFood: listOfFoodCategories,
              foodImage: food.foodImage!,
              foodName: food.foodName,
              foodDesc: food.foodDesc,
              foodPrice: 22,
              onClickInItem: () {
                showBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return CustomBottomSheetRestaurantProductWidget(
                      index: listOfFoodCategories.indexOf(food),
                      price: 45,
                    );
                  },
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
