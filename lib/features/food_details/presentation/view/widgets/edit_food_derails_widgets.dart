import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_divider.dart';
import 'package:foodix/core/widgets/custom_text_form_field.dart';

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
      height: Dimensions.height130 * 5,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: Dimensions.height10,
          right: Dimensions.height20,
          bottom: Dimensions.height20,
          left: Dimensions.height20,
        ),
        child: Column(
          children: [
            const CustomDivider(),
            SizedBox(height: Dimensions.height45),
            CustomTextFormField(
              controller: _nameFood,
              label: context.translate.foodName,
              hint: context.translate.foodName,
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height10),
            CustomTextFormField(
              controller: _descFood,
              label: context.translate.foodDesc,
              hint: context.translate.foodDesc,
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height10),
            CustomTextFormField(
              controller: _costFood,
              label: context.translate.foodCost,
              hint: context.translate.foodCost,
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height30),
            CustomButton(text: context.translate.edit, onClick: () {}),
          ],
        ),
      ),
    );
  }
}
