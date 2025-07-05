import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';

import '../../../../../core/styles/app_colors.dart';

class CustomDisplayInfoWidget extends StatelessWidget {
  final String label;
  final String textFieldValue;
  final VoidCallback onClickEdit;

  const CustomDisplayInfoWidget({
    super.key,
    required this.label,
    required this.textFieldValue,
    required this.onClickEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: context.textStyle.s15W600),
              context.responsive.height10.verticalSpace,
              Container(
                width: double.infinity,
                height: context.responsive.height47,
                padding: EdgeInsets.symmetric(
                  vertical: context.responsive.height12,
                  horizontal: context.responsive.height15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.gray.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                    context.responsive.radius10,
                  ),
                ),
                child: Text(textFieldValue, style: context.textStyle.s15W500),
              ),
            ],
          ),
        ),
        context.responsive.width20.horizontalSpace,
        Container(
          width: context.responsive.height47,
          height: context.responsive.height47,
          decoration: BoxDecoration(
            color: AppColors.gray.withOpacity(0.2),
            borderRadius: BorderRadius.circular(context.responsive.radius10),
          ),
          child: IconButton(
            onPressed: onClickEdit,
            icon: const Icon(Icons.edit, color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
