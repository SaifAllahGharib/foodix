import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/features/foods_category/presentation/viewmodel/cubit/foods_category/foods_category_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class CustomOptionsFoodDialog extends StatelessWidget {
  final VoidCallback onClickEdit;
  final String foodId;
  final String categoryId;

  const CustomOptionsFoodDialog({
    super.key,
    required this.onClickEdit,
    required this.foodId,
    required this.categoryId,
  });

  void _deleteFood(BuildContext context, String categoryName, String foodId) {
    context.read<FoodsCategoryCubit>().deleteFood(categoryName, foodId);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        context.translate.chooseAnAction,
        style: Styles.textStyle18(context),
      ),
      content: Text(context.translate.doYouWantToEditOrDeleteThisItem),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
            onClickEdit();
          },
          child: Text(
            context.translate.edit,
            style: Styles.textStyle12(
              context,
            ).copyWith(color: AppColors.primaryColor),
          ),
        ),
        TextButton(
          onPressed: () {
            context.pop();
            _deleteFood(context, categoryId, foodId);
          },
          child: Text(
            context.translate.delete,
            style: Styles.textStyle12(context).copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
