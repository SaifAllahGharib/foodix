import 'package:flutter/material.dart';
import 'package:foodix/core/styles/app_colors.dart';
import 'package:foodix/core/utils/extensions.dart';

class TopSectionCustomItemOrderListView extends StatelessWidget {
  const TopSectionCustomItemOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.responsive.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "Today",
                style: context.textStyle.s15W500.copyWith(color: Colors.grey),
              ),
              SizedBox(width: context.responsive.width10),
              Icon(
                Icons.circle,
                color: Colors.grey,
                size: context.responsive.width10 * 1.2,
              ),
              SizedBox(width: context.responsive.width10),
              Text(
                "12:30 PM",
                style: context.textStyle.s15W500.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: context.responsive.height10,
              horizontal: context.responsive.height20,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteGray,
              borderRadius: BorderRadius.circular(context.responsive.radius10),
            ),
            child: Text(
              context.tr.completed,
              style: context.textStyle.s15W500.copyWith(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
