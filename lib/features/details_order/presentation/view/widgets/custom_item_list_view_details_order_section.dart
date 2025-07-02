import 'package:flutter/material.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';

class CustomItemListViewDetailsOrderSection extends StatelessWidget {
  const CustomItemListViewDetailsOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.responsive.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "1",
                style: AppStyles.textStyle15(
                  context,
                ).copyWith(fontWeight: FontWeight.w400, color: Colors.black),
              ),
              SizedBox(width: context.responsive.width15),
              Text(
                "x",
                style: AppStyles.textStyle15(
                  context,
                ).copyWith(fontWeight: FontWeight.w400, color: Colors.black),
              ),
              SizedBox(width: context.responsive.width15),
              Text(
                "cocakola, 200m",
                style: AppStyles.textStyle15(
                  context,
                ).copyWith(fontWeight: FontWeight.w400, color: Colors.black),
              ),
            ],
          ),
          const CustomRowCost(egp: 280),
        ],
      ),
    );
  }
}
