import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../viewmodel/cubit/foods_category/foods_category_cubit.dart';

class CustomEditFoodDialog extends StatefulWidget {
  final FoodModel food;
  final String categoryName;

  const CustomEditFoodDialog({
    super.key,
    required this.food,
    required this.categoryName,
  });

  @override
  State<CustomEditFoodDialog> createState() => _CustomEditFoodDialogState();
}

class _CustomEditFoodDialogState extends State<CustomEditFoodDialog> {
  late final TextEditingController _nameController;
  late final TextEditingController _descController;
  late final TextEditingController _costController;

  @override
  void initState() {
    print("FOOD ID: ${widget.food.id}");
    _nameController = TextEditingController(text: widget.food.foodName);
    _descController = TextEditingController(text: widget.food.foodDesc);
    _costController = TextEditingController(
      text: widget.food.foodPrice.toString(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _costController.dispose();
    super.dispose();
  }

  void _updateFood() async {
    final updatedFood = FoodModel(
      id: widget.food.id,
      foodName: _nameController.text,
      foodDesc: _descController.text,
      foodPrice: double.tryParse(_costController.text.trim()) ?? 0.0,
      foodImage: '',
    );

    await context.read<FoodsCategoryCubit>().updateFood(
      widget.categoryName,
      updatedFood,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(context.tr.edit, style: context.textStyle.s18W600),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextFormField(
              controller: _nameController,
              label: context.tr.labelName,
              hint: context.tr.hintNameRestaurant,
            ),
            context.responsive.height10.verticalSpace,
            AppTextFormField(
              controller: _descController,
              label: context.tr.foodDesc,
              hint: context.tr.foodDesc,
            ),
            context.responsive.height10.verticalSpace,
            AppTextFormField(
              controller: _costController,
              label: context.tr.foodCost,
              hint: context.tr.foodCost,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            _updateFood();
          },
          child: Text(
            context.tr.save,
            style: context.textStyle.s12W400.copyWith(color: AppColors.primary),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(context.tr.cancel, style: context.textStyle.s12W400),
        ),
      ],
    );
  }
}
