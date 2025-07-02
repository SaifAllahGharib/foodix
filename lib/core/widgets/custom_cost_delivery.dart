import 'package:flutter/material.dart';

import '../../core/utils/extensions.dart';
import 'custom_row_cost.dart';

class CustomCostDelivery extends StatelessWidget {
  const CustomCostDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.motorcycle_outlined,
          size: context.responsive.iconSize14,
          color: Colors.black54,
        ),
        context.responsive.width5.horizontalSpace,
        const CustomRowCost(egp: 15.99, color: Colors.grey),
      ],
    );
  }
}
