import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_text_field.dart';
import 'package:foodix/features/home/presentation/viewmodel/cubits/main_seller/main_seller_cubit.dart';
import 'package:foodix/generated/l10n.dart';

import '../../../../../core/shared/models/ProductModel.dart';

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
    GoRouter.of(context).pop();
    context.read<MainSellerCubit>().addCategory(
      ProductModel(category: categoryController.text),
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
          topLeft: Radius.circular(Dimensions.radius20),
          topRight: Radius.circular(Dimensions.radius20),
        ),
      ),
      padding: EdgeInsets.all(Dimensions.height20),
      child: Column(
        children: [
          CustomTextField(
            controller: categoryController,
            hint: S.of(context).category,
            onChanged: (val) => _validation(context),
          ),
          SizedBox(height: Dimensions.height20),
          CustomButton(
            text: S.of(context).add,
            isEnabled: context.watch<MainSellerCubit>().isEnabled,
            onClick: () => _addCategory(context),
          ),
        ],
      ),
    );
  }
}
