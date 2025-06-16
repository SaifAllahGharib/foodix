import 'package:flutter/material.dart';

import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/utils/styles.dart';
import 'package:foodix/core/widgets/custom_item_details_order.dart';

class InformationPaymentSection extends StatelessWidget {
  const InformationPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Information Payment",
            style: Styles.textStyle18(context),
          ),
          CustomItemDetailsOrder(
            startText: "total_basket",
            endText: "250",
          ),
          SizedBox(height: Dimensions.height10 * 0.5),
          CustomItemDetailsOrder(
            startText: "delivery",
            endText: "20",
          ),
          SizedBox(height: Dimensions.height10 * 0.5),
          CustomItemDetailsOrder(
            startText: "total",
            endText: "270",
          ),
          SizedBox(height: Dimensions.height20),
        ],
      ),
    );
  }
}
