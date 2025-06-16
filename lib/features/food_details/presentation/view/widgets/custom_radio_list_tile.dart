import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/styles.dart';

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
      activeColor: AppColors.primaryColor,
      value: value,
      groupValue: groupValue,
      title: Text(
        title,
        style:
            Styles.textStyle18(context).copyWith(fontWeight: FontWeight.w500),
      ),
      onChanged: (value) {
        onChanged(value!);
      },
    );
  }
}
