import 'package:flutter/material.dart';
import 'package:foodix/core/utils/dimensions.dart';
import 'package:foodix/core/widgets/custom_row_cost.dart';

class CustomCostDelivery extends StatelessWidget {
  const CustomCostDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.motorcycle_outlined,
          size: Dimensions.height15,
          color: Colors.black54,
        ),
        SizedBox(width: Dimensions.height10 * 0.5),
        const CustomRowCost(
          egp: 15.99,
          color: Colors.grey,
        ),
      ],
    );
  }
}
