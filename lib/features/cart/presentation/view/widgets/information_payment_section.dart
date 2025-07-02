import 'package:flutter/material.dart';
import 'package:foodix/core/utils/extensions.dart';
import 'package:foodix/core/widgets/custom_item_details_order.dart';

class InformationPaymentSection extends StatelessWidget {
  const InformationPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.responsive.padding15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Information Payment", style: context.textStyle.s18W600),
          const CustomItemDetailsOrder(
            startText: "total_basket",
            endText: "250",
          ),
          context.responsive.height5.verticalSpace,
          const CustomItemDetailsOrder(startText: "delivery", endText: "20"),
          context.responsive.height5.verticalSpace,
          const CustomItemDetailsOrder(startText: "total", endText: "270"),
          context.responsive.height20.verticalSpace,
        ],
      ),
    );
  }
}
