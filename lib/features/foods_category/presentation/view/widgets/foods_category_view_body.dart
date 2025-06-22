import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/foods_category/presentation/viewmodel/cubit/foods_category/foods_category_cubit.dart';
import 'package:foodix/features/foods_category/presentation/viewmodel/cubit/foods_category/foods_category_state.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../../add_food/presentation/view/add_food_view.dart';
import '../../../../home/presentation/view/widgets/custom_float_button.dart';
import '../../../../home/presentation/view/widgets/custom_grid_view_builder.dart';
import '../../../../home/presentation/view/widgets/custom_search_text_field.dart';

class FoodsCategoryViewBody extends StatefulWidget {
  final String categoryName;

  const FoodsCategoryViewBody({super.key, required this.categoryName});

  @override
  State<FoodsCategoryViewBody> createState() => _FoodsCategoryViewBodyState();
}

class _FoodsCategoryViewBodyState extends State<FoodsCategoryViewBody> {
  late final TextEditingController _searchFoodController;
  final List<FoodModel> _foodsCategory = [];

  @override
  void initState() {
    _searchFoodController = TextEditingController();
    context.read<FoodsCategoryCubit>().getFoodsCategory(widget.categoryName);
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
          Text(widget.categoryName, style: Styles.textStyle20(context)),
          SizedBox(height: Dimensions.height20),
          Expanded(
            child: BlocConsumer<FoodsCategoryCubit, FoodsCategoryState>(
              listener: (context, state) {
                if (state is FoodsCategorySuccess) {
                  _foodsCategory.clear();
                  _foodsCategory.addAll(state.foods ?? []);
                }
              },
              builder: (context, state) {
                if (state is FoodsCategoryLoading) {
                  return const Loading();
                } else if (state is FoodsCategoryFailure) {
                  return CustomErrorWidget(errorMessage: state.errorMsg);
                }

                return _foodsCategory.isEmpty
                    ? const EmptyWidget()
                    : CustomGridViewBuilder(foodsCategory: _foodsCategory);
              },
            ),
          ),
          CustomFloatButton(
            onClick: () =>
                context.push(AddFoodView.id, extra: widget.categoryName),
          ),
        ],
      ),
    );
  }
}
