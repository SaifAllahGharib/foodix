import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_button.dart';
import 'package:foodix/core/widgets/custom_text_form_field.dart';

class CustomEditFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onClick;
  final void Function(String? val) onChanged;
  final bool isEnabled;
  final TextInputType textInputType;
  final String label;
  final String hint;

  const CustomEditFieldWidget({
    super.key,
    required this.controller,
    required this.onClick,
    required this.onChanged,
    required this.isEnabled,
    this.textInputType = TextInputType.text,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: Dimensions.width30 * 2,
              height: Dimensions.height10 * 0.8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5000),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height30),
          CustomTextFormField(
            controller: controller,
            label: label,
            hint: hint,
            textInputType: textInputType,
            onChanged: onChanged,
          ),
          SizedBox(height: Dimensions.height20),
          CustomButton(
            text: context.translate.edit,
            isEnabled: isEnabled,
            onClick: onClick,
          ),
        ],
      ),
    );
  }
}
