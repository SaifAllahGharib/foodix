import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/features/category_foods/presentation/view/category_foods_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/models/ProductModel.dart';

class CustomItemCategorySellerListView extends StatelessWidget {
  final int index;
  final List<ProductModel> list;
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
      onTap: () => context.push(CategoryFoodsView.id, extra: list[index]),
      contentPadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${list[index].category}", style: Styles.textStyle18(context)),
          if (index != list.length - 1) SizedBox(height: Dimensions.height20),
          if (index != list.length - 1)
            const Divider(height: 1, color: AppColors.gray),
          if (index != list.length - 1) SizedBox(height: Dimensions.height20),
        ],
      ),
    );
  }
}
