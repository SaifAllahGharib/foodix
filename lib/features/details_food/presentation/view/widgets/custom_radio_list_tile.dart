import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colorles.dart';

class CustomRadioListTile extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final ValueChanged<String> onChanged;

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
      title: Text(
        title,
        style: AppStyles.textStyle18(
          context,
        ).copyWith(fontWeight: FontWeight.w500),
      ),
      onChanged: (value) {
        onChanged(value!);
      },
    );
  }
}
