import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/styles.dart';

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
                style: Styles.textStyle15(
                  context,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: Dimensions.height10),
              Container(
                width: double.infinity,
                height: Dimensions.height45 * 1.05,
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.height12,
                  horizontal: Dimensions.height15,
                ),
                decoration: BoxDecoration(
                  color: AppColors.gray.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Dimensions.radius10),
                ),
                child: Text(
                  textFieldValue,
                  style: Styles.textStyle15(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: Dimensions.width20),
        Container(
          width: Dimensions.height45 * 1.05,
          height: Dimensions.height45 * 1.05,
          decoration: BoxDecoration(
            color: AppColors.gray.withOpacity(0.2),
            borderRadius: BorderRadius.circular(Dimensions.radius10),
          ),
          child: IconButton(
            onPressed: onClickEdit,
            icon: const Icon(Icons.edit, color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
