import 'package:flutter/material.dart';
import 'package:foodix/core/shared/models/food_model.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(context.translate.edit, style: Styles.textStyle18(context)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              controller: _nameController,
              label: context.translate.labelName,
              hint: context.translate.hintNameRestaurant,
            ),
            SizedBox(height: Dimensions.height10),
            CustomTextFormField(
              controller: _descController,
              label: context.translate.foodDesc,
              hint: context.translate.foodDesc,
            ),
            SizedBox(height: Dimensions.height10),
            CustomTextFormField(
              controller: _costController,
              label: context.translate.foodCost,
              hint: context.translate.foodCost,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            context.translate.save,
            style: Styles.textStyle12(
              context,
            ).copyWith(color: AppColors.primaryColor),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            context.translate.cancel,
            style: Styles.textStyle12(context),
          ),
        ),
      ],
    );
  }
}
