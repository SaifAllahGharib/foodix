import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/widgets/custom_back_button.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/custom_category_tab_bar.dart';

import '../../../../../core/shared/models/category_model.dart';

class CustomAppBarRestaurantView extends StatelessWidget {
  final double opacity;
  final List<CategoryModel> list;
  final double appBarHeight;
  final TabController tabController;
  final void Function(int index) onClickCategory;

  const CustomAppBarRestaurantView({
    super.key,
    required this.opacity,
    required this.list,
    required this.appBarHeight,
    required this.onClickCategory,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            boxShadow: opacity >= 0.5
                ? [
                    const BoxShadow(
                      color: AppColors.gray,
                      blurRadius: 10,
                      spreadRadius: 0.8,
                      offset: Offset(0, 1),
                    ),
                  ]
                : null,
          ),
          height: Dimensions.height45 * 1.85,
          padding: EdgeInsets.only(
            left: Dimensions.width30,
            right: Dimensions.width30,
            top: context.responsive.height20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              Container(
                width: Dimensions.height45,
                height: Dimensions.height45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5000),
                  border: Border.all(color: AppColors.gray, width: 1),
                ),
                child: IconButton(
                  onPressed: () {},
                  enableFeedback: false,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.search_rounded,
                    size: context.responsive.iconSize24,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (appBarHeight >= Dimensions.height45 * 4)
          const Divider(height: 1, color: AppColors.gray),
        if (appBarHeight >= Dimensions.height45 * 4)
          CustomCategoryTabBar(
            tabController: tabController,
            onClickCategory: onClickCategory,
            list: list,
          ),
      ],
    );
  }
}
