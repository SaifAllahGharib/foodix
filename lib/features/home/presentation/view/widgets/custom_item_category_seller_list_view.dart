import 'package:flutter/material.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/shared/models/category_model.dart';

class CustomItemCategorySellerListView extends StatelessWidget {
  final int index;
  final List<CategoryModel> list;
  final TextEditingController searchFoodController;

  const CustomItemCategorySellerListView({
    super.key,
    required this.index,
    required this.list,
    required this.searchFoodController,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.navigator.pushNamed(
        AppRouteName.foodsCategory,
        arguments: list[index].id!,
      ),
      contentPadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${list[index].categoryName}", style: context.textStyle.s18W600),
          if (index != list.length - 1)
            context.responsive.height20.verticalSpace,
          if (index != list.length - 1)
            const Divider(height: 1, color: AppColors.gray),
          if (index != list.length - 1)
            context.responsive.height20.verticalSpace,
        ],
      ),
    );
  }
}
