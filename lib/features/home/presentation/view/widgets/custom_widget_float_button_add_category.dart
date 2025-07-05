import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/main_seller/main_seller_cubit.dart';

import '../../../../../core/shared/models/category_model.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class CustomWidgetFloatButtonAddCategory extends StatelessWidget {
  final TextEditingController categoryController;

  const CustomWidgetFloatButtonAddCategory({
    super.key,
    required this.categoryController,
  });

  void _validation(BuildContext context) {
    context.read<MainSellerCubit>().enableButton(categoryController);
  }

  void _addCategory(BuildContext context) {
    context.navigator.pop();
    context.read<MainSellerCubit>().addCategory(
      CategoryModel(categoryName: categoryController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.responsive.radius20),
          topRight: Radius.circular(context.responsive.radius20),
        ),
      ),
      padding: EdgeInsets.all(context.responsive.height20),
      child: Column(
        children: [
          AppTextFormField(
            controller: categoryController,
            label: context.tr.category,
            hint: context.tr.category,
            onChanged: (val) => _validation(context),
          ),
          context.responsive.height20.verticalSpace,
          AppButton(
            text: context.tr.add,
            isEnabled: context.watch<MainSellerCubit>().isEnabled,
            onClick: () => _addCategory(context),
          ),
        ],
      ),
    );
  }
}
