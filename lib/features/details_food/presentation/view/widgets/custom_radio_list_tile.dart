import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/styles/app_colors.dart';

class CustomRadioListTile extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;

  const CustomRadioListTile({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      enableFeedback: false,
      activeColor: AppColors.primary,
      value: value,
      groupValue: groupValue,
      title: Text(title, style: context.textStyle.s18W500),
      onChanged: onChanged,
    );
  }
}
