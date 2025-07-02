import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';

import '../../../../../core/shared/models/category_model.dart';
import '../../../../foods_category/presentation/view/foods_category_view.dart';

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
      onTap: () => context.push(FoodsCategoryView.id, extra: list[index].id!),
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
