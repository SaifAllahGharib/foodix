import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

class CustomItemListViewAddresses extends StatelessWidget {
  const CustomItemListViewAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.responsive.padding10),
      padding: EdgeInsets.all(context.responsive.padding15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.responsive.radius20),
        border: Border.all(color: AppColors.gray, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("الدواجن حلوان البلد3", style: context.textStyle.s15W400),
          context.responsive.height10.verticalSpace,
          Text(
            "النصر عماره الحج نبوي 3, 9, بوابه الجيش",
            style: context.textStyle.s15W400,
          ),
          context.responsive.height10.verticalSpace,
          Text("phone number: +201014890911", style: context.textStyle.s15W400),
        ],
      ),
    );
  }
}
