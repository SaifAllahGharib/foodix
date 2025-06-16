import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_divider.dart';
import 'package:foodix/core/widgets/custom_text_field.dart';
import 'package:foodix/generated/l10n.dart';

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
            CustomTextField(
              controller: _nameFood,
              hint: S.of(context).foodName,
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height10),
            CustomTextField(
              controller: _descFood,
              hint: S.of(context).foodDesc,
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height10),
            CustomTextField(
              controller: _costFood,
              hint: S.of(context).foodCost,
              onChanged: (val) {},
            ),
            SizedBox(height: Dimensions.height30),
            CustomButton(
              text: S.of(context).edit,
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
