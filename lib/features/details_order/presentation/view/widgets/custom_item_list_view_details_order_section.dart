import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
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
              Text("1", style: context.textStyle.s15W400),
              context.responsive.width15.horizontalSpace,
              Text("x", style: context.textStyle.s15W400),
              context.responsive.width15.horizontalSpace,
              Text("cocakola, 200m", style: context.textStyle.s15W400),
            ],
          ),
          const CustomRowCost(egp: 280),
        ],
      ),
    );
  }
}
