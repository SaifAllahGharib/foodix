import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/shared/models/category_model.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../../add_food/presentation/view/add_food_view.dart';
import '../../../../home/presentation/view/widgets/custom_float_button.dart';
import '../../../../home/presentation/view/widgets/custom_grid_view_builder.dart';
import '../../../../home/presentation/view/widgets/custom_search_text_field.dart';

class CategoryFoodsViewBody extends StatefulWidget {
  final CategoryModel category;

  const CategoryFoodsViewBody({super.key, required this.category});

  @override
  State<CategoryFoodsViewBody> createState() => _CategoryFoodsViewBodyState();
}

class _CategoryFoodsViewBodyState extends State<CategoryFoodsViewBody> {
  late final TextEditingController _searchFoodController;

  @override
  void initState() {
    _searchFoodController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchFoodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          SizedBox(height: Dimensions.height20),
          CustomSearchTextField(
            controller: _searchFoodController,
            isSeller: true,
            onChange: (value) {},
          ),
          SizedBox(height: Dimensions.height20),
          Text(
            widget.category.categoryName!,
            style: Styles.textStyle20(context),
          ),
          SizedBox(height: Dimensions.height20),
          Expanded(
            child: widget.category.foods!.isEmpty
                ? const EmptyWidget()
                : CustomGridViewBuilder(category: widget.category),
          ),
          CustomFloatButton(
            onClick: () => context.push(
              AddFoodView.id,
              extra: widget.category.categoryName,
            ),
          ),
        ],
      ),
    );
  }
}
