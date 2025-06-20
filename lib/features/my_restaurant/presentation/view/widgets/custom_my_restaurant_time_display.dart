import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/widgets/time_picker_widget.dart';
import 'custom_dispaly_info_widget.dart';

class CustomMyRestaurantTimeDisplay extends StatelessWidget {
  final String label;
  final VoidCallback onClickEdit;
  final String textValue;
  final String? time;
  final bool restaurantInfoIsEmpty;
  final VoidCallback onTap;

  const CustomMyRestaurantTimeDisplay({
    super.key,
    required this.label,
    required this.onClickEdit,
    required this.textValue,
    required this.time,
    required this.restaurantInfoIsEmpty,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return !restaurantInfoIsEmpty
        ? CustomDisplayInfoWidget(
            label: label,
            onClickEdit: onClickEdit,
            textFieldValue: textValue,
          )
        : TimePickerWidget(
            label: context.translate.closeTime,
            time: time,
            onTap: onTap,
          );
  }
}
