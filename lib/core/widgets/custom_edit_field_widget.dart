import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/app_button.dart';

import 'app_text_form_field.dart';

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
      padding: EdgeInsets.all(context.responsive.padding15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: context.responsive.width60,
              height: context.responsive.height8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5000),
              ),
            ),
          ),
          context.responsive.height30.verticalSpace,
          AppTextFormField(
            controller: controller,
            label: label,
            hint: hint,
            textInputType: textInputType,
            onChanged: onChanged,
          ),
          context.responsive.height20.verticalSpace,
          AppButton(
            text: context.tr.edit,
            isEnabled: isEnabled,
            onClick: onClick,
          ),
        ],
      ),
    );
  }
}
