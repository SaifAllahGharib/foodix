import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import 'custom_dispaly_info_widget.dart';

class CustomMyRestaurantTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final VoidCallback onClickEdit;
  final String textFieldValue;
  final bool restaurantInfoIsEmpty;
  final void Function(String) onChanged;
  final TextInputType textInputType;

  const CustomMyRestaurantTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.onClickEdit,
    required this.textFieldValue,
    required this.hint,
    required this.restaurantInfoIsEmpty,
    required this.onChanged,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return !restaurantInfoIsEmpty
        ? CustomDisplayInfoWidget(
            label: label,
            onClickEdit: onClickEdit,
            textFieldValue: textFieldValue,
          )
        : CustomTextFormField(
            controller: controller,
            label: label,
            hint: hint,
            textInputType: textInputType,
            onChanged: onChanged,
          );
  }
}
