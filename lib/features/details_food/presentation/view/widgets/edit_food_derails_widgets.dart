import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';
import 'package:foodix/core/widgets/app_text_form_field.dart';
import 'package:foodix/core/widgets/custom_divider.dart';

class EditFoodDerailsWidgets extends StatefulWidget {
  const EditFoodDerailsWidgets({super.key});

  @override
  State<EditFoodDerailsWidgets> createState() => _EditFoodDerailsWidgetsState();
}

class _EditFoodDerailsWidgetsState extends State<EditFoodDerailsWidgets> {
  late final TextEditingController _nameFood;
  late final TextEditingController _descFood;
  late final TextEditingController _costFood;

  @override
  void initState() {
    _nameFood = TextEditingController();
    _descFood = TextEditingController();
    _costFood = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameFood.dispose();
    _descFood.dispose();
    _costFood.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.responsive.height650,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: context.responsive.padding10,
          right: context.responsive.padding20,
          bottom: context.responsive.padding20,
          left: context.responsive.padding20,
        ),
        child: Column(
          children: [
            const CustomDivider(),
            context.responsive.height45.verticalSpace,
            AppTextFormField(
              controller: _nameFood,
              label: context.tr.foodName,
              hint: context.tr.foodName,
              onChanged: (val) {},
            ),
            context.responsive.height10.verticalSpace,
            AppTextFormField(
              controller: _descFood,
              label: context.tr.foodDesc,
              hint: context.tr.foodDesc,
              onChanged: (val) {},
            ),
            context.responsive.height10.verticalSpace,
            AppTextFormField(
              controller: _costFood,
              label: context.tr.foodCost,
              hint: context.tr.foodCost,
              onChanged: (val) {},
            ),
            context.responsive.height30.verticalSpace,
            AppButton(text: context.tr.edit, onClick: () {}),
          ],
        ),
      ),
    );
  }
}
