import 'package:flutter/material.dart';

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
              Text(
                label,
                style: AppStyles.textStyle15(
                  context,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              context.responsive.height10.verticalSpace,
              Container(
                width: double.infinity,
                height: Dimensions.height45 * 1.05,
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
                child: Text(
                  textFieldValue,
                  style: AppStyles.textStyle15(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        context.responsive.width20.horizontalSpace,
        Container(
          width: Dimensions.height45 * 1.05,
          height: Dimensions.height45 * 1.05,
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
