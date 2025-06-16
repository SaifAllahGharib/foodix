import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';

class CustomItemListViewAddresses extends StatelessWidget {
  const CustomItemListViewAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      padding: EdgeInsets.all(Dimensions.height15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        border: Border.all(
          color: AppColors.gray,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "الدواجن حلوان البلد3",
            style: Styles.textStyle15(context).copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: Dimensions.height10),
          Text(
            "النصر عماره الحج نبوي 3, 9, بوابه الجيش",
            style: Styles.textStyle15(context).copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: Dimensions.height10),
          Text(
            "phone number: +201014890911",
            style: Styles.textStyle15(context).copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
