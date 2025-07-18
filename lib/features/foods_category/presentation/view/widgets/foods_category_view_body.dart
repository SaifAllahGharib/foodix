import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/routing/app_route_name.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/loading.dart';
import 'package:foodix/features/foods_category/presentation/viewmodel/cubit/foods_category/foods_category_cubit.dart';
import 'package:foodix/features/foods_category/presentation/viewmodel/cubit/foods_category/foods_category_state.dart';

import '../../../../../core/shared/models/food_model.dart';
import '../../../../../core/shared/page_state.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import '../../../../../core/widgets/custom_dialog_loading_widget.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../../home/presentation/view/widgets/custom_float_button.dart';
import '../../../../home/presentation/view/widgets/custom_search_text_field.dart';
import 'custom_edit_food_dialog.dart';
import 'custom_grid_view_builder.dart';
import 'custom_options_food_dialog.dart';

class FoodsCategoryViewBody extends StatefulWidget {
  final String categoryId;

  const FoodsCategoryViewBody({super.key, required this.categoryId});

  @override
  State<FoodsCategoryViewBody> createState() => _FoodsCategoryViewBodyState();
}

class _FoodsCategoryViewBodyState extends State<FoodsCategoryViewBody> {
  late final TextEditingController _searchFoodController;
  final List<FoodModel> _foodsCategory = [];

  @override
  void initState() {
    _searchFoodController = TextEditingController();
    context.read<FoodsCategoryCubit>().getFoodsCategory(widget.categoryId);
    super.initState();
  }

  @override
  void dispose() {
    _searchFoodController.dispose();
    super.dispose();
  }

  void _showOptionsDialog(FoodModel food) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<FoodsCategoryCubit>(),
        child: CustomOptionsFoodDialog(
          foodId: food.id!,
          categoryId: widget.categoryId,
          onClickEdit: () {
            _showEditDialog(food);
          },
        ),
      ),
    );
  }

  void _showEditDialog(FoodModel food) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<FoodsCategoryCubit>(),
        child: CustomEditFoodDialog(
          categoryName: widget.categoryId,
          food: food,
        ),
      ),
    );
  }

  void _handleState(FoodsCategoryState state) {
    final getFoodsStatus = state.getFoodsStatus;
    final updateFoodStatus = state.updateFoodStatus;
    final deleteFoodStatus = state.deleteFoodStatus;
    if (getFoodsStatus is PageSuccess<List<FoodModel>>) {
      _foodsCategory.clear();
      _foodsCategory.addAll(getFoodsStatus.data ?? []);
    } else if (getFoodsStatus is PageLoading ||
        deleteFoodStatus is PageLoading ||
        updateFoodStatus is PageLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const CustomDialogLoadingWidget(),
      );
    } else if (updateFoodStatus is PageSuccess ||
        deleteFoodStatus is PageSuccess) {
      context.navigator.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(context.responsive.padding20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          context.responsive.height20.verticalSpace,
          CustomSearchTextField(
            controller: _searchFoodController,
            isSeller: true,
            onChange: (value) {},
          ),
          context.responsive.height20.verticalSpace,
          Text(widget.categoryId, style: context.textStyle.s20WB),
          context.responsive.height20.verticalSpace,
          Expanded(
            child: BlocConsumer<FoodsCategoryCubit, FoodsCategoryState>(
              listener: (context, state) => _handleState(state),
              builder: (context, state) {
                final getFoodsStatus = state.getFoodsStatus;
                if (getFoodsStatus is PageLoading) {
                  return const Loading();
                } else if (getFoodsStatus is PageFailure<List<FoodModel>>) {
                  return CustomErrorWidget(
                    errorMessage: getFoodsStatus.message,
                  );
                }

                return _foodsCategory.isEmpty
                    ? const EmptyWidget()
                    : CustomGridViewBuilder(
                        foodsCategory: _foodsCategory,
                        onLongPressOnItem: (index) =>
                            _showOptionsDialog(_foodsCategory[index]),
                      );
              },
            ),
          ),
          CustomFloatButton(
            onClick: () => context.navigator.pushNamed(
              AppRouteName.addFood,
              arguments: widget.categoryId,
            ),
          ),
        ],
      ),
    );
  }
}
