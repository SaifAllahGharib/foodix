import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';

import '../../../../../core/shared/models/category_model.dart';

class CustomCategoryTabBar extends StatelessWidget {
  final TabController tabController;
  final List<CategoryModel> list;
  final void Function(int index) onClickCategory;

  const CustomCategoryTabBar({
    super.key,
    required this.tabController,
    required this.list,
    required this.onClickCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: tabController,
        onTap: onClickCategory,
        enableFeedback: false,
        isScrollable: true,
        padding: EdgeInsets.zero,
        indicatorColor: Colors.black,
        dividerColor: AppColors.gray,
        labelColor: Colors.black,
        labelStyle: AppStyles.textStyle15(
          context,
        ).copyWith(fontWeight: FontWeight.w500),
        labelPadding: EdgeInsets.symmetric(
          vertical: context.responsive.height10,
          horizontal: Dimensions.width30,
        ),
        tabAlignment: TabAlignment.start,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: Colors.grey,
        indicatorPadding: EdgeInsets.only(
          right: Dimensions.width20,
          left: Dimensions.width20,
        ),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        tabs: List.generate(
          list.length,
          (index) => Text("${list[index].categoryName}"),
        ),
      ),
    );
  }
}
