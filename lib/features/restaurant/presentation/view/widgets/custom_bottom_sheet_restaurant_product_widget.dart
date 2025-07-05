import 'package:flutter/material.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/bottom_section_bottom_sheet_product.dart';
import 'package:foodix/features/restaurant/presentation/view/widgets/top_section_bottom_sheet_product.dart';

class CustomBottomSheetRestaurantProductWidget extends StatelessWidget {
  final int index;
  final double price;

  const CustomBottomSheetRestaurantProductWidget({
    super.key,
    required this.index,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopSectionBottomSheetProduct(),
          const Spacer(),
          BottomSectionBottomSheetProduct(index: index, price: price),
        ],
      ),
    );
  }
}
