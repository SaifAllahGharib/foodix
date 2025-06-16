import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';

class CustomItemListViewDetailsOrderSection extends StatelessWidget {
  const CustomItemListViewDetailsOrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "1",
                style: Styles.textStyle15(context).copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: Dimensions.width15),
              Text(
                "x",
                style: Styles.textStyle15(context).copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: Dimensions.width15),
              Text(
                "cocakola, 200m",
                style: Styles.textStyle15(context).copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const CustomRowCost(egp: 280),
        ],
      ),
    );
  }
}
