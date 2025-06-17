import 'package:flutter/material.dart';
import 'package:foodix/core/utils/colors.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/utils/styles.dart';

class TopSectionCustomItemOrderListView extends StatelessWidget {
  const TopSectionCustomItemOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "Today",
                style: Styles.textStyle15(
                  context,
                ).copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
              ),
              SizedBox(width: Dimensions.width10),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: Dimensions.width10 * 1.2,
              ),
              SizedBox(width: Dimensions.width10),
              Text(
                "12:30 PM",
                style: Styles.textStyle15(
                  context,
                ).copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.height10,
              horizontal: Dimensions.height20,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteGray,
              borderRadius: BorderRadius.circular(Dimensions.radius10),
            ),
            child: Text(
              context.translate.completed,
              style: Styles.textStyle15(
                context,
              ).copyWith(fontWeight: FontWeight.w500, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
