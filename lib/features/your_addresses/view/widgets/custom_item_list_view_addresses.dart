import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';

class CustomItemListViewAddresses extends StatelessWidget {
  const CustomItemListViewAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.responsive.height10),
      padding: EdgeInsets.all(context.responsive.height15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.responsive.radius20),
        border: Border.all(color: AppColors.gray, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الدواجن حلوان البلد3",
            style: AppStyles.textStyle15(
              context,
            ).copyWith(fontWeight: FontWeight.w400),
          ),
          context.responsive.height10.verticalSpace,
          Text(
            "النصر عماره الحج نبوي 3, 9, بوابه الجيش",
            style: AppStyles.textStyle15(
              context,
            ).copyWith(fontWeight: FontWeight.w400),
          ),
          context.responsive.height10.verticalSpace,
          Text(
            "phone number: +201014890911",
            style: AppStyles.textStyle15(
              context,
            ).copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
